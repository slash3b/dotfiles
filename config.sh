#! /usr/bin/env bash

set -euo pipefail

# Check if the current user is root
if [[ $EUID -ne 0 ]]; then
    echo "You must be root to run this script." 1>&2
    exit 1
else
    echo "You are running this script as root."
fi

# chattr can not work with soft link 
# and I want to make only "copy" immutable, the source file in the repo should be mutable
# this way I am forced to update in one repository only.

chattr -i -f /home/slash3b/.config/.alacritty.yml 
cp -f /home/slash3b/dotfiles/sources/.alacritty.yml /home/slash3b/.config/.alacritty.yml
chown slash3b:slash3b /home/slash3b/.config/.alacritty.yml 
chattr +i -f /home/slash3b/.config/.alacritty.yml 
echo "alacritty conf was installed"

mkdir -p /home/slash3b/.config/tmux
chattr -i -f /home/slash3b/.config/tmux/tmux.conf 
cp -f /home/slash3b/dotfiles/sources/tmux/tmux.conf /home/slash3b/.config/tmux/tmux.conf
chown slash3b:slash3b /home/slash3b/.config/tmux/tmux.conf
chattr +i -f /home/slash3b/.config/tmux/tmux.conf 
echo "tmux conf has been updated"

mkdir -p /home/slash3b/.config/nvim
mkdir -p /home/slash3b/.config/nvim/plugged
if [ ! -e /home/slash3b/.config/nvim/init.vim ]; then
	cp -f /home/slash3b/dotfiles/sources/nvim/init.vim /home/slash3b/.config/nvim/init.vim
fi
chattr -i -f /home/slash3b/.config/nvim/init.vim
cp -f /home/slash3b/dotfiles/sources/nvim/init.vim /home/slash3b/.config/nvim/init.vim
chown -R slash3b:slash3b /home/slash3b/.config/nvim
chattr +i -f /home/slash3b/.config/nvim/init.vim
echo "init.vim conf has been updated"

if [ ! -e /home/slash3b/.vimrc ]; then
	cp -f /home/slash3b/dotfiles/sources/.vimrc /home/slash3b/.vimrc
	chown slash3b:slash3b /home/slash3b/.vimrc
fi
chattr -i -f /home/slash3b/.vimrc
cp -f /home/slash3b/dotfiles/sources/.vimrc /home/slash3b/.vimrc
chown slash3b:slash3b /home/slash3b/.vimrc
chattr +i -f /home/slash3b/.vimrc
echo ".vimrc conf has been updated"

# i3
mkdir -p /home/slash3b/.config/i3
if [ ! -e /home/slash3b/.config/i3/config/seattle.jpg ]; then
	cp -f /home/slash3b/dotfiles/sources/i3/seattle.jpg /home/slash3b/.config/i3/seattle.jpg
fi
if [ ! -e /home/slash3b/.config/i3/config ]; then
	cp -f /home/slash3b/dotfiles/sources/i3/config /home/slash3b/.config/i3/config
fi
if [ ! -e /home/slash3b/.config/i3/status.conf ]; then
	cp -f /home/slash3b/dotfiles/sources/i3/status.conf /home/slash3b/.config/i3/status.conf
fi
chattr -i -f /home/slash3b/.config/i3/config
chattr -i -f /home/slash3b/.config/i3/status.conf
cp -f /home/slash3b/dotfiles/sources/i3/config /home/slash3b/.config/i3/config
cp -f /home/slash3b/dotfiles/sources/i3/status.conf /home/slash3b/.config/i3/status.conf
chown -R slash3b:slash3b /home/slash3b/.config/i3
chattr +i -f /home/slash3b/.config/i3/config
chattr +i -f /home/slash3b/.config/i3/status.conf
echo "i3 conf has been updated"


