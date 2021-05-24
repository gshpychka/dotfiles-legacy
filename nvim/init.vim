let g:config_path = '~/.config/nvim/'

func LoadConfig(filename)
    exec 'source' g:config_path . a:filename
endfunc

call LoadConfig('plugins.vim')
call LoadConfig('plugin-settings.vim')
call LoadConfig('keymaps.vim')

set completeopt=menuone,noselect
set updatetime=100
set number relativenumber
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
set foldlevelstart=9
set scrolloff=15
set colorcolumn=88
set smartcase
set nosmd               " Do not show mode in command line
syntax enable

" Colorscheme
" let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold=0
" set t_Co=256
set termguicolors
set background=dark
colorscheme gruvbox

hi link DiagnosticError GruvboxRedSign
hi link DiagnosticInformation GruvboxYellowSign
hi link DiagnosticWarning GruvboxOrangeSign
hi link DiagnosticHint GruvboxBlueSign

hi! link LspDiagnosticsDefaultError DiagnosticError
hi! link LspDiagnosticsDefaultInformation DiagnosticInformation
hi! link LspDiagnosticsDefaultWarning DiagnosticWarning
hi! link LspDiagnosticsDefaultHint DiagnosticHint

" undercurl not supported in alacritty
" hi LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl guisp=#fb4934

" Allow `//` comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow

" Fix matching parenthesis highlighting
" hi MatchParen ctermfg=208 ctermbg=bg

let g:python3_host_prog="$HOME/venvs/nvim/bin/python3"
let g:python_host_prog="$HOME/venvs/nvim2/bin/python"

