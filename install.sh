#!/bin/bash
echo "==> Running install.sh"

echo "Creating work and personal folder..."
mkdir -p $HOME/{.ssh/,.config/,Music/soundcloud/,Development/{.archive/,personal/,notes/,tools/,sandbox/,work/}}
echo "Cloning dotfiles repo..."
git clone https://github.com/IronicUsername/dotfiles.git $HOME/.config/

# EY LINK FERDAMDE AGST!!!
ln -s $HOME/.config/dotfiles $HOME/Development/personal/dotfiles
ln -s $HOME/Music/soundcloud $HOME/Downloads/soundcloud

# Apps
./_install/apps.sh

# Shell
./_install/shell.sh

# Settings
./_install/setup.sh

source $HOME/.zshrc
echo "==> install.sh done!"
