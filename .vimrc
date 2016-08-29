set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
""""""""""""""""""""
" 基本設定
""""""""""""""""""""
set number      " 行番号表示
set showcmd     " 入力中のコマンドを表示

""""""""""""""""""""
" インデント
""""""""""""""""""""
set autoindent  " 前の行のインデントを維持
set smartindent " 前の行末によってインデントを増減
set cindent     " 上の2つよりも賢い
set cinkeys-=0# " cindentから"#"は無視

""""""""""""""""""""
" タブ
""""""""""""""""""""
set expandtab       " ソフトインデント
set tabstop=4       " 画面上のタブの長さ
set shiftwidth=4    " cindentの幅
set softtabstop=4   " tabの幅

""""""""""""""""""""
" 検索/置換の設定
""""""""""""""""""""
set hlsearch    " 検索文字列をハイライト
set incsearch   " インクリメンタルサーチ
set ignorecase  " 大文字と小文字を区別しない
set smartcase   " 大文字と小文字が混在している場合のみ大文字と小文字を区別
set wrapscan    " 最後尾まで検索したら先頭に移る
"set gdefault    " 置換時にgオプションをデフォルトにする




syntax on

set list        " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:$

set display=uhex    " 印字不可能文字を16進数で表示

set wildmenu    " コマンドライン補完の拡張モード

"デフォルトStatusLineのBold表示をやめる
hi StatusLine cterm=reverse
"InsertMode時のStatusLineカラーを変更
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
"NormalMode時のStatusLineカラーを変更
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Black ctermbg=White cterm=none

