#!/usr/bin/env bash

#inspired from http://stackoverflow.com/questions/791227/unable-to-update-my-bash-in-mac-by-macports
zsh_loc=$(which zsh)
if [ `grep $zsh_loc /etc/shells` ]; 
then 
    echo $zsh_loc | chsh -s $zsh_loc;     
else 
    echo $zsh_loc | sudo tee -a /etc/shells; 
    chsh -s $zsh_loc; 
fi