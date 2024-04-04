" Vim-plug
" PlugInstall     Install plugins
" PlugUpdate  	  Install or update plugins
" PlugClean 	    Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade	    Upgrade vim-plug itself
" PlugStatus	    Check the status of plugins
" PlugDiff        Examine changes from the previous update and the pending changes
" PlugSnapshot    Generate script for restoring the current snapshot of the plugins

" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.

" Visual related packages

" Nightfox
Plug 'EdenEast/nightfox.nvim'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Completion related packages

" CMP
Plug 'hrsh7th/nvim-cmp'                     " Auto completion engine

" CMP related packages
Plug 'hrsh7th/cmp-buffer'                   " Buffer completion for nvim-cmp
Plug 'hrsh7th/cmp-path'                     " Path completion for nvim-cmp
Plug 'hrsh7th/cmp-cmdline'                  " Cmdline completion for nvim-cmp (?)
Plug 'saadparwaiz1/cmp_luasnip'             " LuaSnip completion for nvim-cmp

" Snippets
Plug 'L3MON4D3/LuaSnip', { 'tag': 'v2.*', 'do': 'make install_jsregexp' } " LuaSnip
Plug 'honza/vim-snippets'                                                 " Useful snippets

" Mason
" Mason                       Opens a graphical status window
" MasonInstall <package>      Installs/reinstalls the provided packages
" MasonUninstall <package>    Uninstalls the provided packages
" MasonUninstallAll           Uninstalls all packages
" MasonLog                    Opens the mason.nvim log file in a new tab window

" Mason
Plug 'williamboman/mason.nvim'              " LSP/DAP/Linters/Formatters Installer

" File related packages

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

" Editing related packages

" Surround
Plug 'kylechui/nvim-surround', { 'tag' : '*' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Autopairs
Plug 'windwp/nvim-autopairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

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

" Visual settings

" Colorscheme
lua require('core.colorscheme')

" Lualine
lua require('plugins.lualine')

" Treesitter
lua require('plugins.treesitter')

" Completion settings

" CMP
lua require('plugins.cmp')

" Mason settings

" Mason
lua require('plugins.mason')

" File settings

" Telescope
lua require('plugins.telescope')

" Editing settings

" Surround
lua require('plugins.surround')

" Autopairs
lua require('plugins.autopairs')

" Plugins settings end
