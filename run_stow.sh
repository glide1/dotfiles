#!/bin/sh

source utilities.bash

source_dir=''
get_source_directory source_dir "${BASH_SOURCE[0]}"
echo $source_dir

pushd $source_dir
echo 'stowing zsh'
../homebrew/bin/stow zsh
popd