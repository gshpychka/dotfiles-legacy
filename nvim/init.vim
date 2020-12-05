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

" Line numbers
set number relativenumber

" Tabs and indents
set expandtab           " Use spaces instead of tabs
set tabstop=4           " Tab indents by 4 spaces
set shiftwidth=4        " >> indents by 4 spaces
set shiftround          " Round the number of spaces
set autoindent          " Keep indentation

set hidden              " Switch between buffers without having to save first
set display=lastline    " Show as much as possible of the last line

set ttyfast             " Faster redrawing
set lazyredraw          " Only redraw when necessary

set wrapscan            " Searches wrap around EOF

" Styling
syntax enable

" Colorscheme
" let g:gruvbox_termcolors=16
" set t_Co=16
set termguicolors
set background=dark
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

" Allow `//` comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+

" NERDTree config
let g:NERDTreeMapActivateNode='l'
let g:NERDTreeShowHidden=1
" Quit if NERDTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree git icons
let g:NERDTreeGitStatusUseNerdFonts = 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'',
                \ 'Untracked' :'',
                \ 'Renamed'   :'凜',
                \ 'Unmerged'  :'',
                \ 'Deleted'   :'',
                \ 'Dirty'     :'',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeQuitOnOpen = 1

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

let g:vimspector_enable_mappings = 'HUMAN'

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow

" Key mapping
nnoremap <silent> <C-f> :NERDTreeToggle<CR>
nnoremap <silent> <C-b> :TagbarToggle<CR>
" switch buffer if focused on NERDTree and bring up FZF
nnoremap <silent> <expr> <C-t> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" clear search highlighting
nnoremap <silent> <esc> :noh<CR><esc>

" Fix matching parenthesis highlighting
" hi MatchParen ctermfg=208 ctermbg=bg

" SQL Workbench configuration
let g:sw_config_dir='/home/gshpychka/.sqlworkbench'
let g:sw_exe='/opt/SQLWorkbench/sqlwbconsole.sh'
let g:sw_cacne='/home/gshpychka/.cache/sw'

" Source CoC config
source $HOME/.config/nvim/plug-config/coc.vim

source $HOME/.config/nvim/plug-config/vimspector.vim

let g:python3_host_prog="$HOME/venvs/nvim/bin/python3"
let g:python_host_prog="$HOME/venvs/nvim2/bin/python"
