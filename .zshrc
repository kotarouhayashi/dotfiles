# Pathの追加
PATH="$PATH:$HOME/.cargo/bin"
# エディタの環境変数

export EDITOR=code
#ユーザの bin ディレクトリへパスを通す（一旦適当）
# export PATH=$PATH:~/bin

# Set up the prompt
# スターシップ
eval "$(starship init zsh)"

# fzfの読み込み
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use emacs keybindings even if our EDITOR is set to vi（ここ適当）
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history: （exportに変更）
export HISTSIZE=100000
export SAVEHIST=1000000
# HISTFILE=~/.zsh_history

# Use modern completion system(ココらへん適当)
autoload -Uz compinit         # 保管機能を有効にする
compinit                      # 実行する
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#==============================================================#
##          Aliases                                           ##
#==============================================================#
## common ##
alias cp='cp -irf' #-i前にプロンプ​​トを表示,-rディレクトリとその内容を再帰的にコピー,-f既存の保存先ファイルを開くことができない場合、それを削除して再試行します。
alias mv='mv -i' #-i前にプロンプ​​トを表示
alias ..='cd ..'
alias cl='clear'
 ##-i前にプロンプ​​トを表示,-rディレクトリとその内容を再帰的に削除,-f存在しないファイルや引数を無視し、プロンプトを出さない

# ls
alias ls='ls --color=auto'
alias la='ls -aF --color=auto' #-a, --all、-F, /等のインジケーターの表示
alias ll='ls -lh --color=auto' #-l, パーミッション等長い表示(use a long listing format),-h単位をkバイト表示
alias l.='ls -d .[a-zA-Z]* --color=auto' #全てのディレクトリ表示
alias lla='ls -alFh --color=auto'

# chmod
# 左から順に オーナー(owner)、グループ(group、同じサーバーを利用できるユーザ全体)、アザー(other)
# rwx…rは読み込み(read)、wは書き込み(write)、x(execlution)
# 数字
# 読むことができる (Readable)	r	4
# 書くことができる (Writable)	w	2
# 実行することができる (eXecutable)	x	1
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

# grep
alias gre='grep -n -I -H --color=auto' #-n行数表示, -Iバイナリファイルが一致するデータを含んでいないかのように処理します。,-Hマッチするファイル名を表示します。 これは、検索するファイルが複数ある場合のデフォルト

# development alias
alias tl=tldr
alias cat=bat
alias py=python3
alias nfetch=neofetch
alias top=btm
alias date="tty-clock -s -C 4"

## application
# vscode
# alias code="$EDITOR"



#==============================================================#
##          Suffix                                            ##
#==============================================================#
# zshのalias -s (suffix alias)…打ったコマンドの後ろ(suffix)を見て, 適当に宜しくやってくれるやつ
# ~$ alias -s py=python としておけば
# ~$ ./hello.py ←で実行可能
alias -s {md,markdown,txt}="$EDITOR"
alias -s py='python3'
# alias -s {html,gif,mp4}='x-www-browser'
# alias -s {jpg,jpeg,png,bmp}='feh'
# alias -s mp3='mplayer'
function extract() {
	case $1 in # 第一引数にあるならば以下のコマンドで展開
		*.tar.gz|*.tgz) tar xvf "$1" ;; #z,gzipコマンドで伸張処理を行う,x展開する,v処理したファイルを出力する,fアーカイブファイルを使うこと
		*.tar.xz) tar xvf "$1" ;;
		*.zip) unzip "$1" ;;
		*.tar.bz2|*.tbz) tar xvf "$1" ;;
		*.gz) gzip -d "$1" ;;
		*.bz2) bzip2 -dc "$1" ;;
		*.tar) tar xvf "$1" ;;
	esac
}
alias -s {gz,tgz,zip,bz2,tbz,tar}=extract

# 関数で引数を10個以上取る.なんか便利そうだから例を下に置いておく。
# function runcpp () { g++ $1 && shift && ./a.out $@ }


# Easily jump
alias jump='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"' #選択式のcd:現在のディレクトリからツリーを表示


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# zinit settings
# シンタックスハイライト(有効なコマンドや引数の場合にハイライトが効く)
zinit light zdharma/fast-syntax-highlighting
# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word
# 自動保管
zinit light marlonrichert/zsh-autocomplete


# Settings Options
# Changing Directories
unsetopt auto_cd                # ディレクトリ名の入力のみで移動することをやめる
setopt auto_pushd               # 自動でpushdを実行
setopt pushd_ignore_dups        # pushdから重複を削除
setopt pushd_silent             #p ushd コマンドの移動の際にディレクトリスタックを表示しない
DIRSTACKSIZE=100                #ディレクトリスタックの上限数を20に

# Completion
setopt list_packed              #補完候補をできるだけ詰めて表示する
setopt auto_param_slash         #ディレクトリ名の補完時に / を付加
setopt no_beep                  # コマンド入力エラーでビープ音を出す
setopt   glob_complete          # 現在の単語がグロブパターンのとき、パターンにマッチしたものを生成し、サイクルする
# setopt complete_in_word         # 単語の入力途中でもTab補完を有効化

# History
setopt append_history           # 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt inc_append_history       # コマンドが入力されるとすぐに追加
# unsetopt extended_history       #履歴ファイルに時刻を記録しない
setopt histignorealldups        # 同じコマンドを連続して実行しても履歴としては 1 回しか出てこないよう

# Job Control
setopt notify                   # バックグラウンドジョブの状態変化を即時報告する

# zoxide  zinitよりあとに読み込まないと、alias,ziがzinitを起動することになる
eval "$(zoxide init zsh)"


# neofetch,btm,spanしてくれる。
# alias = oretuyo=neofetch

