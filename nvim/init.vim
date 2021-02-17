" Plugin section

call plug#begin()

" Python mode
" Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Enchanced Python highlighting
Plug 'vim-python/python-syntax', {'for': 'python'}

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
Plug 'edkolev/tmuxline.vim'

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
Plug 'gshpychka/vim-ipython-cell', { 'for': 'python' }

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
" set lazyredraw          " Only redraw when necessary

set wrapscan            " Searches wrap around EOF

set cmdheight=1

" Styling
syntax enable

" Colorscheme
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold=0
set t_Co=256
" set termguicolors
set background=dark
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:airline_extensions = ['branch', 'coc', 'hunks', 'tmuxline', 'vista', 'tabline']
let g:airline#extensions#tabline#enabled = 1

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

" Python highlighting settings
let g:python_highlight_all = 1
let g:python_highlight_func_calls = 0

" python notebook-like config
let g:slime_target = 'tmux'
let g:slime_python_ipython = 1
" always execute in top-right tmux tab without asking
let g:slime_default_config = {
    \ 'socket_name': get(split($TMUX, ','), 0),
    \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>e :IPythonCellRun<CR>
nnoremap <Leader>p :IPythonCellExecuteCellJump<CR>
nnoremap <Leader>P :IPythonCellExecuteCell<CR>
nnoremap <Leader>c :IPythonCellClear<CR>
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>
" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend
" map <Leader>p to run the previous command
" nnoremap <Leader>p :IPythonCellPrevCommand<CR>
" map <Leader>q to restart ipython
nnoremap <Leader>q :IPythonCellRestart<CR>
" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>
" map <Leader>Q to exit debug mode or IPython
nnoremap <Leader>Q :SlimeSend1 exit<CR>

" Key mapping
nnoremap <silent> <C-f> :NERDTreeToggle<CR>
" nnoremap <silent> <C-b> :TagbarToggle<CR>
nnoremap <silent> <C-b> :Vista!!<CR>
" switch buffer if focused on NERDTree and bring up FZF
nnoremap <silent> <expr> <C-t> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
nnoremap <silent> <expr> <C-r> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Rg\<cr>"
" clear search highlighting
nnoremap <silent> <esc> :noh<CR><esc>

" Fix matching parenthesis highlighting
" hi MatchParen ctermfg=208 ctermbg=bg

" SQL Workbench configuration
let g:sw_config_dir='/home/gshpychka/.sqlworkbench'
let g:sw_exe='/opt/SQLWorkbench/sqlwbconsole.sh'
let g:sw_cacne='/home/gshpychka/.cache/sw'

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vista.vim

let g:python3_host_prog="$HOME/venvs/nvim/bin/python3"
let g:python_host_prog="$HOME/venvs/nvim2/bin/python"
