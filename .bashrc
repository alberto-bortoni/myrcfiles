######################################################################
# general

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


######################################################################
# history

HISTCONTROL=ignoreboth        # no duplicates, no space-prefixed lines
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT="%F %T "       # timestamps in `history` output
shopt -s histappend           # append rather than overwrite


######################################################################
# shell options

shopt -s checkwinsize         # update LINES/COLUMNS after each command
shopt -s globstar             # ** matches recursively (e.g. ls **/*.py)


######################################################################
# environment

export EDITOR=vim             # change to nano/micro/etc if you prefer
export VISUAL=$EDITOR


######################################################################
# prompt

parse_git_branch() {
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  echo "(${ref#refs/heads/})"
}

PS1='\[\e[0;37m\][\[\e[0;32m\]\u\[\e[m\]\[\e[1;31m\]@\[\e[0;35m\]\h \[\e[0;36m\]\W\[\033[0;33;49m\]$(parse_git_branch)\[\033[0;0m\]\[\e[m\]\[\e[1;32m\]\[\e[0;37m\]]\$\[\e[m\] \[\e[0;00m\]'

# set terminal title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \W\a\]$PS1"
    ;;
esac


######################################################################
# aliases and colors

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias less='less -i'
fi


######################################################################
# bash completion

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


######################################################################
# nvm + PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$HOME/.local/bin:$PATH"


######################################################################
# machine-specific — everything below is guarded; harmless elsewhere

# flutter SDK
[ -d "$HOME/flutter/bin" ] && export PATH="$HOME/flutter/bin:$PATH"

# claude + vim kitty session
[ -r ~/.config/kitty/claude-vim.conf ] && \
    alias claudec='(kitty --session ~/.config/kitty/claude-vim.conf >/dev/null 2>&1 &)'

# conda — block between the markers is managed by 'conda init'; don't hand-edit
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/abortoni/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/abortoni/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/abortoni/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/abortoni/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

