" Comments in Vimscript start with a ".

" Vim-Plug
" PlugInstall  	Install plugins
" PlugUpdate  	Install or update plugins
" PlugClean 	Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins

" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

" Coc
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Vimtex
Plug 'lervag/vimtex'

" Markdown Preview
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Autopairs
Plug 'jiangmiao/auto-pairs'

" Surround
Plug 'tpope/vim-surround'

" Easymotion
Plug 'easymotion/vim-easymotion'

" Incsearch
Plug 'haya14busa/incsearch.vim'

" Incsearch Easymotion
Plug 'haya14busa/incsearch-easymotion.vim'

" NERDTree
Plug 'preservim/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'

" Ack
Plug 'mileszs/ack.vim'

" Fugitive
Plug 'tpope/vim-fugitive'

" Gundo
Plug 'sjl/gundo.vim'

" GruvBox
Plug 'morhetz/gruvbox'

" Lightline
Plug 'itchyny/lightline.vim'

" Limelight
Plug 'junegunn/limelight.vim'

" Show marks
Plug 'kshenoy/vim-signature'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Plugins settings start

" Coc
let g:coc_global_extensions = [
  \'coc-snippets',
  \'coc-vimtex',
  \'coc-yaml',
  \'coc-tsserver',
  \'coc-pyright',
  \'coc-json',
  \'coc-clangd'
  \]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Markdown Preview
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css = './css/github-markdown.css'

" Easymotion
map <Space> <Plug>(easymotion-prefix)

" Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Incsearch Easymotion
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" GruvBox and Lightline
let g:gruvbox_termcolors=256
if has('gui_running')
  set background=light
  let g:lightline = {'colorscheme': 'solarized'}
else
  set background=dark
  let g:lightline = {'colorscheme': 'gruvbox'}
endif
colorscheme gruvbox

" Limelight
let g:limelight_conceal_ctermfg = 'gray'

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Ctrlp
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" Ack
command -nargs=+ Gag Gcd | Ack! <args>
nnoremap K :Gag "\b<C-R><C-W>\b"<CR>:cw<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ackprg = 'ag --vimgrep'
endif

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
  let g:gundo_prefer_python3 = 1
endif

" Plugins settings end

" Vim is based on Vi. Setting nocompatible switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as foo, and then Vim started with
" vim -u foo).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Show matching braces when text indicator is over themda
set showmatch 

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Line break
set linebreak

" Auto Indent
set autoindent

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via :qa!. We find
" hidden buffers helpful enough to disable this protection. See :help hidden
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Highlight search
"set hlsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Unbind some key bindings for tmux
map <C-a> <Nop>
map <C-x> <Nop>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"" GruvBox search
"nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
"nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
"nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
"nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
"nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
"nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" Setting Tab to 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Show lines above and below cursor (when possible)
set scrolloff=10 

" Split in a natural way
set splitbelow
set splitright

"" Enable file type detection
"filetype plugin indent on

"" Tab completion for files/bufferss
"set wildmode=longest,list
"set wildmenu

"" Set list to see tabs and non-breakable spaces
"set listchars=tab:>>,nbsp:~

" Allow local customization in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
