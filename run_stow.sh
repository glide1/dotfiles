#!/bin/sh

source `dirname $0`/utilities.bash

source_dir=''
get_source_directory source_dir "$0"
echo $source_dir


pushd $source_dir
echo 'stowing zsh'
stow zsh
stow tmux
stow iterm
stow git

popd


ln -sf `dirname $0`/asdf $HOME/.asdf