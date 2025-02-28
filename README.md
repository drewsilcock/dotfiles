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

## Post-Install Steps

Log into Atuin:

```bash
atuin login
atuin sync
```

## Todo

- If a config file is already present, prompt user for action instead of overwriting (i.e. [o]verwrite, [b]ackup, [s]kip, [q]uit).
- Add option to script to always force overwrite (i.e. -f flag).

## Extras

Extra things to install if you need them:

### VS Code

Link: https://code.visualstudio.com/download

### TablePlus

Link: https://tableplus.com/download

### Obsidian

Link: https://obsidian.md/

Select "Open existing vault" and choose "Dropbox" > "Obsidian" > "Notes" (install Dropbox first).

### Sublime Text

Link: https://www.sublimetext.com/download

### Sublime Merge

Link: https://www.sublimemerge.com/download

### Goland

Link: https://www.jetbrains.com/go/download/

### GIMP

Link: https://www.gimp.org/downloads/

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

"System Settings" > Log into Apple ID.

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

#### Ghostty

https://ghostty.org/download

#### Itsycal

https://www.mowglii.com/itsycal/

Go to "Settings", tick "Hide icon" and under datetime format put `E MMM d H:mm`.

#### Rectangle

https://rectangleapp.com/

Open settings, change "Maximise" to "^⌥A".

### MacDown

```bash
brew install --cask macdown
```

### Raycast

Link: https://www.raycast.com/

"System Settings" > "Siri & Spotlight" > untick "Ask Siri" & untick all boxes under "Spotlight" > "Search results"

### Orbstack

Link: https://orbstack.dev/download

### Work stuff

Request escalated privileges from "Privileges" app, then run (see: https://github.com/SAP/macOS-enterprise-privileges/wiki/Uninstallation):

```bash
sudo rm -r /Applications/Privileges.app /Library/PrivilegedHelperTools/corp.sap.privileges.helper /Library/LaunchDaemons/corp.sap.privileges.helper.plist
```

Install from STFC Self-Service app:

- Zoom
- EVPN
- DL MFD Print
- Excel, OneDrive, Outlook, PowerPoint, Microsoft To Do, Word (not Teams)

Install Teams directly to get new version: https://www.microsoft.com/en-gb/microsoft-teams/download-app
