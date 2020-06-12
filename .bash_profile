#
# ~/.bash_profile
#

. ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec startx
fi

export PATH="$HOME/.poetry/bin:$PATH"
