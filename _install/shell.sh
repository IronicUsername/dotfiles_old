echo "=> Setuping Shell ..."

ln -s $HOME/.config/dotfiles/zsh/install.sh $HOME/.zsh/
ln -s $HOME/.config/dotfiles/zsh/shell $HOME/.zsh/
ln -s $HOME/.config/dotfiles/home/.inputrc  $HOME/
touch $HOME/.hushlogin

echo "Installing oh-my-zsh..."
export ZSH=$HOME/.zsh/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing zsh plugins..."
git clone -q https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/custom/plugins/zsh-autosuggestions
git clone -q https://github.com/djui/alias-tips.git $HOME/.zsh/custom/plugins/alias-tips
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/custom/plugins/zsh-syntax-highlighting

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
