" Plugin section

call plug#begin()

" Python mode
" Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Sensible defaults
Plug 'tpope/vim-sensible'

" Surrounding mappings
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Commenting
Plug 'tpope/vim-commentary'

" save sessions
Plug 'tpope/vim-obsession'
Plug 'gshpychka/vim-lazy-obsession'

" Git diff in the gutter
Plug 'airblade/vim-gitgutter'

" Autocompletion
" Plug 'valloric/youcompleteme'

" View file structure
Plug 'majutsushi/tagbar'

" Solarized color scheme
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File browser
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'antoinemadec/coc-fzf'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Filetype icons
Plug 'ryanoasis/vim-devicons'

" Debugger
Plug 'puremourning/vimspector'

" Notebook-like workflow
Plug 'jpalardy/vim-slime', { 'for': 'python', 'branch': 'main' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

call plug#end()

