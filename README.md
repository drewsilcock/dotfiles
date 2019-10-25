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

## Requirements

- Vim
- Python >= 2.7.1 or >= 3.5.1

## Todo

- If a config file is already present, prompt user for action instead of overwriting (i.e. [o]verwrite, [b]ackup, [s]kip, [q]uit).
- Add option to script to always force overwrite (i.e. -f flag).
