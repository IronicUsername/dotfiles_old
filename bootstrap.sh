#!/bin/bash
echo "==> Running bootstrap.sh"

# echo "Updating OSX..."
# sudo softwareupdate --install --all --verbose

# echo "Installing Xcode command line tools..."
# touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# CMD_LINE_TOOLS=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
# sudo softwareupdate -i "$CMD_LINE_TOOLS" --verbose
# rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# xcode-select --install

echo "Creating work and personal folder..."
mkdir -p $HOME/Development/.archive
mkdir -p $HOME/Development/personal
mkdir -p $HOME/Development/notes
mkdir -p $HOME/Development/tools
mkdir -p $HOME/Development/sandbox
mkdir -p $HOME/Development/work
mkdir -p $HOME/.ssh
mkdir -p $HOME/Music/soundcloud/
ln -s $HOME/Music/soundcloud $HOME/Downloads/music

echo "Cloning dotfiles repo..."
mkdir -p $HOME/.personal
cd $HOME/.personal
git clone https://github.com/IronicUsername/dotfiles.git
cd dotfiles
ln -s $HOME/.personal/dotfiles $HOME/Development/personal/dotfiles

# Installs
./install.sh

# Defaults + Dockutil configuration
./osx.sh

# Symlinks
./symlinks.sh

# SSH permissions
./ssh/ssh.sh
