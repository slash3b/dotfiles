# "inspired" by Derek Taylor (DistroTube)

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set EDITOR "nvim"                 		  # $EDITOR use Emacs in terminal

### SET MANPAGER
### Uncomment only one of these!

### "nvim" as manpager
#set -x MANPAGER "nvim +Man!"

### "less" as manpager
set -x MANPAGER "less -S"

set -x PAGER "less -S"

# review this
# https://unix.stackexchange.com/questions/267885/how-do-i-scale-i3-window-manager-for-my-hidpi-display
set -x GDK_SCALE 2

### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

### git
alias gs='git status'
alias gd='git diff'
alias gst='git diff --staged'

### copy-paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# vim and emacs
alias vim='nvim'

# GO (or any other lang)
# set -x GOBIN "$HOME/go/bin"
set -Ua fish_user_paths "$HOME/go/bin"

# direnv 
# trigger direnv at prompt, and on every arrow-based directory change (default)
set -g direnv_fish_mode eval_on_arrow 

# direnv fish config 
direnv hook fish | source

# https://github.com/ivakyb/fish_ssh_agent
fish_ssh_agent

# temporary
ssh-add -q

# from mitchelh
if isatty
    set -x GPG_TTY (tty)
end



##### FUNCTIONS

function godoc
    go doc -all $argv | cat -n
end

function goget
    set_color green; echo "requested $argv"; set_color normal

    set -l dlfile "/home/slash3b/Downloads/$argv.linux-amd64.tar.gz"

    if test ! -e $dlfile
        set_color green; echo "\n\ndownloading https://go.dev/dl/go$argv.linux-amd64.tar.gz\n\n"; set_color normal

        wget --output-document "/home/slash3b/Downloads/$argv.linux-amd64.tar.gz" "https://go.dev/dl/$argv.linux-amd64.tar.gz"

        if test $status -ge 1
            echo "failed to download https://go.dev/dl/$argv.linux-amd64.tar.gz"

            return
        end
    else

        echo "$argv tar.gz already downloaded"
    end

    echo "deleting existing go...."

    rm -rf /home/slash3b/go

    echo "unpacking $argv..."

    tar -C /home/slash3b/ -xzf $dlfile
    if test $status -ge 1
        echo "failed to unpack $dlfile"

        return
    end

    set_color green

    echo "installed $argv!"

end


