set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugins
Plugin 'gmarik/vundle'

Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'chriskempson/base16-vim'
Plugin 'Haron-Prime/evening_vim'
Plugin 'evgenyzinoviev/vim-vendetta'
Plugin 'kchmck/vim-coffee-script'

filetype plugin indent on

nmap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '.keep']

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS

" Options
set path=.,,**
set tabstop=2
set shiftwidth=2
set expandtab

set nofoldenable
set wildmode=list:longest
set wildmenu
set wildignore=*~

set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set cf
set clipboard+=unnamed
set history=256
set autowrite
set ruler
set number
set wrap

set incsearch
set hlsearch
set ignorecase

set splitright
set splitbelow

set nobackup
set noswapfile

" Theme
if has('gui_running')  
  set go-=m
  set go-=T
  set go-=r
  set go-=L
  set cursorline
  set cursorcolumn
  hi CursorLine guibg=#222222
  hi CursorColumn guibg=#222222
  set background=dark
  colorscheme vendetta
  set guifont=monospace
endif

let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'javascript'], 'passive_filetypes': ['html'] }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

syntax on

" Functions

function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction
map <leader>= :call TrimWhiteSpace()<CR>
map! <leader>= :call TrimWhiteSpace()<CR>

function! CollapseMultipleBlankLines()
  g/^\_$\n\_^$/d
  ''
:endfunction
map <leader>- :call CollapseMultipleBlankLines()<CR>
map! <leader>- :call CollapseMultipleBlankLines()<CR>

function! OpenGemFile()
  execute ':tabfind Gemfile'
endfunction
map <leader>g :call OpenGemFile()<CR>

function! OpenRoutes()
  execute ':tabfind routes.rb'
endfunction
map <leader>r :call OpenRoutes()<CR>

function! OpenSpecHelper()
  execute ':tabfind spec_helper.rb'
endfunction
map <leader>s :call OpenSpecHelper()<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Shortcuts
noremap <C-l> :nohls<CR><C-L>

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <M-w> :q<CR>
nnoremap <M-W> :q<CR>
nnoremap <C-right> :tabn<CR>
nnoremap <C-left> :tabp<CR>
nnoremap <C-q> :q!<CR>

nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>

cmap w!! w !sudo tee % > /dev/null
nnoremap <leader>sr :!rake routes<cr>
noremap <F12> :source ~/.vimrc<cr>
