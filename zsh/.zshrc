export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

source "${HOME}/.zshenv"

zstyle ':completion:*' menu select

zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "Tarrasch/zsh-autoenv"

zplug "zsh-users/zsh-completions"

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

source ~/.iterm2_shell_integration.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load