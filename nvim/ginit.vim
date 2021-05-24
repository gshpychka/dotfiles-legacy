nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h15


if exists('g:fvim_loaded')
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontLigature v:false
    FVimFontSubpixel v:true
    " FVimFontNoBuiltInSymbols v:true
    FVimFontAutoSnap v:true
    " FVimFontLineHeight '+1.0'
endif
