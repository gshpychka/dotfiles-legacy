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


" Python highlighting settings
" let g:python_highlight_all = 1
" let g:python_highlight_func_calls = 0

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


" let g:vista_default_executive = 'coc'

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:airline_extensions = ['branch', 'coc', 'hunks', 'vista', 'tabline']
let g:airline#extensions#tabline#enabled = 1

let g:tpipeline_focuslost = 0
let g:tpipeline_split = 1
if has('termguicolors') "true colors
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

exec 'luafile' expand(g:config_path . 'lua/nvim-compe.conf.lua')
exec 'luafile' expand(g:config_path . 'lua/nvim-lspconfig.conf.lua')
exec 'luafile' expand(g:config_path . 'lua/nvim-treesitter.conf.lua')
exec 'luafile' expand(g:config_path . 'lua/nvim-lspsaga.conf.lua')
