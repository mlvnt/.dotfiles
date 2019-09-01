#!/bin/bash

# ┳━┓┳━┓┓━┓┳ ┳┳━┓┏━┓
# ┃━┃┃━┫┗━┓┃━┫┃┳┛┃
# ┇━┛┛ ┇━━┛┇ ┻┇┗┛┗━┛


# echo $HOME $USER $HOSTNAME

# global config
# /etc/profile
# /etc/bash.bashrc

# root user config
# /root/profile
# /root/.bashrc
# root $HOME = /root

#█▓▒░ source config ------------------------------------------------------------

# Sorce all
f=$HOME/.bash_onload
if [ -r "$f" ] && [ -f "$f" ]; then
    source "$f";
else
    printf "404: $f not found.\n";
fi;
sca i;

sessions=$(tmux ls 2>&1);
echo $sessions | grep -qw workspace || tmux_workspace;

#█▓▒░ unset variables ----------------------------------------------------------
variables=(
    "sessions"
    "f"
    "color_prompt"
    "force_color_prompt"
)
unset -v "${variables[@]}" variables;
