echo "> installing apps..."

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing dependencies from Brewfile..."
sudo -v
brew tap Homebrew/bundle
brew tap homebrew/cask-fonts
brew bundle

echo "Installing Node Version Managment..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo "Installing iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.zsh/custom/iterm2_shell_integration.zsh

echo "Installing poetry..."
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

echo "Installing python..."
PYTHON27_VERSION="2.7.18" # Needed for npm
pyenv install "$PYTHON27_VERSION"
echo "Python 3.6.8 ..."
pyenv install 3.6.8
echo "Python 3.7.5 ..."
pyenv install 3.7.5
echo "Python 3.9.5 ..."
pyenv install 3.9.5

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < $HOME/.config/dotfiles/vscode/extensions.txt

echo "> done!"
