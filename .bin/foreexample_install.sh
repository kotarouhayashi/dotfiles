
#!/usr/bin/env bash
set -ue # # -e実行したコマンドが失敗する（0以外を返す）と、そこでシェルスクリプトの実行を終了する。

# """"""""""""""""""""""""""""""""""""""""""""""""
# スクリプトの使用方法を表示する関数
# helpmsg() {
#   command echo "Usage: $0 [--help | -h]" 0>&2
#   command echo ""
# }
# """"""""""""""""""""""""""""""""""""""""""""""""


# ドットファイルをホームディレクトリにシンボリックリンクでリンクする関数
# また、古いドットファイルをバックアップするためのディレクトリを作成することができます。
link_to_homedir() {
#   command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    # command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

# 環境変数$HOMEが$dotdirと等しくない場合、$dotdir内の.で始まる全てのファイルやディレクトリ（.gitは除く）に対して、ユーザーのホームディレクトリにシンボリックリンクを作成
# これだと、windowsとlinuxの結合のときうまくできない。（自分の場合、環境変数とdotdirの名前が同じであるため）
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  # if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
#   else
#     command echo "same install src dest"
#   fi
}

# """"""""""""""""""""""""""""""""""""""""""""""""
# コマンドライン引数を処理するためのwhileループがあります。
# --debugまたは-dフラグがある場合は、スクリプトの実行過程が出力されます。
# --helpまたは-hフラグがある場合は、使用方法を表示してスクリプトを終了します。

# while [ $# -gt 0 ];do
#   case ${1} in
#     --debug|-d)
#       set -uex
#       ;;
#     --help|-h)
#       helpmsg
#       exit 1
#       ;;
#     *)
#       ;;
#   esac
#   shift
# done
# """"""""""""""""""""""""""""""""""""""""""""""""

link_to_homedir
# Gitの共通設定が設定されます。
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"