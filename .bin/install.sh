#!/usr/bin/bash
set -ue

link_to_homedir() {
  if [ ! -d "$HOME/.dotbackup" ];then
    command mkdir "$HOME/.dotbackup"
  fi
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})

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
}

link_to_homedir
# git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"
