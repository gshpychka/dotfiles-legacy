" Plugin section

call plug#begin()

" Python mode
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Enchanced Python highlighting
" Plug 'vim-python/python-syntax', {'for': 'python'}

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

" Autocompletion
" Plug 'valloric/youcompleteme'

" View file structure
" Plug 'majutsushi/tagbar'

" async tagbar
Plug 'liuchengxu/vista.vim'

" Solarized color scheme
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Match tmux statusline colors
" Plug 'edkolev/tmuxline.vim'

" Merge statusline and tmuxline
Plug 'vimpostor/vim-tpipeline'

" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'antoinemadec/coc-fzf'

" Linting
" Plug 'w0rp/ale'

" Text alignment
Plug 'tommcdo/vim-lion'

" Navigate tmux windows via C-hjkl
Plug 'christoomey/vim-tmux-navigator'

" .tmux.conf editing conveniences
Plug 'tmux-plugins/vim-tmux'

" SQL Workbench integration
" Plug 'cosminadrianpopescu/vim-sql-workbench'

" CoC (completion)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Filetype icons
Plug 'ryanoasis/vim-devicons'

" Debugger
Plug 'puremourning/vimspector'

" Notebook-like workflow
Plug 'jpalardy/vim-slime', { 'for': 'python', 'branch': 'main' }
Plug 'gshpychka/vim-ipython-cell', { 'for': 'python' }

" LSP python setup
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
