### My dotfiles

This will create soft links in home directory for every hidden config file:  
`ln -sf  (pwd)/.* ~/`   
`ln -sf  (pwd)/i3/* ~/.config/i3/`
`mkdir -p -v ~/.config/nvim; ln -sf (pwd)/init.vim ~/.config/nvim/init.vim`

##### TMUX

Just copy-paste the content of .tmux.conf to your ~/.tmux.conf file or `ln -s {{path/to/file}} {{path/to/symlink}}`.

SHIFT + arrow to switch pages

The original file I stole from https://gist.github.com/spicycode/1229612.

Additional info:
http://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/

##### Graphics

For intel:
/etc/X11/xorg.conf.d/20-intel.conf

```
Section "Device"
  Identifier "Intel Graphics"
  Driver "intel"

  Option "TearFree" "true"
EndSection
```
##### Audio issues with random mute/unmute

https://superuser.com/questions/431079/how-to-disable-auto-mute-mode

Run alsamixer, then:
- F5 (show all controls)
- use arrows → to move until hitting the <Auto-Mute> control, which show as Enabled
- use the minus - key to switch it to Disabled
- hit Esc to exit
- run alsactl store as root to save

##### nvim config

install plug with
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Make sure you have symlink in place and run plugin install in nvim.

TODO in vim:
- a list of open files and easy switch between them
- file browsing and navigation
- go to definition
- search for matches and possible preview
