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

echo "[1/2] Creating configuration symlinks..."
create_symlink .aliases
create_symlink .gdbinit
create_symlink .gitconfig
create_symlink .gvimrc
create_symlink .tmux.conf.local
create_symlink tmux/.tmux.conf .tmux.conf
create_symlink .vimrc
rm -rf ~/.vim && create_symlink vim .vim
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
echo "[1/2] Done."

echo "[2/2] Setting up vim and plugins..."
vim +PlugInstall +qall
echo "[2/2] Done."

echo
echo "Finished installing dotfiles. You may need to restart your shell for changes to take effect."
