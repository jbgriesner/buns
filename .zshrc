# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jb/.zshrc'

function cheat() {
	curl cht.sh/$1
}

alias l='ls -lah --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.buns/ --work-tree=$HOME'
alias get_nvim='curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#alias v='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
mkdir -p /tmp/log
alias v="vim -p"
alias xup="xrdb ~/.Xresources"

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

export PATH="${PATH}:${HOME}/scripts/:${HOME}/.local/bin/:${HOME}/.python3.7/usr/bin"
export BIB="~/ved/biblio.bib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:~/.python3.7"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec startx
fi

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export HISTTIMEFORMAT="%d/%m/%y %T "
