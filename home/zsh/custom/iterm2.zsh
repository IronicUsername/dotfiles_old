if [ ! -f $HOME/.zsh/custom/iterm2_shell_integration.zsh ]; then
    echo "Installing iTerm2 integration..."
    curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.zsh/custom/iterm2_shell_integration.zsh
fi
source $HOME/.zsh/custom/iterm2_shell_integration.zsh
