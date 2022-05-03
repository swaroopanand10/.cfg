#
# ~/.bashrc
#
#SETTING VI MODE ON AND REMAPPING KEYBINDING <Esc> to jk and kj
# Add this lines at the top of .bashrc:
# [[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

set -o vi
bind '"jk":vi-movement-mode'
bind '"kj":vi-movement-mode'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


alias ls='ls --color=auto'
# alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ll='lsd -alh'
alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'

# PS1 customizations - 
#export PS1="\w >\[$(tput sgr0)\]"
# PS1=" \[\e[1;36m\]\w \[\e[1;31m\]\[\e[0m\] "
PS1=" \[\e[1;32m\]\w \[\e[1;31m\]\[\e[0m\] "
#                     
#export PS1='\[\e[0m\]\w\[\e[0m\]>\[\e[0m\]'
#export PS1="\w >\[$(tput sgr0)\]"


#SETTINGS TO BE ADDED IN /etc/bash.bashrc for root
#PS1='[\u@\h \W]\$ '
#PS1=" \[\e[1;36m\]\w \[\e[1;31m\]# \[\e[1;32m\]\[\e[0m\] "
#                     

export VISUAL=nvim
export EDITOR="$VISUAL"

# path variable for go
export PATH=$PATH:/usr/local/go/bin

# Add this line at the end of .bashrc:
# [[ ${BLE_VERSION-} ]] && ble-attach
