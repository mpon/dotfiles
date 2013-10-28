" カラーシンタックス
colorscheme molokai
syntax on

" neobundle
scriptencoding utf-8
set nocompatible

if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif

call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'

syntax on
filetype plugin on
filetype indent on

" SSH クライアントの設定によってはマウスが使える（puttyだと最初からいける）
set mouse=n
