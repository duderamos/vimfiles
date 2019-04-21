set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ekalinin/Dockerfile.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'Yggdroot/indentLine'
Plug 'msanders/snipmate.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'kien/ctrlp.vim'
Plug 'burnettk/vim-angular', { 'for': 'js' }
Plug 'chemzqm/vim-jsx-improve', { 'for': 'jsx' }
"Plugin 'pangloss/vim-javascript'
"Plugin 'w0rp/ale'

" Colour schemes
Plug 'chriskempson/base16-vim'
Plug 'Haron-Prime/evening_vim'
Plug 'evgenyzinoviev/vim-vendetta'
Plug 'vim-scripts/summerfruit256.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'reedes/vim-colors-pencil'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" NERDTree
nmap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '.keep']

" syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_typescript_checkers = ['eslint', 'tslint']
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'javascript', 'typescript'], 'passive_filetypes': ['html'] }

" vim-airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'papercolor'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_alt_sep = '❱'
let g:airline_right_alt_sep = '❰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" indentLine
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" Functions
function! TrimWhiteSpace()
  silent! %s/\s\+$//
  ''
:endfunction

function! CollapseMultipleBlankLines()
  silent! g/^\_$\n\_^$/d
  ''
:endfunction

function! RemoveBindingPry()
  silent! g/binding\.pry/d
  ''
:endfunction

function! OpenGemFile()
  execute ':tabfind Gemfile'
endfunction

function! OpenRoutes()
  execute ':tabfind routes.rb'
endfunction

function! OpenFactories()
  execute ':tabfind factories.rb'
endfunction

" Creates parent directories on save
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

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

" Sets file types
map  <leader><leader>c :set ft=css<CR>
map  <leader><leader>C :set ft=coffee<CR>
map  <leader><leader>h :set ft=html<CR>
map  <leader><leader>H :set ft=haml<CR>
map  <leader><leader>j :set ft=javascript<CR>
map  <leader><leader>m :set ft=markdown<CR>
map  <leader><leader>r :set ft=ruby<CR>
map  <leader><leader>s :set ft=sh<CR>
map  <leader><leader>S :set ft=sql<CR>
map  <leader><leader>t :set ft=text<CR>
map  <leader><leader>y :set ft=yaml<CR>

filetype plugin indent on

" audocmd
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags

" autocmd BufWrite * call TrimWhiteSpace()
" autocmd BufWrite * call CollapseMultipleBlankLines()

" Fix *.ts files as being recognized as xml
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufWritePre * :%s/\s\+$//e

" General opts
" Options
set path=.,,

" Two spaces indentation
set tabstop=2
set shiftwidth=2
set expandtab

set nofoldenable
set foldmethod=syntax

set wildmode=list:longest
set wildmenu
set wildignore=*~

set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set t_Co=256 " Number of colours
set clipboard+=unnamed
set history=256
set autowrite
set autoread " read file if it's modified
set ruler
set number
set wrap " wrap line

" Search options
set incsearch " Highlight patterns as it's found so far
set hlsearch
set smartcase
set ignorecase

set splitright
set splitbelow

set nobackup
set noswapfile
set noundofile

" Soft limit columns
set colorcolumn=80,100
hi ColorColumn ctermbg=235

" GUI
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

syntax on

" tmux
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

cab tabe tab drop
