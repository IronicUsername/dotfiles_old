#!/bin/bash
echo -e "\e[1;31m==> Running bootstrap.sh\e[0m"

# echo "Updating OSX..."
# sudo softwareupdate --install --all --verbose

# echo "Installing Xcode command line tools..."
# touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# CMD_LINE_TOOLS=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
# sudo softwareupdate -i "$CMD_LINE_TOOLS" --verbose
# rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# xcode-select --install

echo -e "\e[1;31mCreating Workfolder and personal folder...\e[0m"
mkdir -p ~/Development/personal

echo -e "\e[1;31mCloning dotfiles repo...\e[0m"
mkdir -p ~/.personal/config
cd ~/.personal/config
git clone https://github.com/IronicUsername/dotfiles.git
cd dotfiles

# Installs
./install.sh

# Defaults + Dockutil configuration
./osx.sh

# Symlinks
./symlinks.sh

# SSH permissions
./ssh.sh
