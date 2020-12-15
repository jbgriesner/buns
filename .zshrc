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

# **************************************************
# alias
# **************************************************
#
    alias l='ls -lah --color=auto'
    alias config='/usr/bin/git --git-dir=$HOME/.buns/ --work-tree=$HOME'
    alias get_nvim='curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    #alias v='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
    mkdir -p /tmp/log
    alias v="vim"
    alias xup="xrdb ~/.Xresources"
    alias x="exit"
    alias ..='cd ..'
    alias ...='cd ...'
    alias vv='~/.config/vifm/scripts/vifmrun .'
    alias z='zathura'
    alias b='bat'
    alias gg='bat ~/gitoken'
    alias s='sxiv .'
    alias n='nvim'

config config --local status.showUntrackedFiles no
fpath+=~/.zfunc
autoload -Uz compinit promptinit
compinit
promptinit

#   ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
#   ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# End of lines added by compinstall

export PATH="${PATH}:${HOME}/scripts/:${HOME}/.local/bin/:${HOME}/.python3.7/usr/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib:~/.python3.7"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	exec startx
	sleep 3
	./home/jb/.screenlayout/main_dual.sh
fi

export BROWSER="firefox"
export READER="zathura"
export EDITOR="vim"

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export HISTTIMEFORMAT="%d/%m/%y %T "

# bindkey -v
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


source ~/ved/zsh-git-prompt/zshrc.sh
GIT_PROMPT_EXECUTABLE="haskell"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_super_status) λ >  '
export PATH="$HOME/.poetry/bin:$PATH"
#alias poetry="python3.7 $HOME/.poetry/bin/poetry"