# i3
chattr -i -f /home/slash3b/.config/fish/config.fish
cp -f /home/slash3b/dotfiles/sources/config.fish /home/slash3b/.config/fish/config.fish
chown slash3b:slash3b /home/slash3b/.config/fish/config.fish
chattr +i -f /home/slash3b/.config/fish/config.fish

# https://github.com/ivakyb/fish_ssh_agent
wget https://gitlab.com/kyb/fish_ssh_agent/raw/master/functions/fish_ssh_agent.fish -P ~/.config/fish/functions/

echo "fish conf has been updated"

mkdir -p /home/slash3b/.config/autorandr/docked
mkdir -p /home/slash3b/.config/autorandr/mobile

chattr -i /home/slash3b/.config/autorandr/docked/config
chattr -i /home/slash3b/.config/autorandr/docked/setup
chattr -i /home/slash3b/.config/autorandr/mobile/config
chattr -i /home/slash3b/.config/autorandr/mobile/setup

ln -f /home/slash3b/dotfiles/sources/autorandr/docked/config \
	/home/slash3b/.config/autorandr/docked/config
ln -f /home/slash3b/dotfiles/sources/autorandr/docked/setup \
	/home/slash3b/.config/autorandr/docked/setup


cp -f /home/slash3b/dotfiles/sources/autorandr/mobile/config \
	/home/slash3b/.config/autorandr/mobile/config
cp -f /home/slash3b/dotfiles/sources/autorandr/mobile/setup \
	/home/slash3b/.config/autorandr/mobile/setup

chown slash3b:slash3b /home/slash3b/.config/autorandr

chattr +i /home/slash3b/.config/autorandr/docked/config
chattr +i /home/slash3b/.config/autorandr/docked/setup
chattr +i /home/slash3b/.config/autorandr/mobile/config
chattr +i /home/slash3b/.config/autorandr/mobile/setup

echo "autorandr conf was installed"

chattr -i /home/slash3b/.Xresources
cp -f /home/slash3b/dotfiles/sources/.Xresources /home/slash3b/.Xresources
chown slash3b:slash3b /home/slash3b/.Xresources
chattr +i /home/slash3b/.Xresources

echo ".Xresources was installed"

if [ ! -e /home/slash3b/.ssh/config ]; then
    mkdir -p /home/slash3b/.ssh
	cp -f /home/slash3b/dotfiles/sources/.ssh/config /home/slash3b/.ssh/config
fi
chattr -i /home/slash3b/.ssh/config

cp -f /home/slash3b/dotfiles/sources/.ssh/config /home/slash3b/.ssh/config
chown slash3b:slash3b /home/slash3b/.ssh/config
chattr +i /home/slash3b/.ssh/config

echo ".ssh config was installed"

if [ ! -e /home/slash3b/.gitconfig ]; then
    cp -f /home/slash3b/dotfiles/sources/.gitconfig /home/slash3b/.gitconfig
    cp -f /home/slash3b/dotfiles/sources/.gitconfig.work /home/slash3b/.gitconfig.work
    cp -f /home/slash3b/dotfiles/sources/.gitignore /home/slash3b/.gitignore
fi

chattr -i /home/slash3b/.gitconfig
chattr -i /home/slash3b/.gitconfig.work
chattr -i /home/slash3b/.gitignore

cp -f /home/slash3b/dotfiles/sources/.gitconfig /home/slash3b/.gitconfig
cp -f /home/slash3b/dotfiles/sources/.gitconfig.work /home/slash3b/.gitconfig.work
cp -f /home/slash3b/dotfiles/sources/.gitignore /home/slash3b/.gitignore

chown slash3b:slash3b /home/slash3b/.gitconfig
chown slash3b:slash3b /home/slash3b/.gitconfig.work
chown slash3b:slash3b /home/slash3b/.gitignore

chattr +i /home/slash3b/.gitconfig
chattr +i /home/slash3b/.gitconfig.work
chattr +i /home/slash3b/.gitignore

echo ".gitconfig was installed"


exit 0
