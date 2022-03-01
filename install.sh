#!/bin/bash

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
rm -rf ~/.vim && create_symlink vim .vim
mkdir -p ~/.config
mv ~/.config/fish ~/.config/fish_backup; create_symlink fish .config/fish
mv ~/.config/nvim ~/.config/nvim_backup; create_symlink nvim .config/nvim
create_symlink .zshrc

mkdir -p ~/bin
for file_path in $(\ls ./bin/*); do
    file_name=$(basename "$file_path")
    create_symlink "bin/$file_name"
done

test -e .zsh_machine && create_symlink .zsh_machine
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    create_symlink .iterm2_shell_integration.zsh
fi
echo "[1/3] Done."

echo "[2/3] Installing tools..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
    fish \
    neovim \
    exa \
    starship \
    jq \
    bat \
    fzf \
    hexyl \
    tmux \
    ripgrep \
    delta \
    go-task/tap/go-task

sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "[2/3] Done."

echo "[3/3] Setting up neovim..."
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
echo "[3/3] Done."

echo
echo "Finished installing dotfiles. Please restart your shell for changes to take effect."
