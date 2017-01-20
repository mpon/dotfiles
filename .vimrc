" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
  
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" 黒背景のカラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" Scalaのシンタックスハイライト
NeoBundle 'derekwyatt/vim-scala'
" Dockerfileのシンタックスハイライト
NeoBundle 'ekalinin/Dockerfile.vim'
" markdownのシンタックスハイライト
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'
" coffeescriptのシンタックスハイライト
NeoBundle 'kchmck/vim-coffee-script'
" fluentdのシンタックスハイライト
NeoBundle 'yoppi/fluentd.vim'
" .lvimrcの読み込み
NeoBundle 'embear/vim-localvimrc'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'rsense/rsense'
" 静的解析
NeoBundle 'scrooloose/syntastic'
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'
" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
" set statusline=%<%f\
" %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 想定される改行コードの指定する
set fileformats=unix,dos,mac
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme jellybeans
" 行番号の色
highlight LineNr ctermfg=darkyellow
" cocoapodsのsyntax highlight
au BufRead,BufNewFile Podfile set filetype=ruby
" Vagrantfileのsyntax highlight
au BufRead,BufNewFile Vagrantfile set filetype=ruby
" plasticboy/vim-markdown Disable Folding
let g:vim_markdown_folding_disabled=1
" fluentdのfiletypeをset
au BufRead,BufNewFile td-agent.conf set filetype=fluentd
" .lvimrcを実行する
let g:localvimrc_persistent=2
let g:localvimrc_sandbox=0
""""""""""""""""""""""""""""""


" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

