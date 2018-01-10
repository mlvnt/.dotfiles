###############################################################################
# ALIASES                                                                     #
###############################################################################

#   -------------------------------
#   1.  DIRECTORIES
#   -------------------------------

# LS, DIR, Tree
alias ls='pwd && ls -GFshl --group-directories-first --color=auto'
alias ll='ls -GFAshlp'
alias l='ls -GFACsh'
alias dir='dir -A --color=auto'
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
alias temp="cd /mnt/d/Workspace/~TEMP/"
alias work="cd /mnt/d/Workspace/"
alias general="cd /mnt/d/Workspace/General/"
alias gitf="cd /mnt/d/Workspace/Projects/Programing/Git/"
alias dotfiles="cd /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
alias homeu="cd /mnt/c/Users/Todorov/AppData/Local/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState/rootfs/home/todorov/"
alias down="cd /mnt/c/Users/Todorov/Downloads/"
alias docs="cd /mnt/c/Users/Todorov/Documents/"
alias path="pwd"
# Print each PATH entry on a separate line
alias pathv='echo -e ${PATH//:/\\n}'

# CURRENT
alias com4="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/COM2004/Labs/com2004_labs/"
alias uni="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/"
alias hex="/mnt/d/Workspace/University/Sport & Societies/Project Hex/Repository"

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
alias cp='sudo cp -iva'
alias cpd='sudo cp -ri'
alias mv='sudo mv -iv'
alias mkdir='sudo mkdir -pv'
alias chmod='sudo chmod -v'
alias x+="chmod +x"
alias rwx+="chmod +rwx"

# MOUNT && UNMOUNT
alias showm="df -ah" # Show mounted devices

# GREP
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# FIND

#======= Search Files
# find ./ -maxdepth 1 -mindepth 1 -name '*.docx'
# find ./ -maxdepth 1 -mindepth 1 -not -name '*.docx'
alias finds="find ./ -name "       # finds '*.docx' -exec dir -ANsh --color=auto {} \;
alias findsn="find ./ -not -name " # findsn '*.docx' -exec dir -ANsh --color=auto {} \;
# find ./ -type f \( -iname \*.docx -o -iname \*.jpg \)
alias findsm="find ./ -type f \( " # findsm -iname \*.docx -o -iname \*.jpg \)
# find ./ -type f -not \( -iname \*.docx -o -iname \*.jpg \)
alias findsnm="find ./ -type f -not \( " # findsnm -iname \*.docx -o -iname \*.jpg \)
#======= Delete Directories
# find serchDir -depth -type d -delete
# find serchDir -depth -type d -empty -delete
#======= Delete Files
# find serchDir -depth -type f -delete
# find serchDir -name "FILE-TO-FIND" -exec rm -rf {} \;
# find serchDir -type f -name "FILE-TO-FIND" -exec rm -rf {} \;
#=======
# find `pwd` -name .filename

# SHELL CONFIGURATION
alias brc="sudo vim ~/.bashrc"
alias zrc="sudo vim ~/.zshrc"
alias vrc="sudo vim ~/.vimrc"
alias scb="source ~/.bashrc && echo 'Shell config reloaded from ~/.bahrc'"
alias scz="source ~/.zshrc && echo 'Shell config reloaded from ~/.zshrc'"
alias scv="source ~/.vimrc && echo 'Shell config reloaded from ~/.vimrc'"
alias sca="source ~/.*rc ~/.bash* ~/.oh-my-zsh-custom/* && clear"

# File size
alias fs="stat -f \"%z bytes\""

# Logs
alias logs="cd ~/software/install_logs"
alias logsc="rm ~/software/install_logs/*.txt"

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
alias upgrade="sudo do-release-upgrade"

# EDITORS
alias v="vim"
alias c='clear'
alias jupyter="sudo jupyter notebook --allow-root"
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
alias ipw="cmd.exe /c ipconfig /all"
alias dig="dig +nocmd any +multiline +noall +answer"
alias ipa="ifconfig -a"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias hostname='cat /etc/hostname'
alias hosts='cat /etc/hosts'
alias hostse='$EDITOR /etc/hosts'

# BLOG
alias server="ssh todorov@mlvnt.com"
alias hugos="hugo server -w -v"
alias caddy="caddy -conf /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/net/Caddyfile"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
# alias pubkey="cat ~/.ssh/id_rsa.pub | xclip | printf '=> Public key copied to pasteboard.\n'"

