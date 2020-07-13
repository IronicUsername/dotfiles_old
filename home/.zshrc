caffeinate -i $HOME/.zsh/install.sh

#Path to oh-my-zsh installation.
export ZSH="$HOME/.zsh/oh-my-zsh"
export TERM="xterm-256color"

#Options
# setopt hist_ignore_dups
# setopt hist_expire_dups_first

#General
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
SAVEHIST=99999

#Comand exec time stamp in history file
HIST_STAMP="yyyy-mm-dd"

#Plugins
ZSH_CUSTOM="$HOME/.zsh/custom"
plugins=(
    alias-tips
    dirhistory
    # fancy-ctrl-z
    git
    osx
    z
    zsh-autosuggestions
    zsh-navigation-tools
    zsh-syntax-highlighting #must be last
)

#Theme
ZSH_THEME="agnoster-custom"

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.iterm2_shell_integration.zsh



#Added /include CFLAGS so XCode is working properly
export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include"


#Commands
export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export GREP_COLOR="1;32"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
export PATH=$HOME/Applications/bin:$PATH
export PATH=$HOME/.flutter/flutter/bin:$PATH
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
export ANDROID_HOME=/usr/local/share/android-sdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#TheFuck
eval $(thefuck --alias)

#Pyenv (workaround)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#Poetry
source $HOME/.poetry/env

if [[ -o login ]]; then
    export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
fi

###-tns-completion-start-###
if [ -f /Users/deniz/.tnsrc ]; then
    source /Users/deniz/.tnsrc
fi
###-tns-completion-end-###

###-tns-completion-start-###
if [ -f /Users/deniz/.tnsrc ]; then
    source /Users/deniz/.tnsrc
fi
###-tns-completion-end-###

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

#Start
# DEFAULT_USER="deniz"
# prompt_context(){} idk
if [[ ! $POETRY_ACTIVE ]] && [[ $TERM_PROGRAM != "vscode" ]]; then
   screenfetch
fi
