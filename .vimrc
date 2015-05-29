filetype off

" {{{ [maganement] NeoBundle
" ==================================================================================
if 0 | endif
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
filetype plugin indent on

" For looks
NeoBundle 'tomasr/molokai'
NeoBundle 'bling/vim-airline.git'
NeoBundle 'osyo-manga/unite-airline_themes'
NeoBundle 'ujihisa/unite-colorscheme'

" Syntax
NeoBundle 'othree/html5.vim'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'briancollins/vim-jst.git'

" For coding
NeoBundle 'matchit.zip'
NeoBundle 'thrbrd/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tComment'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'epmatsw/ag.vim'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'kana/vim-smartchr.git'
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mhinz/vim-signify'

" [todo] - しらべる
NeoBundle 'tpope/vim-abolish.git'

" For git
NeoBundle 'tpope/vim-fugitive'

" For files
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-locate'

" Other
NeoBundle 'tyru/skk.vim.git'
NeoBundle 'itspriddle/vim-marked'
NeoBundle 'Shougo/vimproc'

NeoBundleCheck
" }}} ==============================================================================
" {{{ [management] Color scheme
" ==================================================================================
colorscheme molokai
" }}} ==============================================================================
" {{{ [settings] Initialize
" ==================================================================================
syntax on
filetype off
filetype plugin on
set guifont=Ricty_Diminished:h10
set foldmethod=marker
set guioptions=
set visualbell t_vb=
set clipboard=unnamed
set virtualedit=block
set nobackup
set noswapfile
set hlsearch
set ignorecase
set smartcase
set nowrapscan
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set incsearch
set number
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set ruler
set laststatus=2
set lsp=2
set visualbell t_vb=
set mouse=a
set cmdheight=2
set novisualbell
set encoding=utf-8
set fileencodings=utf-8,sjis,ucs-bom,iso-2022-jp,cp932,euc-jp,default,latin
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" " }}} ==============================================================================
" {{{ [settings][keybind] Normal mode
" ==================================================================================
nmap j gj
nmap k gk
nmap > >>
nmap < <<
nmap <C-n> :bn <return>
nmap <C-p> :bp <return>
nmap <C-c> :bdelete <return>
nmap <C-m> :nohl <return>
nmap <Leader>r :QuickRun <return>
nmap \ \
nmap <S-g><S-c> :Gcommit <return>
nmap <S-g><S-s> :Gstatus <return>
nmap <S-g><S-p><S-s> :Git push
nmap <S-g><S-p><S-l> :Git pull
nmap <S-g><S-c><S-o> :Git checkout
nmap <S-g><S-m><S-g> :Git merge
nmap <S-g><S-f> :Git fetch <return>
" }}} ==============================================================================
" {{{ [settings][keybind] Insert mode
" ==================================================================================
imap \ \
" }}} ==============================================================================
" {{{ [settings][keybind] Visual mode
" ==================================================================================
vmap \ \
vmap > >gv
vmap < <gv
" }}} ==============================================================================
" {{{ [settings][keybind] Command mode
" ==================================================================================
cmap \ \
" }}} ==============================================================================
" {{{ [settings][keybind] Operator
" ==================================================================================
map R <Plug>(operator-replace)
" }}} ==============================================================================
" {{{ [settings] 無限undoと編集位置の自動復帰 http://blog.papix.net/entry/2012/12/14/04~
" ==================================================================================
if has('persistent_undo')
       set undodir=~/.vim/undo
       set undofile
endif
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""
" }}} ==============================================================================
" {{{ [settings][plugin] neocomplete
" ==================================================================================
let g:neocomplete#enable_at_startup = 1
let g:neocomplete_snippets_dir = '~/dotfiles/.neocon-snippets'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'javascript' : $HOME.'/dotfiles/.neocon-snippets/javascript.snip'
\ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/dotfiles/.neocon-snippets/'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" }}} ==============================================================================
" {{{ [settings][plugin] neosnippet
" ==================================================================================
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }}} ==============================================================================
" {{{ [settings][plugin] emmet-vim (zen-coding)
" ==================================================================================
nmap <C-e> <C-y>,
imap <C-e> <C-y>,
vmap <C-e> <C-y>,
" }}} ==============================================================================
" {{{ [settings][plugin] vim-airline
" ==================================================================================
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
" }}} ==============================================================================
" {{{ [settings][plugin] EasyMotion
" ==================================================================================
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key = ";"
let g:EasyMotion_grouping = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" }}} ==============================================================================
" {{{ [settings][plugin] clever-f
" ==================================================================================
let g:clever_f_use_migemo = 1
" }}} ==============================================================================
" {{{ [settings][plugin] skk.vim
" ==================================================================================
let skk_jisyo = '~/.skk-dic'
let skk_large_jisyo = '~/.skk-dic/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1
" }}} ==============================================================================
" {{{ [settings][plugin] unite.vim
" ==================================================================================
nmap ,ub :Unite buffer <return>
nmap ,uh :Unite file_mru <return>
nmap ,ul :Unite locate<return>
nmap ,uf :UniteWithBufferDir -buffer-name=files file file/new <return>
nmap ,uc :Unite -auto-preview colorscheme<return>
nmap ,ug :Unite grep:. -buffer-name=search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}} ==============================================================================