# View HTTP traffic
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Enhanced WHOIS lookups
# alias whois="whois -h whois-servers.net"

# Download file and save it with filename of remote file
alias get="curl -O -L"
alias headers='curl -I'

alias wgeta="wget -r -l1 -A"
alias ping="gping"

# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# IPFS
alias ipfs="sudo ipfs daemon"

# Docker

# Weather
alias wr='curl http://wttr.in'
alias wrsheff='curl http://wttr.in/sheffield'
alias wrsof='curl http://wttr.in/sofia'

# MySQL
alias ms='sudo service mysql start && sudo mysql-workbench'
alias mw='sudo mysql-workbench'
alias mysql='sudo mysql -p'

#   -------------------------------
#   6.  GIT
#   -------------------------------

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"
alias git="sudo git"
alias g="git"
alias gf="git fetch && git pull"
alias gac='git add -A && git commit && git push'
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
#   7.  WINDOWS
#   -------------------------------

# Opening files & directories
alias open="explorer.exe"
alias openh=" open ."
alias openi="gnome-open ." # Inside a Desktop environment
alias o="open"
alias tempe="open 'D:\Workspace\~TEMP'"
alias downe="open 'C:\Users\Todorov\Downloads'"
alias docse="open 'C:\Users\Todorov\Documents'"
alias sts="open 'C:\Users\Todorov\Pictures\My Screen Shots'"

# Edit Documents
alias cv="o 'D:\Workspace\General\Personal\Professional\CV & Covering Letter\CV.docx'"
alias index="o 'D:\Workspace\General\Tech\MEMORY\Index\Index.xlsx'"
alias music="o 'D:\Workspace\General\Essential\Music\Music.xlsx'"
alias pics="o 'D:\Workspace\General\Essential\Art\Media Screenshots\Pics.xlsx'"
alias quotes="o 'D:\Workspace\General\Personal\Social\MyAnimeList\My Profile\Intro\Quotes.xlsx'"
alias recipies="o 'D:\Workspace\General\Essential\Cooking\I. Recipes & Weekly Menu.docx'"

# Clipboard
alias pbcopy="clip.exe"
alias cpath="pwd && pwd | pbcopy"

# Microsoft Office
alias wordn="cmd.exe /c start /D 'C:\Program Files\Microsoft Office\Office16' /MAX WINWORD.EXE /w"
# alias word="cmd.exe /c start /D "C:\\Program\ Files\ \(x86\)\\Microsoft\ Office\\Root\\Office16"  /MAX WINWORD.EXE /w"
alias excel="cmd.exe /c start /D 'C:\Program Files\Microsoft Office\Office16' /MAX EXCEL.EXE /x"
alias ppoint="cmd.exe /c start /D 'C:\Program Files (x86)\Microsoft Office\Root\Office16'  /MAX POWERPNT.EXE /B"

# Notepad++
alias npp="cmd.exe /c start /D 'D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\Notepad++\Notepad++ 7.5.1' /MAX notepad++.exe"

# alias npp="cmd.exe /c start /D 'D:\Workspace\Portable Apps\PortableApps.com\PortableApps\Notepad++Portable' /MAX Notepad++Portable.exe"

# alias npp="cmd.exe /c start /D 'D:\Workspace\Portable Apps\PortableApps.com\PortableApps\Notepad++Portable\App\Notepad++' /MAX notepad++.exe"

# 4KDownloader
alias 4k="cmd.exe /c start /D 'C:\Program Files (x86)\4KDownload\4kvideodownloader' 4kvideodownloader.exe"

# Google Chrome
alias chrome="cmd.exe /c start /D 'C:\Program Files (x86)\Google\Chrome\Application' /MAX chrome.exe"

#   -------------------------------
#   8.  DESKTOP ENVIRONMENTS
#   -------------------------------

# XFCE
alias xfce="xfce4-session"

# I3-WM
alias i3="i3"

alias xterm="xfce4-terminal"

#=============================================================================================================

### Print only the name of the current Directory ###
# target_PWD=$(readlink -f .) && echo ${target_PWD%/*}
# target_PWD=$(readlink -f .) && echo ${target_PWD##*/}
# target_PWD=$(readlink -f ./) && printf '%q\n' "${target_PWD##*/}"
# printf '%q\n' "${PWD##*/}" 
# result=${PWD##*/} 