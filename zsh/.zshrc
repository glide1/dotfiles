export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

source "${HOME}/.zshenv"

zstyle ':completion:*' menu select
zplug "zsh-users/zsh-syntax-highlighting"
zplug "Tarrasch/zsh-autoenv"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq

zplug "changyuheng/zsh-interactive-cd", as:plugin
zplug "jreese/zsh-titles", as:plugin

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

fpath+=~/.zfunc

source ~/.iterm2_shell_integration.zsh
 
source ~/.zsh_custom/.fzf_custom.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history


SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  exec_time     # Execution time

  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character 
)

SPACESHIP_RPROMPT_ORDER=(
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true

if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

eval "$(nodenv init -)"
