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

### Bear

Link: https://bear.app/

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

### Docker + minikube

```bash
brew install hyperkit docker docker-compose minikube
minikube start --no-kubernetes=true

# Bash, Zsh
eval $(minikube -p minikube docker-env)

# Fish
eval (minikube -p minikube docker-env)

echo "`minikube ip` docker" | sudo tee -a /etc/hosts > /dev/null
```

Once you've done this, you should automate the running of minikube using a plist (macOS) or service (Linux). Relevant files not yet available in this repo.

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
