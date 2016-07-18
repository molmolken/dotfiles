set laststatus=2 " 常にステータスラインを表示
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v(ASCII=%03.3b,HEX=%02.2B)\ %l/%L(%P)%m
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" インデント
set autoindent
set smartindent
set cindent
set cinkeys-=0#
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

"タブをスペースに展開しない
"set noexpandtab

syntax on

set showcmd        " 入力中のコマンドを表示
set number          " 行番号表示
set list              " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:$

set display=uhex      "" 印字不可能文字を16進数で表示

set wildmenu

