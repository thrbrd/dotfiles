set nocompatible
filetype off
filetype plugin indent off

source ~/.vimrc.plug
source ~/.vimrc.general
source ~/.vimrc.plugin

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

command! -nargs=1 -complete=file MyVS vsplit <args>

function! s:Hoge()
endfunction
