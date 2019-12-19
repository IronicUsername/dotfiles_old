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

echo "Creating Workfolder and personal folder..."
mkdir -p ~/Development/personal

echo "Cloning dotfiles repo..."
mkdir -p ~/.personal/config
cd ~/.personal/config
git clone https://github.com/IronicUsername/dotfiles.git
cd dotfiles
ln -s $HOME/.personal/config/dotfiles $HOME/Development/personal/dotfiles

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install for MacOS
    ./install-osx.sh

    # Defaults + Dockutil configuration
    ./osx.sh

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Install for Linux
    ./install-lnx.sh
else
    echo "Wtf are you doing?"
    exit
fi

# Install for both
./install.sh

# Symlinks
./symlinks.sh

# SSH permissions
./ssh.sh
