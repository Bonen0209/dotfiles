" Vim-plug
" PlugInstall [name ...] [#threads]   Install plugins
" PlugUpdate [name ...] [#threads]    Install or update plugins
" PlugClean[!]                        Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade                         Upgrade vim-plug itself
" PlugStatus	                        Check the status of plugins
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

" Visual related packages

" Nightfox
Plug 'EdenEast/nightfox.nvim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" Gitsigns
Plug 'lewis6991/gitsigns.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" File related packages

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Editing related packages

" Surround
Plug 'kylechui/nvim-surround', { 'tag' : '*' }

" Autopairs
Plug 'windwp/nvim-autopairs'

" Completion related packages

" CMP
Plug 'hrsh7th/nvim-cmp'

" CMP related packages
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip', { 'tag': 'v2.*', 'do': 'make install_jsregexp' }
Plug 'rafamadriz/friendly-snippets'

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

" Enable visual bell
set visualbell

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

" Decent wildmenu
set wildmenu
set wildmode=list:longest

" Better completion
set completeopt=menuone,noinsert,noselect

" Set list to see tabs and non-breakable spaces
set listchars=tab:>>,nbsp:~

" Key mappings
lua require('core.keymaps')

" Plugins settings start

" Visual related settings

" Colorscheme
lua require('core.colorscheme')

" Lualine
lua require('plugins.lualine')

" Treesitter
lua require('plugins.treesitter')

" File related settings

" Telescope
lua require('plugins.telescope')

" Editing related settings

" Surround
lua require('plugins.surround')

" Autopairs
lua require('plugins.autopairs')

" Completion related settings

" CMP
lua require('plugins.cmp')

" Plugins settings end
