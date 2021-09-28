#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing dependencies from Brewfile..."
sudo -v
brew tap Homebrew/bundle
brew tap homebrew/cask-fonts
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

echo "Setting up pyenv..."
ln -s $HOME/.personal/dotfiles/home/.zprofile $HOME/.zprofile

echo "Setuping .zsh..."
mkdir -p $HOME/.zsh/completions
mkdir -p $HOME/.zsh/custom/themes
mkdir -p $HOME/.zsh/custom/plugins
cp -R $HOME/.personal/dotfiles/home/install.sh $HOME/.zsh/
cp -R $HOME/.personal/dotfiles/home/custom $HOME/.zsh/
touch $HOME/.hushlogin

echo "Installing oh-my-zsh..."
export ZSH=$HOME/.zsh/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zsh plugins..."
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.zsh/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git $HOME/.zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/custom/plugins/zsh-syntax-highlighting

echo "Installing oh-my-zsh custom theme"
ln -s $HOME/.personal/dotfiles/home/themes/agnoster-custom.zsh-theme $HOME/.zsh/custom/themes/
ln -s $HOME/.personal/dotfiles/home/themes/agnoster-custom-server.zsh-theme $HOME/.zsh/custom/themes/

echo "Installing tmux themes and addons"
git clone https://github.com/jimeh/tmux-themepack.git $HOME/.mypref/tmux-themepack
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "Installing powerline fonts..."
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts

echo "Installing Node Version Managment..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh
ln -s $HOME/.personal/dotfiles/iterm/ $HOME/.mypref/iterm2

echo "Installing pip packages..."
pip3 install virtualenv six

echo "Installing and setting up poetry..."
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
source $HOME/.poetry/env
poetry completions zsh > $HOME/.zsh/completions/_poetry
poetry config virtualenvs.in-project true

mkdir $HOME/.zsh/custom/plugins/poetry
poetry completions zsh > $HOME/.zsh/custom/plugins/poetry/_poetry

echo "Installing python..."
PYTHON27_VERSION="2.7.18" # Needed for npm
pyenv install "$PYTHON27_VERSION"
echo "Python 3.6.8 ..."
pyenv install 3.6.8
echo "Python 3.7.5 ..."
pyenv install 3.7.5
echo "Python 3.9.5 ..."
pyenv install 3.9.5
echo "Set Python globally"
pyenv global 3.9.5

echo 'eval "$(pyenv init --path)"' >> $HOME/.zprofile


# Make git use diff-so-fancy for every output
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# source $HOME/.zshrc

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < $HOME/.personal/dotfiles/vscode/extensions.txt

echo "==> Done!"
