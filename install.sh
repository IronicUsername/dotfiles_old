#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing dependencies from Brewfile..."
brew tap Homebrew/bundle
brew bundle

echo "Setuping .zsh..."
mkdir -p $HOME/.zsh/completions
mkdir -p $HOME/.zsh/custom/themes
mkdir -p $HOME/.zsh/custom/plugins
cp -R $HOME/.personal/config/dotfiles/home/install.sh $HOME/.zsh/
cp -R $HOME/.personal/config/dotfiles/home/custom $HOME/.zsh/

echo "Installing oh-my-zsh..."
export ZSH=$HOME/.zsh/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zsh plugins..."
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git $HOME/.zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/custom/plugins/zsh-syntax-highlighting

echo "Installing oh-my-zsh custom theme"
cp $HOME/.personal/config/dotfiles/home/themes/agnoster-custom.zsh-theme $HOME/.zsh/custom/themes/

# incoming
# echo "Installing tmux themes"

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh

echo "Installing virtualenv..."
pip install virtualenv

echo "Installing and setting up poetry..."
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
source $HOME/.poetry/env
poetry completions zsh > $HOME/.zsh/completions/_poetry
poetry config virtualenvs.in-project true

echo "Installing python..."
echo "Python 3.7.5 ..."
pyenv install 3.7.5
echo "Python 3.6.8 ..."
pyenv install 3.6.8
echo "Set Python globally"
pyenv global 3.7.5

# Accept Xcode license
sudo xcodebuild -license accept

# Make git use diff-so-fancy for every output
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# source $HOME/.zshrc

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < $HOME/.personal/config/dotfiles/vscode/extensions.txt

echo "==> Done!"
