#!/bin/bash
echo "==> Running install-osx.sh for OSX platform"

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < $HOME/.personal/config/dotfiles/vscode/extensions.txt

# Accept Xcode license
sudo xcodebuild -license accept

# source $HOME/.zshrc

echo "==> Done!"
