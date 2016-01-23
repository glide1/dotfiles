#!/usr/bin/env zsh

set -e

if ! command -v rustc &> /dev/null ; then
    curl -sSf https://static.rust-lang.org/rustup.sh | sh
fi

pushd ~/
    mkdir -p sources
    pushd sources
    if [ ! rust ]; then
        git clone git@github.com:rust-lang/rust.git
    fi

    pushd rust
        git pull
    popd

    if [ ! racer ]; then
        git clone git@github.com:phildawes/racer.git
    fi
    pushd racer
    git pull
    cargo build --release
    popd

    if ! command -v rustfmt &> /dev/null ; then
        cargo install rustfmt
    fi

    popd

popd
