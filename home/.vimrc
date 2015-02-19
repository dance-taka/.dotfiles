"---------------------------
" Start Neobundle Settings.
"---------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " bundleで管理するディレクトリを指定
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
" after install,  turn shell ~/.vim/bundle/vimproc,  (n, g)make -f
" your_machines_makefile
" NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'vim-scripts/taglist.vim'

" color schemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jpo/vim-railscasts-theme'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------------------------------------------------------------
" basic configrations
"-------------------------------------------------------------------------------
" tags
set tags=tags

let mapleader = ","                  " キーマップリーダー
set scrolloff=5                      " スクロール時の余白確保
set textwidth=0                      " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                         " バックアップ取らない
set autoread                         " 他で書き換えられたら自動で読み直す
set noswapfile                       " スワップファイル作らない
set hidden                           " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start       " バックスペースでなんでも消せるように
set formatoptions=lmoq               " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                         " ビープをならさない
set browsedir=buffer                 " Exploreの初期ディレクトリ
set showcmd                          " コマンドをステータス行に表示
set showmode                         " 現在のモードを表示
set viminfo='50,<1000,s100,\"50      " viminfoファイルの設定
set notitle                          " vimを使ってくれてありがとう
set nowrap                           " 折り返さない
set ts=2 sw=2 sts=2                  " タブセット設定
set smartindent                      " スマートインデント
set laststatus=2                     " 常にステータスラインを表示
set ruler                            " カーソルが何行目の何列目に置かれているかを表示する
set expandtab                        " Tabキーを空白に変換
inoremap , ,<Space>                  " コンマの後に自動的にスペースを挿入
set noundofile                       " undofile無効化
set number                           " ライン番号

set mouse=a                          " ターミナルでマウスを使用できるようにする
set guioptions+=a
set ttymouse=xterm2


" help file
set helpfile=$VIMRUNTIME/doc/help.txt

"set whichwrap=b,s,h,l,<,>,[,]        " カーソルを行頭、行末で止まらないようにする
"set modelines=0                      " モードラインは無効
"set clipboard+=unnamed               " OSのクリップボードを使用する
"set clipboard=unnamed                " ヤンクした文字は、システムのクリップボードに入れる
" imap <C-p> <ESC>"*pa                " 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END

" plugin settings
" minibuf
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" ファイルタイプ判定をon
filetype plugin on

" ハイライト on
syntax enable

" color schemes
colorscheme railscasts

