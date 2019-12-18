if [ ! -d $HOME/.poetry ]; then
    echo "Installing Poetry..."
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | /usr/bin/python >/dev/null
fi
if [[ -o login ]]; then
  source $HOME/.poetry/env
  poetry completions zsh > $HOME/.zsh/completions/_poetry
fi
