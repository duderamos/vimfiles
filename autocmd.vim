autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS

" autocmd BufWrite * call TrimWhiteSpace()
" autocmd BufWrite * call CollapseMultipleBlankLines()

" Fix *.ts files as being recognized as xml
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
