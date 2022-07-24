#!/bin/sh

#didn't worked for startup
mux = $(pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.config/tmux/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
    tmux attach || tmux attach)

alacritty -e mux
