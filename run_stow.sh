#!/bin/sh

source `dirname $0`/utilities.bash

source_dir=''
get_source_directory source_dir "$0"
echo $source_dir


pushd $source_dir
echo 'stowing zsh'
../homebrew/bin/stow zsh
../homebrew/bin/stow spacemacs
../homebrew/bin/stow tmux
../homebrew/bin/stow iterm
popd
