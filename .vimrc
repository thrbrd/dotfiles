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
NeoBundle 'fugitive.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'git://github.com/honza/snipmate-snippets.git'
NeoBundle 'vcscommand.vim'
NeoBundle 'css3-syntax-plus'
NeoBundle 'jQuery'
NeoBundle 'HTML5-Syntax-File'
NeoBundle 'Markdown-syntax'
NeoBundle 'quickrun'
NeoBundle 'instant-markdown.vim'
NeoBundle 'tComment'
NeoBundle 'jellybeans.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Gundo'
NeoBundle 'jshint.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'tagexplorer.vim'
NeoBundle 'vim-coffee-script'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'vim-scripts/Simple-Javascript-Indenter'
NeoBundle 'thinca/vim-ref'
NeoBundle 'digitaltoad/vim-jade'

" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-F><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-F><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-F><C-H> :Unite file_mru<CR>
" ファイルとバッファ
noremap <C-F><C-U> :Unite buffer file_mru<CR>

" Powerline
let g:Powerline_symbols = 'fancy'
set t_Co=256

" color theme
colorscheme jellybeans

"タブとか改行を表示する
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
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set novisualbell
set foldmethod=marker

" keybind: normal mode
nmap j gj
nmap k gk
nmap <C-t> :tabedit <return>
nmap <C-c> :tabclose <return>
nmap <C-n> :tabnext <return>
nmap <C-p> :tabprevious <return>
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-m> :nohl <return>
nmap <C-v> :vertical diffsplit 
nmap <C-o> :o .<return>
nmap <Leader>w :W3m 
nmap <Leader>te :TagExplore <return>

" keybind: insert mode
imap <C-h> <Esc>^i
imap <C-l> <Esc>$a
imap <C-w> <Esc>

" keybind: visual mode
vmap <C-7> s'
vmap <C-2> s"
vmap <C-t> st
vmap <silent> > >gv
vmap <silent> < <gv

" keybind: zencoding
nmap <C-e> <C-y>,
imap <C-e> <C-y>,

" fugitive(git plugin) keybind
nmap <Leader>ga :Gwrite <return>
nmap <Leader>gc :Gcommit <return>

" gundo keybind
nmap <C-b> :GundoToggle <return>

" unite.vim setting
"nmap <Leader>cd :Unite file -buffer-name=files <return>
"nmap <Leader>fh :Unite file_mru <return>
"nmap <Leader>ch :UniteWithCurrentDir file_mru <return>

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

" スニペットファイルを編集する
noremap nes :<C-u>NeoComplCacheEditSnippets<CR>

" neocomplcache snipet trigger
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

filetype on

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" powerline colorscheme
call Pl#Hi#Allocate({
  \ 'black'          : 16,
    \ 'white'          : 231,
  \
    \ 'darkestgreen'   : 22,
  \ 'darkgreen'      : 28,
    \
  \ 'darkestcyan'    : 23,
    \ 'mediumcyan'     : 117,
  \
    \ 'darkestblue'    : 24,
  \ 'darkblue'       : 31,
    \
  \ 'darkestred'     : 52,
    \ 'darkred'        : 88,
  \ 'mediumred'      : 124,
    \ 'brightred'      : 160,
  \ 'brightestred'   : 196,
    \
  \
    \ 'darkestyellow'  : 59,
  \ 'darkyellow'     : 100,
    \ 'darkestpurple'  : 55,
  \ 'mediumpurple'   : 98,
    \ 'brightpurple'   : 189,
  \
    \ 'brightorange'   : 208,
  \ 'brightestorange': 214,
    \
  \ 'gray0'          : 233,
    \ 'gray1'          : 235,
  \ 'gray2'          : 236,
    \ 'gray3'          : 239,
  \ 'gray4'          : 240,
    \ 'gray5'          : 241,
  \ 'gray6'          : 244,
    \ 'gray7'          : 245,
  \ 'gray8'          : 247,
    \ 'gray9'          : 250,
  \ 'gray10'         : 252,
    \ })
