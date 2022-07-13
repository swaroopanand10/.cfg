
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"


# The following lines were added by compinstall
# zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'
zstyle :compinstall filename '$ZDOTDIR/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   #include hidden files as well

# PS1='%F{#52b0ef}%/%f %F{red}%f'
# PS1='%B%F{green} %~%f %F{red}%f%b '
PS1='%B%F{#52b0ef} %~%f %F{red}%f%b '

#SETTINGS TO BE ADDED IN /etc/bash.bashrc for root
#PS1='[\u@\h \W]\$ '
#PS1=" \[\e[1;36m\]\w \[\e[1;31m\]# \[\e[1;32m\]\[\e[0m\] "
#                     

#aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ll='lsd -alh'
alias ls='ls --color=auto'
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.config/tmux/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'
alias grep='grep --color'
 # alias mux='pgrep -vxq tmux && tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'
alias yta='yt-dlp -x -f bestaudio'
alias lf='~/.config/lf/lfub'
alias ncm='ncmpcpp'

# Some plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh   #no need of it now
# antigen bundle jeffreytse/zsh-vi-mode    # Now no need of it as I configured it myself
# source ~/.zsh/antigen.zsh
# antigen bundle zsh-users/zsh-autosuggestions

export VISUAL=nvim
export EDITOR="$VISUAL"

# path variable for go
export PATH=$PATH:/usr/local/go/bin

# enabling vi mode
bindkey -v
export KEYTIMEOUT=5
bindkey jk vi-cmd-mode
bindkey kj vi-cmd-mode

# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[2 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^a' '^ulfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#sourcing zsh syntax highlighting at the end of the file
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen apply
