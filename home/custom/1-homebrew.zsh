if [[ -o login ]]; then
    export PATH=$HOME/.homebrew/bin:$PATH
fi
if [ ! -d $HOME/.homebrew ]; then
    echo "Installing Homebrew..."
    git clone https://github.com/Homebrew/brew $HOME/.homebrew
fi
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS="--require-sha"
while read formula; do
    if brew ls --versions $formula > /dev/null; then
    else
        echo "Installing $formula using Homebrew..."
        brew install $formula
    fi
done < $HOME/.homebrew_formulae
