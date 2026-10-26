" Vim-plug
" PlugInstall [name ...] [#threads]   Install plugins
" PlugUpdate [name ...] [#threads]    Install or update plugins
" PlugClean[!]                        Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade                         Upgrade vim-plug itself
" PlugStatus                          Check the status of plugins
" PlugDiff                            Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]       Generate script for restoring the current snapshot of the plugins

" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Sensible
Plug 'tpope/vim-sensible'

" Visual related packages

" Everforest
Plug 'sainnhe/everforest'

" Lightline
Plug 'itchyny/lightline.vim'

" Gitgutter
Plug 'airblade/vim-gitgutter'

" File related packages

" NERDTree
Plug 'preservim/nerdtree'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Editing related packages

" Surround
Plug 'tpope/vim-surround'

" Call plug#end to update &runtimepath and initialize the plugin system.
" - It automatically executes `filetype plugin indent on` and `syntax enable`
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" Basic settings

" Show line numbers.
set number

" Show relative line numbers.
set relativenumber

" Show lines above and below cursor when possible
set scrolloff=5

" Line break
set linebreak

" Set Tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable mouse for all modes
set mouse+=a

" Show matching braces when text indicator is over them
set showmatch

" Disable highlight matches
set nohlsearch

" Make search case-sensitive only if the search contains any capital letters
set ignorecase
set smartcase

" Split in a natural way
set splitbelow
set splitright

" Skip redrawing screen in some cases
set lazyredraw

" Command-line completion mode
set wildmode=list:longest

" Better completion
set completeopt=menuone,noinsert,noselect

" Neovim defaults that Vim lacks
set autoindent
set belloff=all
set hidden
set nojoinspaces
if has('termguicolors')
  set termguicolors
endif

" Key mappings

" Better window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Stay in indent mode
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Plugins settings start

" Visual related settings

" Colorscheme
set background=dark
let g:everforest_better_performance = 1
try
  colorscheme everforest
catch
  echomsg 'Colorscheme everforest not found! Using default.'
  colorscheme default
endtry

" Lightline
let g:lightline = {'colorscheme': 'everforest'}

" Gitgutter
set updatetime=100

" File related settings

" NERDTree
let NERDTreeShowHidden=1
nnoremap <silent> <Space>e :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
nnoremap <silent> ; :CtrlPBuffer<CR>
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat^=%f:%l:%c:%m
  let g:ctrlp_user_command = 'rg %s --files --hidden --follow --glob "!.git"'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_follow_symlinks = 1
endif
nnoremap <silent> K :execute 'silent grep! -w ' . shellescape(expand('<cword>'), 1)<CR>:cwindow<CR>:redraw!<CR>

" Plugins settings end
