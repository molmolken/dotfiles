""""""""""""""""""""
" Encoding
""""""""""""""""""""
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

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
" Insert Modeから抜ける際にIMEを切り替える
set imdisable
" ファイルタイプによるプラグインとインデントを有効
filetype plugin indent on
set clipboard=unnamed,autoselect
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
" ファイルタイプ設定
""""""""""""""""""""
augroup FileTypeIndent
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal tabstop=2 softtabstop=2
augroup END

""""""""""""""""""""
" その他
""""""""""""""""""""
helptags $HOME/.vim/doc " 日本語ヘルプを表示
set helpheight=100      " ヘルプを全体表示
" 起動時にNERDTreeを起動
autocmd VimEnter * NERDTree ./

""""""""""""""""""""
" dein.vim
""""""""""""""""""""
" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
    autocmd VimEnter * NERDTree ./
endif
"End dein Scripts

""""""""""""""""""""
" vim-go
""""""""""""""""""""
" ハイライトの設定
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"" GoFmt時にインポートするパッケージを整理(GoFmtはファイル書き込み時に自動的に実行される)
let g:go_fmt_command = "goimports"
" <mapleader>のデフォルト値はバックスラッシュ
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>i <Plug>(go-imports)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

""""""""""""""""""""
" others
""""""""""""""""""""
syntax on
set display=uhex    " 印字不可能文字を16進数で表示

""""""""""""""""""""
" neocomplete
""""""""""""""""""""
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" 補完を表示する最小文字数
" let g:neocomplete#auto_completion_start_length = 2:

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" 現在開いているファイルをChromeで開く
au FileType * command! OpenChrome :!open -a /Applications/Google\ Chrome.app %

