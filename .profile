#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
# export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="vim"
# export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
# export FILE="vifm"
# export BIB="$HOME/Documents/LaTeX/uni.bib"
# export REFER="$HOME/Documents/referbib"
# export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
# export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
# export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

# less/man colors
# export LOCKER="$HOME/scripts/lock.sh"

# [ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
# sudo -n loadkeys ~/.local/bin/ttymaps.kmap 2>/dev/null

export PATH="$HOME/.poetry/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
