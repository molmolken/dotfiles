set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
""""""""""""""""""""
" 基本設定
""""""""""""""""""""
set number      " 行番号表示
set cursorline  " カーソル行にアンダーライン
set showcmd     " 入力中のコマンドを表示
set wildmenu    " コマンドライン補完の拡張モード
set showmatch   " 閉じカッコ入力時に開きカッコを強調表示
set list        " 不可視文字表示
" 不可視文字の表示形式,trailは行末のスペース
set listchars=tab:>.,trail:_,extends:>,precedes:$
set wrap        " 右端で折り返す
set backspace=2 " eol,indent,startをBSで消せる
set whichwrap=b,s   " 行頭行末の左右移動で行を移動
set scrolloff=8 " 上下8行を表示

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

""""""""""""""""""""
" ステータスライン
""""""""""""""""""""
set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
" デフォルトStatusLineのBold表示をやめる
hi StatusLine cterm=reverse
" InsertMode時のStatusLineカラーを変更
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
" NormalMode時のStatusLineカラーを変更
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Black ctermbg=White cterm=none

""""""""""""""""""""
" その他
""""""""""""""""""""
helptags $HOME/.vim/doc " 日本語ヘルプを表示
set helpheight=100      " ヘルプを全体表示





syntax on


set display=uhex    " 印字不可能文字を16進数で表示

