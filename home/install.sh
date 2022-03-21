#!/bin/zsh
ZSH_CUSTOM_PLUGINS=$HOME/.zsh/custom/plugins
mkdir -p $ZSH_CUSTOM_PLUGINS

if [ ! -d $HOME/.zsh/oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    git clone -q https://github.com/robbyrussell/oh-my-zsh.git $HOME/.zsh/oh-my-zsh
fi

if [ ! -d $ZSH_CUSTOM_PLUGINS/alias-tips/ ]; then
    echo "Installing alias-tips..."
    git clone -q https://github.com/djui/alias-tips.git $ZSH_CUSTOM_PLUGINS/alias-tips
fi

if [ ! -d $ZSH_CUSTOM_PLUGINS/zsh-autosuggestions/ ]; then
    echo "Installing zsh-autosuggestions..."
    git clone -q https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM_PLUGINS/zsh-autosuggestions
fi

if [ ! -d $ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting/ ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting
fi
