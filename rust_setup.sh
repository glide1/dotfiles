#!/usr/bin/env zsh

set -e

if ! command -v rustc &> /dev/null ; then
    curl -sSf https://static.rust-lang.org/rustup.sh | sh
fi

pushd ~/
mkdir -p sources

if [ ! rust ]; then
    git clone git@github.com:rust-lang/rust.git
fi

if [ ! racer ]; then
    git clone git@github.com:phildawes/racer.git
    pushd racer
    cargo build --release
    popd
fi

if ! command -v rustfmt &> /dev/null ; then
    cargo install rustfmt
fi


popd
