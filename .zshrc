
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/anand/.zshrc'

autoload -Uz compinit
compinit
# PS1='%F{#52b0ef}%/%f %F{red}%f'
PS1='%B%F{green} %~%f %F{red}%f%b '

#SETTINGS TO BE ADDED IN /etc/bash.bashrc for root
#PS1='[\u@\h \W]\$ '
#PS1=" \[\e[1;36m\]\w \[\e[1;31m\]# \[\e[1;32m\]\[\e[0m\] "
#                     

#aliases
alias config='/usr/bin/git --git-dir=/home/anand/.cfg/ --work-tree=/home/anand'
alias ll='lsd -alh'
alias ls='ls --color=auto'
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
 
#some plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# source ~/.zsh/antigen.zsh
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle jeffreytse/zsh-vi-mode

export VISUAL=nvim
export EDITOR="$VISUAL"

# path variable for go
export PATH=$PATH:/usr/local/go/bin


# enabling vi mode
bindkey -v
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# ZVM_VI_INSERT_ESCAPE_BINDKEY=kj


#sourcing zsh syntax highlighting at the end of the file
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen apply
