echo "> setting apps up..."

echo "Setting up iTerm"
ln -s $HOME/.config/dotfiles/iterm/iterm2_settings.plist $HOME/.mypref/iterm2/iterm2_settings.plist

echo "Setting up pyenv..."
ln -s $HOME/.config/dotfiles/home/.zprofile $HOME/.zprofile

echo "Setting up poetry..."
source $HOME/.poetry/env
mkdir -p $HOME/.zsh/custom/plugins/poetry
poetry completions zsh > $HOME/.zsh/custom/plugins/poetry/_poetry
poetry config virtualenvs.in-project true

echo "Set Python globally"
pyenv global 3.9.5
echo 'eval "$(pyenv init --path)"' >> $HOME/.zprofile

# Make git use diff-so-fancy for every output
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

echo "> done!"
