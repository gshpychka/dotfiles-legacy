" Plugin section

call plug#begin()

" Python mode
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Sensible defaults
Plug 'tpope/vim-sensible'

" Surrounding mappings
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'

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

" Linting
" Plug 'w0rp/ale'

" Text alignment
Plug 'tommcdo/vim-lion'

" Navigate tmux windows via C-hjkl
Plug 'christoomey/vim-tmux-navigator'

" .tmux.conf editing conveniences
Plug 'tmux-plugins/vim-tmux'

call plug#end()

" Fuzzy file search
set rtp+=~/.fzf

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

" NERDTree config
let NERDTreeMapActivateNode='l'
let NERDTreeShowHidden=1
" Quit if NERDTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Key mapping
nnoremap <A-f> :NERDTreeToggle<CR>
nnoremap <C-t> :TagbarToggle<CR>
nnoremap <T> :TagbarOpen<CR>

" Fix matching parenthesis highlighting
" hi MatchParen ctermfg=208 ctermbg=bg
