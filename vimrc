set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'edkolev/tmuxline.vim'
Plug 'chemzqm/vim-jsx-improve', { 'for': 'jsx' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dense-analysis/ale'
Plug 'jparise/vim-graphql'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colour schemes
Plug 'reedes/vim-colors-pencil'

call plug#end()

" vim-airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'minimalist'

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

" fzf
let g:fzf_layout = { 'down': '30%' }

" ale
let g:airline#extensions#ale#enabled = 1

let g:ale_fix_on_save = 0

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'ruby': ['standardrb', 'reek', 'brakeman', 'debride'],
\   'dockerfile': ['hadolint']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'standard'],
\   'typescript': ['eslint'],
\   'ruby': ['standardrb'],
\}

" Functions
function! TrimWhiteSpace()
  silent! %s/\s\+$//
:endfunction

function! CollapseMultipleBlankLines()
  silent! g/^\_$\n\_^$/d
:endfunction

function! RemoveBindingPry()
  silent! g/binding\.pry/d
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

function! CommentLine()
  silent! s/^/\=b:comment_leader/
  "''
endfunction

" Shortcuts
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Remove highlights
noremap <C-l> :nohls<CR><C-L>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-e> :Explore<CR>

" Navigate through splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Save file with root permission
cmap w!! w !sudo tee % > /dev/null

" Funcion shortcuts
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

set complete-=i
" audocmd
autocmd FileType ruby,eruby,rake set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags

" Commented in favour of ALE
autocmd BufWrite * :call TrimWhiteSpace()
autocmd BufWrite * :call CollapseMultipleBlankLines()

" Fix *.ts files as being recognized as xml
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

autocmd FileType ruby,eruby,rake let b:comment_leader = '#'
autocmd FileType python     let b:comment_leader = '#'
autocmd FileType javascript,typescript let b:comment_leader = '//'
autocmd FileType shell let b:comment_leader = '#'

noremap <silent> <leader>cc :call CommentLine()<CR>
" General opts
" Options
set path=.,,**

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

colorscheme pencil

set background=dark " Fix to work with tmux

set termwinsize=10*100
set termguicolors

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
  set guifont=Roboto\ Mono\ for\ Powerline
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

" GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

nmap <C-p> :Ag<Cr>

" Transparent background
" highlight Normal guibg=NONE ctermbg=NONE

" https://www.chunkhang.com/blog/slow-syntax-highlighting-in-vim
set regexpengine=1
