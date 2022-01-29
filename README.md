# dotfiles

## Iterm2 + zsh + tmux + vim
![Iterm2-zsh-tmux-vim](./screens/dracula-dotfiles.png)

## Install

### Homebrew

```zsh
xcode-select --install
sudo xcodebuild -license

sudo mkdir /usr/local
sudo chown -R `whoami` /usr/local
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
```
### Tmux
* Install tmux plugin manager: https://github.com/tmux-plugins/tpm

### TODOs
[ ] Porting to init.lua
[ ] split lua modules
[ ] COC -> TreeSitter
