caffeinate -i $HOME/.zsh/install.sh
stty discard undef
ZSH_DISABLE_COMPFIX=true

# Path to oh-my-zsh installation.
export ZSH="$HOME/.zsh/oh-my-zsh"
export TERM="xterm-256color"

# Options
# setopt hist_ignore_dups
# setopt hist_expire_dups_first

# General
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Comand exec time stamp in history file
HIST_STAMP="yyyy-mm-dd"

# Plugins
ZSH_CUSTOM="$HOME/.zsh/custom"
plugins=(
    alias-tips
    dirhistory
    # fancy-ctrl-z
    git
    osx
    poetry
    z
    zsh-autosuggestions
    zsh-navigation-tools
    zsh-syntax-highlighting #must be last
)

# Theme
ZSH_THEME="agnoster-custom"

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh


# Added /include CFLAGS so XCode is working properly
export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"


# Commands
export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH
export PATH=$HOME/.flutter/flutter/bin:$PATH
export PATH=/usr/local/opt/openjdk/bin:$PATH
export ANDROID_HOME=/usr/local/share/android-sdk

export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# TheFuck
eval $(thefuck --alias)

# Start
if [[ ! $POETRY_ACTIVE ]] && [[ $TERM_PROGRAM != "vscode" ]]; then
    screenfetch
fi
