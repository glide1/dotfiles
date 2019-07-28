#!/bin/sh
set -e
set -v

git submodule update --remote --merge
brew update
brew bundle