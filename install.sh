#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing dependencies from Brewfile..."
brew tap Homebrew/bundle
brew bundle

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zsh plugins..."
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > ~/.iterm2_shell_integration.zsh

echo "Installing poetry..."
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
source $HOME/.poetry/env
poetry completions zsh > $HOME/.zsh/completions/_poetry

echo "Installing python 3.7..."
pyenv install -s 3.7.5
pyenv global 3.7.5

# Accept Xcode license
# sudo xcodebuild -license accept

# Make git use diff-so-fancy for every output
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# source ~/.zshrc

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < ~/Projects/personal/dotfiles/vscode/extensions.txt

echo "==> Done!"
