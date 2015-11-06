#!/usr/bin/env bash -ex

function realpath() {
    if [[ $1 = /* ]]; then
        echo "$1"
    else
        echo "$PWD/${1#./}"
    fi
}

# Setup symlinks
for l in (.aliases
          .gitignore_global
          .pythonrc
          .tmux.conf
          .vimrc
	  .zshrc)
do
    ln -s $(realpath)$l ~/$l
done
