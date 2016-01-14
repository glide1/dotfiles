#!/bin/sh

source_dir=''
get_source_directory source_dir "$0"
echo $source_dir

source utilities.bash


pushd $source_dir
pushd powerline_fonts
./install.sh
popd
popd