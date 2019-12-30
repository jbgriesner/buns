# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jb/.zshrc'

function cheat() {
	curl cht.sh/$1
}

alias l='ls -lah --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.buns/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
autoload -Uz compinit promptinit
fpath+=~/.zfunc
compinit
promptinit
prompt adam2
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# End of lines added by compinstall

export PATH="${PATH}:~/ved/dotfiles/scripts/:${HOME}/.local/bin/:${HOME}/.python3.7/usr/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:~/.python3.7"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec startx
fi

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
