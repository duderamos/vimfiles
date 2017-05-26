set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source $HOME/.vim/plugins.vim
source $HOME/.vim/plugins-opts.vim
source $HOME/.vim/functions.vim
source $HOME/.vim/shortcuts.vim

filetype plugin indent on

source $HOME/.vim/autocmd.vim
source $HOME/.vim/general-options.vim
source $HOME/.vim/gui.vim

syntax on

" tmux
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
