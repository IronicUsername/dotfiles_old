if [ ! -f $HOME/.iterm2_shell_integration.zsh ]; then
    echo "Installing iTerm2 integration..."
    curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh
fi
source $HOME/.iterm2_shell_integration.zsh
