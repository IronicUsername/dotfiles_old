# dotfiles
my stuff for mac.

credits:
- [deusavalon/dotfiles](https://github.com/deusavalon/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [gcollazo/dotfiles](https://github.com/gcollazo/dotfiles)

## prerequisites
### xcode-cli
before running the script, install the xcode command line tools.
```
xcode-select --install
```

Make sure you export `SSH_CONFIG_GITURL` with the <b>raw</b> git gist url to your ssh config file.
```
export SSH_CONFIG_GITURL="raw git gist url here"
```

### ssh-permissions
if you're trying to migrate your ssh keys copy them first to the `~/.ssh` directory.
the script will make sure that every permission for the ssh are set correctly afterwards.

## install
to install just curl the `bootstrap.sh`.

```
curl -o- https://raw.githubusercontent.com/IronicUsername/dotfiles/master/bootstrap.sh | bash
```