" 'n': normal mode
" 'i': insert mode
" 'v': visual mode
" 'r': replace mode
" 'N': not active
let g:Powerline#Colorschemes#my#colorscheme = Pl#Colorscheme#Init([
  \ Pl#Hi#Segments(['SPLIT'], {
      \ 'n': ['white', 'gray2'],
      \ 'N': ['gray0', 'gray0'],
      \ }),
    \
  \ Pl#Hi#Segments(['mode_indicator'], {
      \ 'i': ['darkestgreen', 'white', ['bold']],
      \ 'n': ['darkestcyan', 'white', ['bold']],
      \ 'v': ['darkestpurple', 'white', ['bold']],
      \ 'r': ['mediumred', 'white', ['bold']],
      \ 's': ['white', 'gray5', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['fileinfo', 'filename'], {
      \ 'i': ['white', 'darkgreen', ['bold']],
      \ 'n': ['white', 'darkblue', ['bold']],
      \ 'v': ['white', 'mediumpurple', ['bold']],
      \ 'r': ['white', 'brightred', ['bold']],
      \ 'N': ['gray0', 'gray2', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['branch', 'scrollpercent', 'raw', 'filesize'], {
      \ 'n': ['gray2', 'gray7'],
      \ 'N': ['gray0', 'gray2'],
      \ }),
    \
  \ Pl#Hi#Segments(['fileinfo.filepath', 'status'], {
      \ 'n': ['gray10'],
      \ 'N': ['gray5'],
      \ }),
    \
  \ Pl#Hi#Segments(['static_str'], {
      \ 'n': ['white', 'gray4'],
      \ 'N': ['gray1', 'gray1'],
      \ }),
    \
  \ Pl#Hi#Segments(['fileinfo.flags'], {
      \ 'n': ['white'],
      \ 'N': ['gray4'],
      \ }),
    \
  \ Pl#Hi#Segments(['currenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
      \ 'n': ['gray9', 'gray4'],
      \ }),
    \
  \ Pl#Hi#Segments(['lineinfo'], {
      \ 'n': ['gray2', 'gray10'],
      \ 'N': ['gray2', 'gray4'],
      \ }),
    \
  \ Pl#Hi#Segments(['errors'], {
      \ 'n': ['brightestorange', 'gray2', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['lineinfo.line.tot'], {
      \ 'n': ['gray2'],
      \ 'N': ['gray2'],
      \ }),
    \
  \ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
      \ 'n': ['white', 'brightred', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['gundo:static_str.name', 'command_t:static_str.name'], {
      \ 'n': ['white', 'mediumred', ['bold']],
      \ 'N': ['brightred', 'darkestred', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['gundo:static_str.buffer', 'command_t:raw.line'], {
      \ 'n': ['white', 'darkred'],
      \ 'N': ['brightred', 'darkestred'],
      \ }),
    \
  \ Pl#Hi#Segments(['gundo:SPLIT', 'command_t:SPLIT'], {
      \ 'n': ['white', 'darkred'],
      \ 'N': ['white', 'darkestred'],
      \ }),
    \
  \ Pl#Hi#Segments(['ctrlp:focus', 'ctrlp:byfname'], {
      \ 'n': ['brightpurple', 'darkestpurple'],
      \ }),
    \
  \ Pl#Hi#Segments(['ctrlp:prev', 'ctrlp:next', 'ctrlp:pwd'], {
      \ 'n': ['white', 'mediumpurple'],
      \ }),
    \
  \ Pl#Hi#Segments(['ctrlp:item'], {
      \ 'n': ['darkestpurple', 'white', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['ctrlp:marked'], {
      \ 'n': ['brightestred', 'darkestpurple', ['bold']],
      \ }),
    \
  \ Pl#Hi#Segments(['ctrlp:count'], {
      \ 'n': ['darkestpurple', 'white'],
      \ }),
    \
  \ Pl#Hi#Segments(['ctrlp:SPLIT'], {
      \ 'n': ['white', 'darkestpurple'],
      \ }),
    \ ])
let g:Powerline_colorscheme='my'

filetype plugin on
au BufEnter * execute ":lcd " . expand("%:p:h")

" syntastic
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
