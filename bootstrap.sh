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
mkdir -p ~/Development/personal

echo "Cloning dotfiles repo..."
mkdir -p ~/.personal/config
cd ~/.personal/config
git clone https://github.com/IronicUsername/dotfiles.git
cd dotfiles
ln -s $HOME/.personal/config/dotfiles $HOME/Development/personal/dotfiles

echo "Installing Homebrew..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    # for MacOS
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # for Linux
    export HOMEBREW_BUNDLE_CASK_SKIP="github godot google-chrome insomnia iterm2 psquel slack sensiblesidebuttons spotify visual-studio-code whatsapp"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
else
    echo "Wtf are you doing dude?"
    exit
fi

# Install for both
./install.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    ./osx/install-osx.sh
    # Defaults + Dockutil configuration
    # depends on the install.sh for both platforms (brew shit)
    ./osx.sh
    # Symlinks
    ./symlinks.sh

# SSH permissions
# IDK Maaaan
# ./ssh.sh

echo "==> done and done!"
