#█▓▒░ Tweaks

# Fix mkdir command has wrong permissions
if grep -q Microsoft /proc/version; then
    if [ "$(umask)" == '0000' ]; then
        umask 0022
    fi
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

enable_opts(){
    local bashopt=(
        # check the window size after each command and, if necessary,
        # update the values of LINES and COLUMNS.
        checkwinsize
        # Autocorrect typos in path names when using `cd`
        cdspell
        # Case-insensitive globbing (used in pathname expansion)
        nocaseglob
        # * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
        autocd
        # If set, the pattern "**" used in a pathname expansion context will
        # match all files and zero or more directories and subdirectories.
        # If the pattern is followed by a ‘/’, only directories and subdirectories match.
        # * Recursive globbing, e.g. `echo **/*.txt`
        globstar
    );

    for option in "${bashopt[@]}"; do
        shopt -s "${option}" 2>/dev/null;
    done;
}
enable_opts
unset enable_opts

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

#█▓▒░ enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.config/dircolors.256dark)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
