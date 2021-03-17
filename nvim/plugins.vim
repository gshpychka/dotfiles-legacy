" Plugin section

call plug#begin()
" Sensible defaults
Plug 'tpope/vim-sensible'

" Surrounding mappings
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Commenting
Plug 'tpope/vim-commentary'

" Git diff in the gutter
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'

" View file structure
" Plug 'majutsushi/tagbar'

" async tagbar
Plug 'liuchengxu/vista.vim'

" Solarized color scheme
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" renders colors. adds 200ms to startup
" Plug 'lilydjwg/colorizer'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Match tmux statusline colors
" Plug 'edkolev/tmuxline.vim'

" Merge statusline and tmuxline
Plug 'vimpostor/vim-tpipeline'

" File browser
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vwxyutarooo/nerdtree-devicons-syntax', { 'on': 'NERDTreeToggle' }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Text alignment
Plug 'tommcdo/vim-lion'

" Navigate tmux windows via C-hjkl
Plug 'christoomey/vim-tmux-navigator'

" .tmux.conf editing conveniences
Plug 'tmux-plugins/vim-tmux'

" SQL Workbench integration
" Plug 'cosminadrianpopescu/vim-sql-workbench'

" Filetype icons
Plug 'ryanoasis/vim-devicons'

" Fix CursorHold Performance
Plug 'antoinemadec/FixCursorHold.nvim'

" Show code minimap
Plug 'wfxr/minimap.vim'

" Debugger
Plug 'puremourning/vimspector', { 'for': 'python' }

" Notebook-like workflow
Plug 'jpalardy/vim-slime', { 'for': 'python', 'branch': 'main', 'on': 'SlimeSend1'}
Plug 'gshpychka/vim-ipython-cell', { 'for': 'python', 'on': 'SlimeSend1'}

" black fixer
Plug 'psf/black', { 'for': 'python', 'on': 'Black' }

" LSP setup
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
Plug 'neovim/nvim-lspconfig'
" Plug 'gshpychka/lspsaga.nvim', { 'branch': 'patch-1' }
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
