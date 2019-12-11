#!/bin/bash
echo -e "\e[1;31m==> Running install.sh\e[0m"

echo -e "\e[1;31mInstalling Homebrew...\e[0m"
git clone https://github.com/Homebrew/brew.git $HOME/.homebrew

echo -e "\e[1;31mInstalling dependencies from Brewfile...\e[0m"
brew tap Homebrew/bundle
brew bundle

echo -e "\e[1;31mSetuping .zsh...\e[0m"
mkdir -p $HOME/.zsh/completions
mkdir -p $HOME/.zsh/custom
mkdir -p $HOME/.zsh/oh-my-zsh
cp -R $HOME/.personal/config/dotfiles/home/zsh_setup.sh $HOME/.zsh/
cp -R $HOME/.personal/config/dotfiles/home/custom $HOME/.zsh/
export ZSH="$HOME/.zsh/oh-my-zsh" # So oh-my-zsh can isntall in .zsh

echo -e "\e[1;31mInstalling oh-my-zsh...\e[0m"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "\e[1;32mInstalling zsh plugins...\e[0m"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/djui/alias-tips.git $ZSH/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting

echo -e "\e[1;31mInstalling oh-my-zsh custom theme\e[0m"
cp $HOME/.personal/config/dotfiles/home/themes/agnoster-custom.zsh-theme $ZSH/custom/themes/

echo -e "\e[1;31mInstalling powerline fonts...\e[0m"
git clone https://github.com/powerline/fonts.git
(
    cd fonts
    ./install.sh
)
rm -rf fonts

echo -e "\e[1;31mInstalling iTerm2 Shell Integration...\e[0m"
curl -sL https://iterm2.com/shell_integration/zsh > $HOME/.iterm2_shell_integration.zsh

echo -e "\e[1;31mInstalling and setting up poetry...\e[0m"
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
poetry completions zsh > $HOME/.zsh/completions/_poetry
poetry config settings.virtualenvs.in-project true

echo -e "\e[1;31mInstalling python...\e[0m"
echo -e "\e[1;32mPython 3.7.5 ...\e[0m"
pyenv install 3.7.5
echo -e "\e[1;32mPython 3.6.8 ...\e[0m"
pyenv install 3.6.8
echo -e "\e[1;32mSet Python globally\e[0m"
pyenv global 3.7.5

# Accept Xcode license
sudo xcodebuild -license accept

# Make git use diff-so-fancy for every output
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# source $HOME/.zshrc

# VSCode packages
echo -e "\e[1;31mInstalling VSCode Packages...\e[0m"
xargs -n 1 code --install-extension < $HOME/.personal/config/dotfiles/vscode/extensions.txt

echo -e "\e[1;31m==> Done!\e[0m"
