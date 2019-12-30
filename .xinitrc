#!/bin/sh
setxkbmap fr
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec i3
~/.fehbg &
