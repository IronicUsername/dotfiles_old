# dotfiles

This is a collection of my dotfiles for Mac OS X. Borrows some things from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) and [gcollazo/dotfiles](https://github.com/gcollazo/dotfiles).

## Prerequisites
### Xcode-cli
make sure to install the xcode command line tools before starting the installation script.
This part cant be automated with MacOS Catalina atm, due to its buggy-ness.

```
xcode-select --install
```
### ssh-permissions

If you're trying to migrate your SSH Keys copy them first to the `~/.ssh` directory.
The script will make sure that every permission for the SSH are set correctly afterwards.

## Install

To install just curl the `bootstrap.sh`.
```
curl -o- https://raw.githubusercontent.com/IronicUsername/dotfiles/master/bootstrap.sh | bash
```
