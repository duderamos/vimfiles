" Theme
if has('gui_running')
  set go-=m " remove menu bar
  set go-=T " remove toolbar
  set go-=r " remove right-hand scroll bar
  set go-=L " remove left-hand scroll bar
  set cursorline
  set cursorcolumn
  hi CursorLine guibg=#222222
  hi CursorColumn guibg=#222222
  set background=dark
  colorscheme PaperColor
  set guifont=Bitstream\ Vera\ Sans\ Mono
endif
