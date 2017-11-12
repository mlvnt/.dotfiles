###############################################################################
#   ENVIRONMETAL VARIABLES                                                    #
###############################################################################

# PATH variable
export PATH="$PATH:/bin/"
export PATH="$PATH:/usr/bin/"
export PATH="$PATH:/usr/sbin/"
export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:/usr/local/sbin/"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/mnt/c/Users/Todorov/Downloads/VSCode-win32-x64-1.17.0/bin"

# Sort first dotfiles
export LC_ALL="C"

# # exporer.exe
# export PATH="$PATH:/mnt/c/Windows/SysWOW64"
# export PATH="$PATH::/mnt/c/Windows/WinSxS/wow64_microsoft-windows-explorer_31bf3856ad364e35_10.0.16299.15_none_7ef57d571f41a3e4"
# export PATH="$PATH::mnt/c/Windows:/mnt/c/Windows/WinSxS/amd64_microsoft-windows-explorer_31bf3856ad364e35_10.0.16299.15_none_74a0d304eae0e1e9"

# # cmd.exe
# export PATH="$PATH:/mnt/c/Windows/WinSxS/wow64_microsoft-windows-commandprompt_31bf3856ad364e35_10.0.16299.15_none_b84d9d01bfe1be94"
# export PATH="$PATH::/mnt/c/Windows/WinSxS/wow64_microsoft-windows-commandprompt_31bf3856ad364e35_10.0.16299.15_none_b84d9d01bfe1be94"

# export PATH=$PATH:"/mnt/d/"

# # Set Man Pages
# export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

###############################################################################
#   DISPLAY                                                                   #
###############################################################################

export DISPLAY=:0.0

###############################################################################
#   EXTERNAL FILES                                                            #
###############################################################################

# ALIASES
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
else
    print "404: ~/.bash_aliases not found."
fi

#FUNCTIONS
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
else
    print "404: ~/.bash_functions not found."
fi

# # Load the shell dotfiles, and then some:
# # * ~/.private can be used for other settings you don’t want to commit.
# for file in ~/.{private,bash_prompt,exports,aliases,functions,vimrc}; do
#     [ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;

# Neofetch
neofetch

# X Server Multi-Window
# multis

# Windows Desktop
# tempe
# npp
# chrome
# 4k
# chrome

###############################################################################
#   TWEAKS                                                                    #
###############################################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
#   export EDITOR=/usr/bin/nano

###############################################################################
# PROMPT                                                                      #
###############################################################################

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\e[1;32m\][\u@\h ]\[\e[35m\]\W\[\e[0m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

###############################################################################
# COLORS                                                                      #
###############################################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

###############################################################################
# HISTORY                                                                     #
###############################################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Unlimited bash history
export HISTFILE=~/.bash_history
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

#=============================================================================================================