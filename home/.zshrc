# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# Options
# setopt hist_ignore_dups
# setopt hist_expire_dups_first

# General
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

# Plugins
plugins=(alias-tips
        dirhistory
        fancy-ctrl-z
        fast-syntax-highlighting
        git
        z
        zsh-autosuggestions
        zsh-navigation-tools)


# Theme
ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.iterm2_shell_integration.zsh



#Added /include CFLAGS so XCode is working properly
export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"


# Commands
export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

if [[ -o login ]]; then
    export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi

#Functions
function lc () {
    cd $1 &&
    la $2
}

mkcd ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

DEFAULT_USER="deniz"
prompt_context(){}
