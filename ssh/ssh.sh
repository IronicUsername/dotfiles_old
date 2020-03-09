#!/bin/bash

if [ -d "$HOME/.ssh/" ]; then
    echo "==> Setting permissions for SSH files..."
    chmod 700 $HOME/.ssh
    chmod 644 $HOME/.ssh/id_rsa.pub
    chmod 0600 $HOME/.ssh/id_rsa
    if [[ $SSH_CONFIG_GITURL ]]; then
        if [[ ! -f $HOME/.ssh/config ]]; then
            echo "Downloading config..."
            curl $SSH_CONFIG_GITURL > $HOME/.ssh/config
        else
            echo "Config already exists!\\nUpdate it manually => $HOME/.ssh/"
        fi
    else
        echo "No environment variable \$SSH_CONFIG_GITURL was set!\\nNo config file was downloaded."
    fi
else
    echo "No ~/.ssh directory found"
fi
