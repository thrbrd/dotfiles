filetype plugin on
filetype indent on

" Vundle Setting
if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim.git
	call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'mattn/zencoding-vim'
NeoBundle 'matchit.zip'
NeoBundle 'surround.vim'
" NeoBundle 'fugitive.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'hail2u/vim-css3-syntax.git'
NeoBundle 'tComment'
NeoBundle 'jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Gundo'
NeoBundle 'jshint.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/Simple-Javascript-Indenter'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'epmatsw/ag.vim'
NeoBundle 'tyru/skk.vim.git'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'kana/vim-smartchr.git'
NeoBundle 'kana/vim-smartinput.git'
NeoBundle 'mrtazz/simplenote.vim'
NeoBundle 'taka84u9/unite-git.git'
NeoBundle 'thinca/vim-qfreplace.git'
NeoBundle 'tpope/vim-abolish.git'
NeoBundle 'teramako/jscomplete-vim.git'
NeoBundle 'deris/vim-rengbang'
NeoBundle 'bling/vim-airline.git'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'ujihisa/unite-locate'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'vim-scripts/vcscommand.vim.git'
" NeoBundle 'Shougo/vimproc', {
"       \ 'build' : {
"       \     'windows' : 'make -f make_mingw32.mak',
"       \     'cygwin' : 'make -f make_cygwin.mak',
"       \     'mac' : 'make -f make_mac.mak',
"       \     'unix' : 'make -f make_unix.mak',
"       \    },
"       \ }

" Airline
let g:airline#extensions#tabline#enabled = 1
set t_Co=256

" Color scheme
colorscheme jellybeans
" colorscheme molokai

" タブとか改行を表示する
set list
set listchars=eol:¬,tab:▸\ ,extends:>,precedes:<,trail:-

" settings
syntax on
set guioptions=m

" set linespace=4
set visualbell t_vb=
set clipboard=unnamed
set virtualedit=block
set nobackup
set noswapfile
set hlsearch
set ignorecase
set smartcase
set nowrapscan
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set incsearch
set number
set whichwrap=b,s,h,l,<,>,[,]
set wildmenu
set ruler
set laststatus=2
set visualbell t_vb=
set mouse=a
set cmdheight=2
set novisualbell
set foldmethod=marker
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" keybind: normal mode
nmap j gj
nmap k gk
nmap > >>
nmap < <<
nmap <C-t> :tabedit <return>
nmap <C-c> :tabclose <return>
nmap <C-n> :tabnext <return>
nmap <C-p> :tabprevious <return>
nmap <S-l> <C-w>l
nmap <S-h> <C-w>h
nmap <S-k> <C-w>k
nmap <S-j> <C-w>j
nmap <C-m> :nohl <return>
nmap <C-o> :VimFiler <return>
nmap <Leader>r :QuickRun <return>
nmap <Leader>ig :IndentGuidesToggle <return>
nmap ¥ \
vmap ¥ \
imap ¥ \
cmap ¥ \
vmap s S
vmap <silent> > >gv
vmap <silent> < <gv

" keybind: zencoding
nmap <C-e> <C-y>,
imap <C-e> <C-y>,
vmap <C-e> <C-y>,

" Shougo/neocomplcache Setting
let g:neocomplcache_enable_at_startup = 1

function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
let g:neocomplcache_snippets_dir = '~/dotfiles/.neocon-snippets'

" neocomplcache snipet trigger
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" Edit snippet files.
nmap <Space>nes :<C-u>NeoComplCacheEditSnippets<CR>

filetype plugin on
au BufEnter * execute ":lcd " . expand("%:p:h")

" " syntastic
" let g:syntastic_check_on_open=1 "ファイルを開いたにチェックする
" let g:syntastic_check_on_save=1 "保存時にはチェック
" let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
" let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
" set statusline+=%#warningmsg# "エラーメッセージの書式
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_javascript_checker = 'jshint' "jshintを使う
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'javascript'],
      \ 'passive_filetypes': []
      \ }
"エラー表示マークを変更
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

let g:ref_alc_encoding = 'utf-8'
let g:ref_alc_start_linenumber = 44

" for easymotion
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" " 「'」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" " 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" " カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" for skk.vim
let skk_jisyo = '~/.skk-dic'
let skk_large_jisyo = '~/.skk-dic/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1

" 無限undoと編集位置の自動復帰 http://blog.papix.net/entry/2012/12/14/042937
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

" smartchr settings
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
inoremap <expr> ! smartchr#loop('!', ' != ')
inoremap <expr> > smartchr#loop('>', ' > ', ' >= ')
inoremap <expr> < smartchr#loop('<', ' < ', ' <= ')
inoremap <expr> , smartchr#loop(',', ', ')
inoremap <expr> : smartchr#loop(': ', ':')

" For Simple Note edit.
if filereadable(expand('~/.vimsimplenoterc'))
  source ~/.vimsimplenoterc
endif

" for simplenote.vim
nmap <Leader>snl :Simplenote -l<CR>
nmap <Leader>snn :Simplenote -n<CR>
if has("mac")
  " markdownをMarked.appで開く
  :nnoremap <leader>om :silent !open -a Marked.app '%:p'<cr>:redraw!<cr>
endif

" for unite.vim
nmap <Leader>ub :Unite buffer_tab<CR>
nmap <Leader>ug :Unite git_modified<CR>
nmap <Leader>um :Unite mark<CR>
nmap <Leader>ur :Unite register<CR>

" macvimの透明度を調整
if has('gui_macvim')
	set transparency=10
endif

" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']
