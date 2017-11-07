###############################################################################
# ALIASES                                                                     #
###############################################################################

#   -------------------------------
#   1.  DIRECTORIES
#   -------------------------------

# LS, DIR, Tree
alias ls='ls -GFshl --color=auto'
alias ll='ls -FGlAshp --color=auto'
alias l='ls -CAFshG'
alias dir='dir -A'
alias dirl='dir -AN1'
alias tree='tree -lF'
alias treei='tree -lhpuF'

# CD
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

# SHORTCUTS
alias home="cd ~"
alias root="cd /"
alias temp="cd /mnt/d/Workspace/_TEMP/"
alias work="cd /mnt/d/Workspace/"
alias general="cd /mnt/d/Workspace/General/"
alias homer="cd /mnt/c/Users/Todorov/AppData/Local/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState/rootfs/home/todorov/"
alias down="cd /mnt/c/Users/Todorov/Downloads/"
alias path="pwd"
# Print each PATH entry on a separate line
alias pathe='echo -e ${PATH//:/\\n}'

# CURRENT
alias com4="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/COM2004/Labs/com2004_labs/"
alias uni="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/"

#   -------------------------------
#   2.  TRASHCAN
#   -------------------------------

alias trash="trash-put"
alias tl="trash-list"
alias tls="trash-list | grep"
alias te="trash-empty"
alias tre="trash-restore"
alias trm="trash-rm" #Remove individual files from the trashcan
alias trashcan="cd /.local/share/Trash"

#   -------------------------------
#   3.  FILE MANAGEMENT
#   -------------------------------

# ARCHIVES
alias tarunzip="tar -xzvf"
alias tarzip="tar -zcvf"
alias zipdir="zip -r"
alias gzip="gzip -k"
alias gzipdir="gzip -kr"
alias tarbackup='tar -zcvf "backup-$(date "+%Y-%m-%d-%H-%M").tar.gz"'

# RM, CP, MV, MKDIR, CHMOD
alias rm="sudo rm -v"
alias cp='sudo cp -iv'
alias cpd='sudo cp -ri'
alias mv='sudo mv -iv'
alias mkdir='sudo mkdir -pv'
alias x+="sudo chmod +x"
alias rwx+="sudo chmod +rwx"

# MOUNT && UNMOUNT
alias showm="df -ah" # Show mounted devices

# FIND, GREP
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# M3U
alias m3u='dir -AN1I "*.jpg" -I "*.png" -I "*.html" -I "*.url" -I "*.m3u" >> "_tracklist[ ${PWD##*/} ].m3u"'

# DOTFILES
alias dotfiles="cd /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
alias ohmyzsh="sudo cp -r /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/.oh-my-zsh ~/.dotfiles/wsl/shell/"
alias dots="sudo rm -rfv ~/.dotfiles && git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/ ~/.dotfiles && ohmyzsh && sudo dos2unix ~/.dotfiles/wsl/.* ~/.dotfiles/wsl/*.* ~/.dotfiles/wsl/shell/.* ~/.dotfiles/wsl/shell/*.* .~/.dotfiles/wsl/editors/.* ~/.dotfiles/wsl/editors/*.* ~/.dotfiles/wsl/git/.* ~/.dotfiles/wsl/git/*.* ~/.dotfiles/wsl/bin/* && sca"

# SHELL CONFIGURATION
alias brc="sudo vim ~/.bashrc"
alias zrc="sudo vim ~/.zshrc"
alias vrc="sudo vim ~/.vimrc"
alias scb="source ~/.bashrc && echo 'Shell config reloaded from ~/.bahrc'"
alias scz="source ~/.zshrc && echo 'Shell config reloaded from ~/.zshrc'"
alias scv="source ~/.vimrc && echo 'Shell config reloaded from ~/.vimrc'"
alias sca="source ~/.*rc ~/.bash*" 

# File size
alias fs="stat -f \"%z bytes\""

#   -------------------------------
#   4.  PROGRAM MANAGEMENT
#   -------------------------------

# Stats
alias ram="free -ht"
alias stats="echo '' && inxi -xxx && echo '' && free -ht && echo ''"
alias distro="echo '' && uname -a && echo '' && lsb_release -a && echo ''"

# Enable aliases to be sudo’ed
alias sudo="sudo "
alias htop='sudo htop'
alias kill="kill -9"
alias update="sudo apt-get update && sudo apt-get upgrade"

# EDITORS
alias v="vim"
alias c='clear'
alias jupyter="jupyter notebook"
alias edit='sudo subl'
alias subl='sudo subl'
alias vim='sudo vim'

# Get week number
alias week='date +%V'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#   -------------------------------
#   5.  NETWORKING
#   -------------------------------

# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
alias ipa="ifconfig -a"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias hosts='sudo $EDITOR /etc/hosts'

# BLOG
alias server="ssh todorov@mlvnt.com"
alias blog="cd /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/mvlnt"
alias blogc="rm -rfv /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/public_html/ && mkdir -p /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/public_html/"
alias hugos="hugo server -w"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | xclip | printf '=> Public key copied to pasteboard.\n'"

# View HTTP traffic
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Download file and save it with filename of remote file
alias get="curl -O -L"

alias wgeta="wget -r -l1 -A"
alias ping="gping"

# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Docker

# Weather
alias wr='curl http://wttr.in'
alias wrsheff='curl http://wttr.in/sheffield'
alias wrsof='curl http://wttr.in/sofia'

#   -------------------------------
#   5.  GIT
#   -------------------------------

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# List git branches on the local machine sorted by recent updates, adding a star to remote tracking branches
function git_list_branches() {
  RED="\e[91m";
  for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    # Add a red star to mark branches that are tracking something upstream
    tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED★"; fi);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
  done | sort;
}

alias git="sudo git"
alias g="git"
alias gf="git fetch"
alias gac='git add -A && git commit'
alias ga='git add -A'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gc='git commit'
alias gcl='git clone'
alias gd='git diff'
alias go='git checkout'
alias gb='git branch'
alias gbt=git_list_branches

#   -------------------------------
#   6.  WINDOWS
#   -------------------------------

alias open="explorer.exe"
alias o="open"
alias 4k="cmd.exe /c start /D 'C:\Program Files (x86)\4KDownload\4kvideodownloader' 4kvideodownloader.exe"
alias xfce="xfce4-session"
alias i3="i3"

#   -------------------------------
#   7.  CURRENT
#   -------------------------------

#=============================================================================================================

### Print only the name of the current Directory ###
# target_PWD=$(readlink -f .) && echo ${target_PWD%/*}
# target_PWD=$(readlink -f .) && echo ${target_PWD##*/}
# target_PWD=$(readlink -f ./) && printf '%q\n' "${target_PWD##*/}"
# printf '%q\n' "${PWD##*/}" 
# result=${PWD##*/} 