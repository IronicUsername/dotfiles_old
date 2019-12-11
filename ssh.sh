#!/bin/bash

if [ -d "$HOME/.ssh/" ]; then
    echo "==> Setting permissions for SSH files..."
    chmod 700 $HOME/.ssh
    chmod 644 $HOME/.ssh/id_rsa.pub
    chmod 0600 $HOME/.ssh/id_rsa
else
    echo "No ~/.ssh directory found"
fi
