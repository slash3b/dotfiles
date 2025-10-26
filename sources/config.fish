# "inspired" by Derek Taylor (DistroTube)

# format script with `fish_indent --write your_script.fish`

### EXPORT ###
set fish_greeting # Supresses fish's intro message
set EDITOR nvim # $EDITOR use Emacs in terminal

### SET MANPAGER
### Uncomment only one of these!

### "nvim" as manpager
#set -x MANPAGER "nvim +Man!"

### "less" as manpager
### less with no wrap lines and with colors.
set -x MANPAGER "less -S -R"

set -x PAGER "less -S -R"

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

# golang ENVs
go env -w GOPATH=/home/slash3b/go-pkgs

# you need to set this up if using private repositories,
# otherwise go get will hit public services only attempting to fetch package info
# https://sum.golang.org/lookup/github.com/private_org/repo_name@v1.5.0
# go env -w GOPRIVATE=github.com/org_name

# note: good way to set machine specific config in /home/slash3b/.config/fish/conf.d/config.fish

set -Ua fish_user_paths "$HOME/go/bin"
set -Ua fish_user_paths "$HOME/go-pkgs/bin"

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


# goget function will attempt to download golang version
# then in case of a success it will nuke an entire go installation 
# and replace with downloaded one.
function goget
    if test (count $argv) -lt 1
        echo "go version is required"
        return 1
    end

    # copy first argument
    set -l goversion $argv[1]

    if not string match -q "go*" $goversion
        set goversion "go$goversion"
    end

    set_color green
    # fish uses 1-based indexing, so position 3 skips the first 2 characters
    echo "Requested golang version:" (string sub -s 3 $goversion)
    # echo $goversion
    set_color normal


    set -l dlfile "/home/slash3b/Downloads/$goversion.linux-amd64.tar.gz"
    set -l dllink "https://go.dev/dl/$goversion.linux-amd64.tar.gz"

    if test -e $dlfile
        echo "$dlfile already downloaded"
    else
        wget --quiet --spider $dllink
        if test $status -ge 1
            echo "error, no such version exists: $dllink"

            return 1
        end

        set_color green
        printf "\ndownloading $dllink\n"
        set_color normal

        # download it to tmp
        wget --output-document /tmp/source $dllink

        if test $status -ge 1
            echo "failed to download $dllink"

            rm -f $dlfile

            return 0
        end

        # move to Downloads
        mv /tmp/source $dlfile
    end

    # safe to delete current go

    echo "deleting existing go...."

    rm -rf /home/slash3b/go

    echo "unpacking $goversion..."

    tar -C /home/slash3b/ -xzf $dlfile
    if test $status -ge 1
        echo "failed to unpack $dlfile"

        return
    end

    set_color green

    echo "installed $goversion!"

end

