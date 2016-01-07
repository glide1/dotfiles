#!/bin/sh

#ask for password here
sudo -v
#keep the password alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#install to homebrew.
pushd ~
mkdir homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew
popd

export PATH="~/homebrew/bin:$PATH"

brew install wget cmake watch gnu-sed coreutils psutils tmux tmux-mem-cpu-load git zsh mc wget vim
brew install emacs --with-gnutls --with-imagemagick --with-mailutils --with-librsvg --with-glib
brew install stow


brew tap railwaycat/emacsmacport
brew cask install emacs-mac
brew cask install alfred --appdir=/Applications
brew cask install colloquy slack --appdir=/Applications
brew cask install dockertoolbox
#otto gives vagrant... wow hashicorp.
#brew cask install otto