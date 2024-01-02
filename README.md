# Drew's Dotfiles

These are Drew's personal dotfiles - feel free to use them or take inspiration from them for your own dotfiles!

## Installation

Note that the repository contains submodules so must be cloned recursively.

```sh
git clone --recursive  https://github.com/drewsilcock/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
cd -
```

**⚠️  WARNING! ⚠️**- This will overwrite existing config files without saving them. *Use at your own risk!*

## Todo

- If a config file is already present, prompt user for action instead of overwriting (i.e. [o]verwrite, [b]ackup, [s]kip, [q]uit).
- Add option to script to always force overwrite (i.e. -f flag).

## Extras

Extra things to install if you need them:

### VS Code

Link: https://code.visualstudio.com/download

### MacDown

```bash
brew install --cask macdown
```

### TablePlus

Link: https://tableplus.com/download

### Obsidian

Link: https://bear.app/](https://obsidian.md/

Select "Open existing vault" and choose "Dropbox" > "Obsidian" > "Notes" (install Dropbox first).

### Sublime Text

Link: https://www.sublimetext.com/download

### Sublime Merge

Link: https://www.sublimemerge.com/download

### Goland

Link: https://www.jetbrains.com/go/download/

### CLion

Link: https://www.jetbrains.com/clion/download/

### IDEA

Link: https://www.jetbrains.com/idea/download/

### Slack

Link: https://slack.com/intl/en-gb/downloads

### GIMP

Link: https://www.gimp.org/downloads/

### Python tools - pyenv, poetry

```bash
brew install pyenv
curl -sSL https://install.python-poetry.org | python3 -
```

### Node tools - nvm

```bash
brew install nvm
```

### Rust tools - rustc, cargo

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Golang

Link: https://go.dev/doc/install

### Ubuntu Mono Nerd Font

https://github.com/ryanoasis/nerd-fonts/releases

### Dropbox

https://www.dropbox.com/en_GB/desktop

### macOS

#### Keyboard Settings

"Keyboard" > "Modifier Keys" - change caps lock to escape.

"Keyboard"" - Key repeat and delay until repeat set to shortest and fastest.

"Shortcuts" > "Spotlight" - untick both of these.

"Text" - "Input Sources" - "Edit" - untick "Add full stop with double-space".

Enable keyboard repeat globally:

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

You need to restart for this to fully take effect.

#### iTerm2

https://iterm2.com/

Import profile `iterm2-profile.json`.

#### Itsycal

https://www.mowglii.com/itsycal/

Go to "Settings", tick "Hide icon" and under datetime format put `E MMM d H:mm`.

#### Rectangle

https://rectangleapp.com/

### Docker + minikube

Intel silicon:

```bash
brew install hyperkit docker docker-compose minikube
minikube start --no-kubernetes=true

# Bash, Zsh
eval $(minikube -p minikube docker-env)

# Fish
eval (minikube -p minikube docker-env)

echo "`minikube ip` docker" | sudo tee -a /etc/hosts > /dev/null
```

Apple silicon (see https://github.com/kubernetes/minikube/issues/11885):

```bash
brew install podman minikube
podman machine init --cpus 2 --disk-size 150 --rootful
podman machine start
minikube start --no-kubernetes=true --driver=podman
```

Once you've done this, you should automate the running of minikube using a plist (macOS) or service (Linux). Relevant files not yet available in this repo.
