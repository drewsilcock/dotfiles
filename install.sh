#!/bin/bash

set -eoxu pipefail

create_symlink() {
    echo "... $1"

    if [ $# -eq 2 ]
    then
        ln -s -f -F ~/.dotfiles/$1 ~/$2
    else
        ln -s -f -F ~/.dotfiles/$1 ~/$1
    fi
}

echo "[1/3] Creating configuration symlinks..."
create_symlink .aliases
create_symlink .gdbinit
create_symlink .gitconfig
create_symlink .gvimrc
create_symlink .tmux.conf.local
create_symlink tmux/.tmux.conf .tmux.conf
create_symlink .vimrc
create_symlink .zshrc

rm -rf ~/.vim && create_symlink vim .vim
mkdir -p ~/.config
mv ~/.config/fish ~/.config/fish_backup 2> /dev/null || true
create_symlink fish .config/fish
mv ~/.config/nvim ~/.config/nvim_backup 2> /dev/null || true
create_symlink nvim .config/nvim

mkdir -p ~/.local
mv ~/.local/bin ~/.local/bin_backup 2> /dev/null || true
create_symlink bin .local/bin

test -e .zsh_machine && create_symlink .zsh_machine
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    create_symlink .iterm2_shell_integration.zsh
fi
echo "[1/3] Done."

echo "[2/3] Installing tools..."

if ! [ -x "$(command -v brew)" ]; then
    curl -o install-brew.sh -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    
    /bin/bash install-brew.sh
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
fi

brew install \
    fish \
    neovim \
    exa \
    starship \
    jq \
    fd \
    bat \
    fzf \
    hexyl \
    tmux \
    ripgrep \
    git-delta \
    go-task/tap/go-task \
    tealdeer
    
$(brew --prefix)/opt/fzf/install

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "[2/3] Done."

echo "[3/3] Setting up neovim..."
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
echo "[3/3] Done."

echo
echo "Finished installing dotfiles. Please restart your shell for changes to take effect."
