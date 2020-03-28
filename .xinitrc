#!/bin/sh
setxkbmap fr
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

exec i3
~/.fehbg &
