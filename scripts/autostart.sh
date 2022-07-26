#!/bin/sh

# bspc desktop -f 10 && alacritty -e ncmpcpp & sleep 0.5 
# bspc desktop -f 2 && brave & sleep 1 
# bspc desktop -f 1 && alacritty



## Another way of doing the same
# alacritty -e ncmpcpp & sleep 0.1 
# bspc node newest -d 10 follow=off
# brave & sleep 0.17
# bspc node newest -d 2 follow=off
# xournalpp & sleep 0.6
# bspc node newest -d 4 follow=off
# # alacritty & sleep 0.1
# # bspc node newest -d 1 
# bspc desktop -f 1 && alacritty

# Another way of doing the same
alacritty -e ncmpcpp & sleep 0.1 
bspc node focused -d 10 follow=off  # changed to fucused from newest
brave & 
xournalpp & # no need to add sleep 0.2 if both follow = off
bspc desktop -f 1 && alacritty

