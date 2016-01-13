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
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'Haron-Prime/evening_vim'
Plugin 'evgenyzinoviev/vim-vendetta'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'reedes/vim-colors-pencil'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'msanders/snipmate.vim'

filetype plugin indent on

nmap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '.keep']

nnoremap <F3> :IndentLinesToggle<CR>

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
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

set t_Co=256
set cf
set clipboard+=unnamed
set history=256
set autowrite
set autoread
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
set noundofile
set colorcolumn=100

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
  set background=light
  colorscheme PaperColor
  set guifont=Bitstream\ Vera\ Sans\ Mono
endif

let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-']
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'javascript'], 'passive_filetypes': ['html'] }

set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'PaperColor'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '❱'
let g:airline_left_alt_sep = '❱'
let g:airline_right_sep = '❰'
let g:airline_right_alt_sep = '❰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

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

function! OpenFactories()
  execute ':tabfind factories.rb'
endfunction
map <leader>f :call OpenFactories()<CR>

function! RunRSpec()
  execute ':!rspec --no-color %:p'
endfunction
map <leader>rs :call RunRSpec()<CR>

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
nnoremap <F4> :set background=dark<cr>
nnoremap <F5> :set background=light<cr>

if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
