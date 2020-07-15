#!/bin/sh
setxkbmap fr
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

xscreensaver &
pulseaudio --start

exec xmonad
#~/.fehbg &
