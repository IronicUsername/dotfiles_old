#!/bin/bash

if [ -d "$HOME/.ssh/" ]; then
    echo -e "\e[1;31m==> Setting permissions for SSH files...\e[0m"
    chmod 700 $HOME/.ssh
    chmod 644 $HOME/.ssh/id_rsa.pub
    chmod 0600 $HOME/.ssh/id_rsa
else
    echo -e "\e[1;31mNo ~/.ssh directory found\e[0m"
fi
