set nocompatible

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

" Lint files after 3secs idle
let g:ale_lint_delay = 3000

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_sign_info = '-'
let g:ale_cache_executable_check_failures = 1
let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['standardrb', 'reek', 'brakeman'],
\   'typescript': ['eslint', 'tsserver'],
\   'dockerfile': ['hadolint']
\}

let g:ale_fixers = {
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

" Creates parent directories on save
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

function! BeautifulJson()
  silent! %!jq '.'
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

" ALEFix
noremap <leader>f :ALEFix<CR>

nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
" nnoremap <C-right> :tabnext<CR>
" nnoremap <C-left> :tabprevious<CR>
" nnoremap <C-q> :q!<CR>
" nnoremap <C-e> :Explore<CR>
map <Left> <Nop>
map <Down> <Nop>
map <Up> <Nop>
map <Right> <Nop>

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
map <leader>b :call RemoveBindingPry()<CR>
map! <leader>b :call RemoveBindingPry()<CR>

filetype plugin indent on

set complete-=i

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
set mouse=

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
let g:pencil_gutter_color = 1

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

" tmux
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

cab tabe tab drop

nmap <C-p> :Ag<Cr>

" https://www.chunkhang.com/blog/slow-syntax-highlighting-in-vim
set regexpengine=1

syntax on

" ale sign colors
highlight ALEErrorSign ctermfg=1
highlight ALEWarningSign ctermfg=1
highlight ALEInfoSign ctermfg=12
