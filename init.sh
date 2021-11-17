#!/bin/sh

echo "Git..."
ln -sf  $(pwd)/.gitconfig ~/.gitconfig
ln -sf  $(pwd)/.gitignore ~/.gitignore

echo "Neovim..."
ln -sf  $(pwd)/.vimrc ~/.vimrc
mkdir -p -v ~/.config/nvim; ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim

echo "Tmux..."
ln -sf  $(pwd)/.tmux.conf ~/.tmux.conf

echo "X11..."
ln -sf  $(pwd)/.Xresources ~/.Xresources

echo "SSH..."
cp $(pwd)/.ssh/config ~/.ssh/config

echo "i3 stuff..."
ln -sf  $(pwd)/i3/* ~/.config/i3/

echo "installing plug.vim"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

