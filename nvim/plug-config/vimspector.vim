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
