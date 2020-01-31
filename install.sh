#!/bin/bash
echo "==> Running install.sh for LINUX and OSX"

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

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    sh ./install.sh
)
rm -rf fonts

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

# Make git use diff-so-fancy for every output
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

echo "==> Done!"
