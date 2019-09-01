#█▓▒░ directories - ls, dir, trer

# default ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
alias ls='ls -GFshl --group-directories-first'
alias ll='ls -GFAshlp'
alias l='ls -GFACsh'
alias dir='dir -A'
alias dirl='dir -AN1'
# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
else
    alias tree='tree -aF'
    alias treei='tree -ahpuF'
fi

# CD
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4.="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias .7="cd ../../../../../../.."
alias .8="cd ../../../../../../../.."
alias .9="cd ../../../../../../../../.."
alias .10="cd ../../../../../../../../../.."
alias .11="cd ../../../../../../../../../../.."
alias .12="cd ../../../../../../../../../../../.."
alias cd.='cd ../'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias cd....='cd ../../../..'
alias cd.....='cd ../../../../..'
alias /="cd /"
alias ~="cd ~"
# cd 1 directory back the stack
alias bd="cd - > /dev/null"
alias -- -='cd - > /dev/null'

alias cwd="pwd"
# convert windows to wsl path
linuxpath() { echo "$@" | sed -e 's|\\|/|g' -e 's|^\([A-Za-z]\)\:/\(.*\)|/mnt/\L\1\E/\2|'; }
# make directory and enter it
mkd() { mkdir -p "$@" && cd "$_"; }
# Always list directory contents upon 'cd'
cd() { builtin cd "$@" > /dev/null; ll; }
# prevent printing the stack
pushd() { builtin pushd "$@" > /dev/null; }
popd() { builtin popd "$@" > /dev/null; }
# popd n times
popdn() {
    if [ "$#" = "0" ]; then
        :
    else
        for i in $(seq ${1}); do
            builtin popd > /dev/null;
        done;
    fi;
}

# SHORTCUTS
alias anime="cd /mnt/d/media/anime"
alias d="cd /mnt/d"
alias docs="cd ${winhl}/Documents"
alias desktop="cd ${winhl}/Desktop"
alias dotfiles="cd ${local}/pc/projects/dotfiles/dotfiles"
alias down="cd ${winhl}/Downloads"
alias home="cd ~"
alias homewin="cd ${winhl}"
alias mapsme="cd ${local}/mobile/config/travel/maps.me"
alias media="cd /mnt/d/media"
alias mobile="cd ${local}/mobile"
alias mobiletemp="cd ${local}/mobile/~temp"
alias movies="cd /mnt/d/media/movies"
alias notebook="cd ${local}/mobile/notebook"
alias ownall="sudo chown -R $USER:$USER ~/.* &> /dev/null"
alias pathenv='echo -e ${PATH//:/\\n}' # Print each PATH entry on a separate line
alias pc="cd ${local}/pc"
alias pctemp="cd ${local}/pc/~temp"
alias projects="cd ${local}/pc/projects"
alias root="cd /"
alias scripts="cd ${local}/pc/projects/scripts"
alias shared="cd ${local}"
alias symblinks="~/.dotfiles/wsl/symblinks.sh"
alias temp="cd /mnt/d/~temp"
alias work="cd ${local}/work"
alias workspace="cd /mnt/d/workspace"
alias worktemp="cd ${local}/work/~temp"

# file managers

alias mc='. /usr/share/mc/bin/mc-wrapper.sh' # on exit change the shell path to the last on in mc
ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)";
    ranger --choosedir="${tempfile}" "${@:-$(pwd)}";
    test -f "${tempfile}" &&
    if [ "$(cat -- "${tempfile}")" != "$(echo -n `pwd`)" ]; then
        pushd -- "$(cat "${tempfile}")";
    fi;
    rm -f -- "${tempfile}";
}
alias ranger="ranger-cd"
