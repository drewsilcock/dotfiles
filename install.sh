#!/bin/bash

set -eou pipefail

create_symlink() {
    echo "... $1"

    if [ $# -eq 2 ]
    then
        ln -s -f -F ~/.dotfiles/$1 ~/$2
    else
        ln -s -f -F ~/.dotfiles/$1 ~/$1
    fi
}

echo "[1/2] Creating configuration symlinks/files..."

mkdir -p ~/.config ~/.local ~/.tmux/plugins ~/.config/ghostty

create_symlink .aliases
create_symlink .gdbinit
create_symlink .gitconfig
create_symlink .gvimrc
create_symlink .tmux.conf .tmux.conf
create_symlink .vimrc
create_symlink .zshrc
create_symlink ghostty.conf .config/ghostty/conf

rm -rf ~/.vim && create_symlink vim .vim

rm -rf ~/.config/fish_backup
mv ~/.config/fish ~/.config/fish_backup 2> /dev/null || true
create_symlink fish .config/fish

rm -rf ~/.config/nvim_backup
mv ~/.config/nvim ~/.config/nvim_backup 2> /dev/null || true
git clone https://github.com/NvChad/starter ~/.config/nvim

rm -rf ~/.local/bin_backup
mv ~/.local/bin ~/.local/bin_backup 2> /dev/null || true
create_symlink bin .local/bin

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

test -e .zsh_machine && create_symlink .zsh_machine
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    create_symlink .iterm2_shell_integration.zsh
fi
echo "[1/2] Done."

echo "[2/2] Installing tools..."

# Prevent a common Linux issue when installing loads of things with brew at the same
# time.
#ulimit -n 65536

if ! [ -x "$(command -v brew)" ]; then
    curl -o install-brew.sh -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

    # https://github.com/Homebrew/install/issues/612
    NONINTERACTIVE=1 CI=1 /bin/bash install-brew.sh
    rm install-brew.sh

    # Homebrew post-installation steps.
    if test -e /home/linuxbrew/.linuxbrew/bin/brew; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

if [ -x "$(command -v apt-get)" ]; then
    sudo apt install -y build-essential
  elif [ -x "$(command -v yum)" ]; then
    sudo yum install gcc
fi

brew install \
    wget \
    fish \
    neovim \
    eza \
    starship \
    jq \
    fd \
    bat \
    hexyl \
    tmux \
    ripgrep \
    git-delta \
    go-task/tap/go-task \
    tealdeer \
    pipx \
    bottom \
    fnm \
    gnupg \
    atuin

pipx install poetry

fish -c 'fisher update'

echo "[2/2] Done."

echo "Running post-install steps..."

echo "$(brew --prefix)/bin/fish" | sudo tee -a /etc/shells
sudo chsh -s "$(brew --prefix)/bin/fish" "$USER"

echo "Run :MasonInstallAll once nvim has loaded plugins." | nvim

echo
echo "Finished installing dotfiles. Please restart your shell for changes to take effect."
