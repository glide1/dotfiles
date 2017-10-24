
source "${HOME}/dotfiles/zgen/zgen.zsh"

source "${HOME}/.zshenv"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/cargo
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/gitignore
    zgen oh-my-zsh plugins/nvm
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/yarn
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load Tarrasch/zsh-autoenv

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-history-substring-search
EOPLUGINS
    # ^ can't indent this EOPLUGINS

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/agnoster

    # save all to init script
    zgen save
fi

function code {  
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

export RUST_SRC_PATH="${HOME}/sources/rust/src"
source ~/.iterm2_shell_integration.zsh

export NVM_DIR="/${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

