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
