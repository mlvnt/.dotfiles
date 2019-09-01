#█▓▒░ Prompt

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && [[ "${TERM}" == "xterm-color" ]] || [[ "${TERM}" == *-256color ]] ; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

# Prompt
terminal_colors true; # escape predefined colors
PS1='${red}\u${reset} at ${yellow}\h${reset} in ${green}\w${reset}\n \$ ';
terminal_colors; # define colors
