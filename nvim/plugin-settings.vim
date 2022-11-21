let g:vimspector_enable_mappings = 'HUMAN'

" python notebook-like config
let g:slime_target = 'tmux'
let g:slime_python_ipython = 1
" always execute in top-right tmux tab without asking
let g:slime_default_config = {
    \ 'socket_name': get(split($TMUX, ','), 0),
    \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

" SQL Workbench configuration
let g:sw_config_dir='/home/gshpychka/.sqlworkbench'
let g:sw_exe='/opt/SQLWorkbench/sqlwbconsole.sh'
let g:sw_cacne='/home/gshpychka/.cache/sw'

" vimspector
function! s:CustomiseUI()
  " Close the output window
  call win_gotoid( g:vimspector_session_windows.watches)
  q
endfunction

" function s:SetUpTerminal()
"   " Customise the terminal window size/position
"   " For some reasons terminal buffers in Neovim have line numbers
"   call win_gotoid( g:vimspector_session_windows.terminal )
"   set norelativenumber nonumber
" endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
  " autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
augroup END


let g:vista_sidebar_width=20
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_default_executive = 'nvim_lsp'
let g:vista#renderer#ctags = 'line'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:minimap_block_filetypes = ['fugitive', 'vista_kind']

" black fixer
" let g:black_virtualenv = '~/.local/pipx/venvs/black'

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:airline_extensions = ['branch', 'coc', 'hunks', 'vista', 'tabline']
let g:airline#extensions#tabline#enabled = 1

let g:tpipeline_focuslost = 0
let g:tpipeline_split = 1
" if has('termguicolors') "true colors
" 	let &t_8f = '\<Esc>[38;2;%lu;%lu;%lum'
" 	let &t_8b = '\<Esc>[48;2;%lu;%lu;%lum'
" 	set termguicolors
" endif

" exec 'luafile' expand(g:config_path . 'lua/nvim-compe.conf.lua')

exec 'luafile' expand(g:config_path . 'lua/nvim-lspconfig.conf.lua')

exec 'luafile' expand(g:config_path . 'lua/nvim-treesitter.conf.lua')
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" exec 'luafile' expand(g:config_path . 'lua/nvim-lspsaga.conf.lua')

exec 'luafile' expand(g:config_path . 'lua/neoscroll.conf.lua')

let g:copilot_node_command = "~/.nvm/versions/node/v17.9.1/bin/node"

lua require'nvim-rooter'.setup()
