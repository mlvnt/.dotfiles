#█▓▒░ History

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# ... or force ignoredups and ignorespace
# HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# Unlimited bash history
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTFILE=~/.bash_history
export HISTSIZE=
export HISTFILESIZE=
export HISTCONTROL=erasedups
