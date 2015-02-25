" --------------------------------------------------------------------------
" Start Neobundle Settings.
" --------------------------------------------------------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" --------------------------------------------------------------------------
"  Neobundle list
" --------------------------------------------------------------------------
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'       " NeoBundle

" for general
NeoBundle 'Shougo/unite.vim'                " ファイラ
NeoBundle 'Shougo/neomru.vim'               " 上記最近使ったファイル一覧

NeoBundle 'fholgado/minibufexpl.vim'        " tab
NeoBundle 'Shougo/neocomplcache'            " 補完強化
NeoBundle 'vim-scripts/SearchComplete'      " 検索補完

" for develop
NeoBundle 'tpope/vim-endwise'               " ruby end 自動挿入
NeoBundle 'vim-scripts/taglist.vim'         " ctags list :Tlist
NeoBundle 'vim-scripts/AnsiEsc.vim'         " ANSIログカラーリング
NeoBundle 'tomtom/tcomment_vim'             " ctrl+-でコメント
NeoBundle 'LeafCage/yankround.vim'          " yanc 拡張

" for UI
NeoBundle 'w0ng/vim-hybrid'                 " color scheme 1
NeoBundle 'jpo/vim-railscasts-theme'        " color scheme 2

call neobundle#end()

filetype plugin indent on

NeoBundleCheck


" --------------------------------------------------------------------------
" unite settings
" --------------------------------------------------------------------------
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>




" --------------------------------------------------------------------------
" basic configrations
" --------------------------------------------------------------------------
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
set noundofile                       " undofile無効化
set number                           " ライン番号

set mouse=a                          " ターミナルでマウスを使用できるようにする
set guioptions+=a
set ttymouse=xterm2
set incsearch                         " インクリメンタルサーチ
set wildmenu wildmode=list:full       " メニュー(http://www.atmarkit.co.jp/ait/articles/1107/21/news115_2.html)
set cursorline                        " カーソルライン表示

set formatoptions+=mM                 "全角連結時の空白未挿入
set ambiwidth=double                  "全角文字カーソル位置補正
set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,                   " コンマの後に自動的にスペースを挿入%l)/%L%8P\ 

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-2004,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"set whichwrap=b,s,h,l,<,>,[,]        " カーソルを行頭、行末で止まらないようにする
"set modelines=0                      " モードラインは無効
"set clipboard+=unnamed               " OSのクリップボードを使用する
"set clipboard=unnamed                " ヤンクした文字は、システムのクリップボードに入れる
" imap <C-p> <ESC>"*pa                " 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする

"highlight Normal ctermbg=black ctermfg=grey
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

" help file
set helpfile=$VIMRUNTIME/doc/help.txt


"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=cyan
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
augroup END

" --------------------------------------------------------------------------
" plugin settings
" --------------------------------------------------------------------------
" minibuf
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" --------------------------------------------------------------------------
" post settings
" --------------------------------------------------------------------------
filetype plugin on                    " ファイルタイプ判定をon
syntax enable                         " syntax on
colorscheme railscasts

