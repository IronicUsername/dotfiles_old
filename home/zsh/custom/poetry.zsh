if [ ! -d $HOME/.poetry ]; then
    echo "Installing Poetry..."
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | /usr/bin/python >/dev/null
fi

source $HOME/.poetry/env
if [ ! -d $ZSH_CUSTOM/plugins/poetry ]; then
  if [ ! -f $ZSH_CUSTOM/plugins/poetry/_poetry ]; then
      echo "Installing poetry shell completions..."
      mkdir -p $ZSH_CUSTOM/plugins/poetry
      poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
  fi
fi
