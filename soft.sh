#! /usr/bin/env bash

set -euo pipefail

# todo: https://www.linuxfordevices.com/tutorials/ubuntu/syncthing-install-and-setup
apt install -y syncthing syncthing-gtk

apt install -y picom

apt install -y blueman

# install pipewire
sudo apt update -y

sudo apt install pipewire-audio wireplumber pipewire-pulse pipewire-alsa libspa-0.2-bluetooth
# should be run as user?
echo "wireplumber systemctl"
# fix this
# systemctl --user --now enable wireplumber.service


# redshift
sudo apt -y install redshift-gtk

	# 1. move folders and configs WIP
	# 2. solve wifi issue

	# add to i3 startup
	# caffeine-indicator
	# nm-applet



# todo: wrap this up in a function "rebuild"
apt install -y \
	i3 \
	i3blocks \
	lightdm \
	x11-xserver-utils \
	nm-tray \
	git \
	tree \
	neovim \
	alacritty \
    ripgrep \
    tmux \
    neofetch \
    transmission \
	thunar \
        vlc \
        fish \
        htop \
        rofi \
     	xfce4-screenshooter \
	feh \
	make \
	fzf \
	jq \
	curl \
      	gnupg2 \
	pinentry-tty \
	wget \
	zip \
	unzip \
	evince \
	traceroute \
	direnv \
	coreutils \
        autorandr \
	gcc \
	gdb \
	nasm \
	caffeine
	ncal \
	tcpdump \
	xclip \
    btop
	
# bluetooth
apt install -y blueman

# install pipewire
sudo apt update -y

sudo apt install pipewire-audio wireplumber pipewire-pulse pipewire-alsa libspa-0.2-bluetooth
# should be run as user?
systemctl --user --now enable wireplumber.service


# redshift
sudo apt -y install redshift-gtk




	# 1. move folders and configs WIP
	# 2. solve wifi issue

	# add to i3 startup
	# caffeine-indicator
	# nm-applet


      # docker

      #https://nixos.org/download/
      #

      # https://www.brendangregg.com/blog/2024-03-24/linux-crisis-tools.html
      #start
      # Utilities that give information about processes using the /proc filesystem
      # https://gitlab.com/procps-ng/procps
      #procps
      #tcpdump
      #util-linux
      #end

      # for copying
      #xclip

      # for graphing
      #graphviz

      # by Dave Cheney
      #httpstat

      #libpcap
      #dig

      # top but way nicer
      #btop

      #ncdu


      #ptkgnumake



      	# https://support.mozilla.org/en-US/kb/install-firefox-linux?utm_source=www.mozilla.org&utm_medium=referral&utm_campaign=firefox-download-thanks#w_install-firefox-deb-package-for-debian-based-distributions
	#
	#firefox \
	#https://tailscale.com/download/linux/debian-sid
	#
      #tailscale


      # just to be able to control volume throug pactl ?
      #pulseaudio


      # postman


sudo apt autoremove -y

# glibc-doc
sudo apt install glibc-doc

# monitor brightness
sudo apt install light

# needed to run game of life with ebitenengine
# go run github.com/hajimehoshi/ebiten/v2/examples/life@latest
sudo apt install libx11-dev
sudo apt-get install libxcomposite-dev
sudo apt-get install libxrandr-dev
sudo apt install mesa-common-dev
sudo apt install libxcursor-dev
sudo apt-get install libxinerama-dev
sudo apt install libxi-dev
sudo apt install libxxf86vm-dev

# screensaver
sudo apt install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

# needed for netstat
sudo apt install --yes net-tools
