" Shortcuts

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Remove highlights
noremap <C-l> :nohls<CR><C-L>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-q> :q!<CR>

" Navigate through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

" Save file with root permission
cmap w!! w !sudo tee % > /dev/null

" Rails
nnoremap <leader>sr :!rake routes<cr>

" Reload .vimrc
noremap <F12> :source ~/.vimrc<cr>

" Funcion shortcuts
map <leader>= :call TrimWhiteSpace()<CR>
map! <leader>= :call TrimWhiteSpace()<CR>
map <leader>- :call CollapseMultipleBlankLines()<CR>
map! <leader>- :call CollapseMultipleBlankLines()<CR>
map <leader>g :call OpenGemFile()<CR>
map <leader>r :call OpenRoutes()<CR>
map <leader>f :call OpenFactories()<CR>
map <leader>b :call RemoveBindingPry()<CR>
map! <leader>b :call RemoveBindingPry()<CR>
