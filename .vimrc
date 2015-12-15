set nocompatible
filetype off
filetype plugin indent off

source ~/.vimrc.plug
source ~/.vimrc.general
source ~/.vimrc.plugin

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
