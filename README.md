# dotfiles
my stuff for linux or mac.

credits:
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [gcollazo/dotfiles](https://github.com/gcollazo/dotfiles)
- [deusavalon](https://github.com/deusavalon/dotfiles)

## prerequisites
### xcode-cli
before running the script, install the xcode command line tools.
```
xcode-select --install
```

### ssh-permissions
if you're trying to migrate your ssh keys copy them first to the `~/.ssh` directory.
the script will make sure that every permission for the ssh are set correctly afterwards.

## install
to install just curl the `bootstrap.sh`.
```
curl -o- https://raw.githubusercontent.com/IronicUsername/dotfiles/master/bootstrap.sh | bash
```
