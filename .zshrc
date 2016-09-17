#!/bin/zsh-4.3.10

########################################################
#PATHの設定
########################################################
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export PATH=/usr/local/go/bin:$PATH
#/usr/local/bin を優先して読むために先頭に追加
export PATH=/usr/local/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache #pipのダウンロードキャッシュ
export GOPATH=$HOME/go

#見つからないのでコメントアウト
#source /usr/local/bin/virtualenvwrapper.sh

#########################################################
#補完の設定
#########################################################
autoload -U compinit  #補完設定
compinit
setopt list_packed    #補完候補を詰めて表示
setopt auto_list      #補完候補が複数のとき、C-dなしでリストを表示。
setopt always_last_prompt #補完候補を表示した後、カーソルは編集中の行に復帰
setopt complete_in_word #カーソルの位置に補うことで単語を完成させる
setopt list_types  #補完候補にファイル種を標示

setopt   auto_list auto_param_slash list_packed rec_exact
unsetopt list_beep
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
    _approximate _list _history

autoload bashcompinit
bashcompinit

##########################################################
#言語設定
#########################################################
export LANG="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LC_TIME=C
export LC_MESSAGES=C
export LC_NUMERIC=C

##########################################################
#プロンプトの設定 http://journal.mycom.co.jp/column/zsh/002/index.html
##########################################################
#PROMPT="[%m:%~] %n%% " # %/はcwdを表す。%%でエスケープシーケンス"%" 。%mでホスト。%nで名前
#PROMPT='[${USER}@${HOSTNAME}] %(!.#.$) '
#通常のプロンプト
PROMPT="%{[04;35m%}[%n]%%%{[m%} "
#PROMPT="%{[35m%}YUKI.N>[m%} "
#右プロンプト
RPROMPT="[%m:%~]"
#二行以上のコマンド用
PROMPT2="%_%% "  
#間違った時のプロンプト
SPROMPT="%rのことですの？ [n,y,a,e]: "

#terminalに表示されるラベル
case "${TERM}" in
    kterm*|xterm*)
	precmd(){
            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	}
	;;
esac

#########################################################
#ヒストリの設定
#########################################################
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history        # コマンド履歴の共有 
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 
setopt hist_save_nodups     # ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

#########################################################
#その他もろもろ
########################################################
setopt auto_cd      #おーとcd ディレクトリ名だけで移動可能
setopt auto_pushd   #cd -[tab]で移動履歴を参照
#setopt auto_menu    #タブキーで補完候補を順に表示
setopt list_types   #補完候補一覧でファイルの種別を識別マーク表示
setopt correct      #コマンド自動修正
setopt nolistbeep   #ビープを消す   
bindkey -e          #emacs風keyバインド
setopt list_packed  #補完候補を詰めて表示
setopt nolistbeep   #beepを消す


##########################################################
#シェル変数
#########################################################
[[ $TERM = "eterm-color" ]] && TERM=xterm-color

##########################################################
#色
##########################################################
autoload -U colors
colors
# lsコマンドの補完候補にも色付き表示
zstyle ':completion:*' list-colors ''
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


#########################################################
#エイリアスの設定
#########################################################
alias ls="ls -CGF"
alias la="ls -A"
alias ll="ls -al"
alias screen="screen -s zsh"	#screen起動時に$SHELLでなくzshを開く
alias -s py=python
alias g="git"
alias gs="git status"
alias gl="git log"
alias gitop="git rev-parse --show-toplevel"
alias gap="git add -p"
alias gdfc="git diff --cached"
alias pyrar="~/python/py_tools/test.py"
alias pytool="~/python/py_tools/py_rename.py"
alias cb="pbcopy"

function chpwd() { ls -FGC } #cdした後に自動でls

########################################################
#~~~~~~~~~~~~~~~~~~~~~~~~備考~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#
#
#
###########

