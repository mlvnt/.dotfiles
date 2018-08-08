#!/bin/bash
################################################################################
######################### ALIASES ##############################################
################################################################################

#   -------------------------------
#   DIRECTORIES
#   -------------------------------

# LS, DIR, Tree
alias ls='pwd && ls -GFshl --group-directories-first --color=auto'
alias ll='ls -GFAshlp'
alias l='ls -GFACsh'
alias dir='dir -A --color=auto'
alias dirl='dir -AN1'
alias tree='tree -aF'
alias treei='tree -ahpuF'

# CD
cd() { builtin cd "$@"; ll; }         # Always list directory contents upon 'cd'
alias cd..='cd ../'                   # Go back 1 directory level
alias ..='cd ../'                     # Go back 1 directory level
alias ...='cd ../../'                 # Go back 2 directory levels
alias .3='cd ../../../'               # Go back 3 directory levels
alias .4='cd ../../../../'            # Go back 4 directory levels
alias .5='cd ../../../../../'         # Go back 5 directory levels
alias .6='cd ../../../../../../'      # Go back 6 directory levels

# SHORTCUTS
alias home="cd ~"
alias root="cd /"
alias temp="cd /mnt/d/workspace/~temp"
alias workspace="cd /mnt/d/workspace"
alias gitf="cd /mnt/d/shared/pc/projects/git"
alias dotfiles="cd /mnt/d/shared/pc/projects/git/dotfiles/.dotfiles"
alias homeu="cd /mnt/c/Users/Todorov/AppData/Local/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState/rootfs/home/todorov"
alias down="cd /mnt/c/Users/Todorov/Downloads"
alias docs="cd /mnt/c/Users/Todorov/Documents"
alias path="pwd"
# Print each PATH entry on a separate line
alias pathv='echo -e ${PATH//:/\\n}'

# CURRENT
alias uni="cd /mnt/d/workspace/university/course"

#   -------------------------------
#   FILE MANAGEMENT
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
alias sca="source ~/.*rc ~/.bash* ~/.oh-my-zsh-custom/* && tmux source-file ~/.tmux.conf && clear"
alias rvmsc="source /home/todorov/.rvm/scripts/rvm"

# File size
alias fs="stat -f \"%z bytes\""

# Logs
alias logs="cd ~/software/install_logs"
alias logsc="rm ~/software/install_logs/*.txt"

#   -------------------------------
#   PROGRAM MANAGEMENT
#   -------------------------------

# Stats
alias ram='free -ht'
alias stats="echo '' && inxi -xxx && echo '' && free -ht && echo ''"
alias distro="echo '' && uname -a && echo '' && lsb_release -a && echo ''"

# Enable aliases to be sudo’ed
alias sudo='sudo '
alias htop='sudo htop'
alias kill='kill -9'
alias update='yes Y | sudo apt-get update && yes Y | sudo apt-get upgrade'
alias upgrade='sudo do-release-upgrade'
alias fixinstall='sudo apt-get -f install'

# EDITORS
alias v='vim'
alias c='clear'
alias jupyter='sudo jupyter notebook --allow-root'
alias edit='sudo subl'
alias subl='sudo subl'
alias vim='sudo vim'

# Get week number
alias week='date +%V'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#   -------------------------------
#   NETWORKING
#   -------------------------------

# Networking. IP address, dig, DNS
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
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
alias hugos="hugo server -w -v --disableFastRender --bind=0.0.0.0"
alias caddy="ulimit -n 8192 && caddy -conf /mnt/d/shared/pc/projects/git/dotfiles/.dotfiles/wsl/net/caddyfile"
alias caddyconf="sudo nano /etc/caddy/caddyfile"

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
# alias ping="gping"

# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# IPFS
alias ipfs="sudo ipfs daemon"

# Heroku
alias heroku="sudo heroku"

# Docker

# Weather
alias wr='curl http://wttr.in'
alias wrsheff='curl http://wttr.in/sheffield'
alias wrsof='curl http://wttr.in/sofia'

# MySQL
alias msqls='sudo service mysql start'
alias msqlw='sudo mysql-workbench'
alias msql='sudo mysql -p'

# Raspberry Pi
# alias sshpi='ssh pi@raspberrypi.local'
# alias pilocal='ping raspberrypi.local'
alias sshpi='ssh pi@192.168.137.2'
alias pingpi='cmd.exe /c ping -4 raspberrypi.local'

# youtube-dl
alias ydl="youtube-dl -f '(bestvideo[ext=mp4])[fps!=60]+bestaudio[ext=m4a]/mp4' -o '%(title)s/%(title)s.%(ext)s' --write-description"

# # Download Youtube playlist in a folder and indexing videos using youtube-dl
# alias youtube-dl-playlist="youtube-dl --ignore-errors --output '%(playlist)s/%(playlist_index)s- %(title)s.%(ext)s'"

# --config-location PATH
# --write-info-json
# --write-annotations

# # the best .mp4 video with fps < 60
# youtube-dl -f 'bestvideo[fps!=60]+bestaudio/best[ext=mp4]/best' -o '%(title)s.%(ext)s' https://youtu.be/5BBT7tmkBEA

# # the best .mp4 video with fps < 60 with en subs
# youtube-dl -f 'bestvideo[fps!=60]+bestaudio/best[ext=mp4]/best' -o '%(title)s.%(ext)s' -
# -restrict-filenames --write-sub --sub-format 'ass/srt/best' --sub-lang en https://youtu.be/5BBT7tmkBEA

#   -------------------------------
#   GIT
#   -------------------------------

alias undopush="git push -f origin HEAD^:master"  # Undo a `git push`
alias git="sudo git"
alias g="git"
alias gf="git fetch && git pull"
alias gac='git add -A && git commit && git push'
alias ga='git add -A'
alias gp='git push'
alias gl='git pull'
alias glg='git log'
alias gs='git status'
alias gc='git commit'
alias gcl='git clone'
alias gd='git diff'
alias go='git checkout'
alias gb='git branch'
alias gbl='git blame'
alias gbt=git_list_branches

#   -------------------------------
#   TMUX
#   -------------------------------

alias tw='tmux new -s workspace'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias tka='tmux kill-server'
alias tkw='tmux kill-window -t'
alias td='tmux detach'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias ts='tmux switch -t'
alias tl='tmux list-sessions'
alias tlk='tmux list-keys'
alias tlc='tmux list-commands'
alias ti='tmux info'
alias tsc='tmux source-file ~/.tmux.conf'
alias tb='tmux break -t'
alias tj='tmux join -t'
alias trz='tmux resize'
alias trnw='tmux rename-window -t'
alias trns='tmux rename-session -t'

#   -------------------------------
#   WINDOWS
#   -------------------------------

# Opening Directories
alias o="open"
alias open="explorer.exe"
alias openh=" open ."
alias openi="gnome-open ." # Inside a Desktop environment
alias tempo="open 'D:\workspace\~temp'"
alias downo="open 'C:\Users\Todorov\Downloads'"
alias docso="open 'C:\Users\Todorov\Documents'"
alias screenshots="open 'C:\Users\Todorov\Pictures\My Screen Shots'"
alias appdata="open 'C:\Users\Todorov\AppData'"
alias roaming="open 'C:\Users\Todorov\AppData\Roaming'"
alias startmenu="open 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'"
alias autostart="open 'C:\Users\Todorov\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'"

# Edit Documents
alias cv="o 'D:\workspace\personal\professional\cv\cv.docx'"
alias music="o 'D:\workspace\essential\media\music\music.xlsx'"
alias pics="o 'D:\workspace\essential\art\screenshots\pics.xlsx'"
alias quotes="o 'D:\workspace\personal\me\intro\quotes\quotes.xlsx'"
alias habbits="o 'D:\workspace\personal\time\habits\2018.xlsx'"
alias packlist="o 'D:\workspace\essential\lists\packing.xlsx'"
alias kitchen="o 'D:\workspace\essential\lists\kitchen.xlsx'"
alias techlist="o 'D:\workspace\essential\lists\tech.xlsx'"
alias clothlist="o 'D:\workspace\essential\lists\clothing.xlsx'"
alias index="o 'D:\workspace\essential\lists\memory\index.xlsx'"
alias memory="o 'D:\workspace\essential\lists\memory\index.html'"

# Launch Applications
alias cmd='cmd.exe'
alias cmdc='cmd.exe /c'
alias cmds='cmd.exe /c start /D'
alias regedit="cmds 'C:\Windows' regedit.exe"
alias task="cmds 'C:\Windows\system32' taskmgr.exe /7"

alias vpn="cmds 'C:\Program Files (x86)\PureVPN' purevpn.exe"
alias vm="cmds 'C:\Program Files\Oracle\VirtualBox' VirtualBox.exe"
alias memu="cmds 'C:\ProgramData\Microvirt\MEmu' MEmuConsole.exe MEmu"
alias photoshop="cmds 'C:\Program Files\Adobe\Adobe Photoshop CC 2017' Photoshop.exe"
alias aimp="cmds 'C:\Program Files (x86)\AIMP' AIMP.exe"
alias vlc="cmds 'C:\Program Files\VideoLAN\VLC' vlc.exe"
alias 4k="cmds 'C:\Program Files (x86)\4KDownload\4kvideodownloader' 4kvideodownloader.exe"
alias chrome="cmds 'C:\Program Files (x86)\Google\Chrome\Application' /MAX chrome.exe"
alias excel="cmds 'C:\Program Files\Microsoft Office\Office16' /MAX EXCEL.EXE /x"
alias ppoint="cmds 'C:\Program Files (x86)\Microsoft Office\Root\Office16'  /MAX POWERPNT.EXE /B"

alias mail="cmds 'D:\apps\suites\portableapps.com\PortableApps\ThunderbirdPortable' ThunderbirdPortable.exe"
alias torrent="cmds 'D:\apps\suites\portableapps.com\PortableApps\qBittorrentPortable' qBittorrentPortable.exe"
alias enpass="cmds 'D:\apps\net\security\EnpassPortable_5_6_9\Windows' EnpassPortable.exe"
alias firefox="cmds 'D:\apps\suites\portableapps.com\PortableApps\FirefoxPortable' FirefoxPortable.exe"
alias taiga="cmds 'D:\apps\net\social\Taiga' Taiga.exe"
alias gnucash="cmds 'D:\apps\suites\portableapps.com\PortableApps\GnuCashPortable' GnuCashPortable.exe"
alias sublime="cmds 'D:\apps\development\editors\editors\Sublime_Text' sublime_text.exe"
alias irc="cmds 'D:\apps\suites\portableapps.com\PortableApps\HexChatPortable' HexChatPortable.exe"
alias sync="cmds 'D:\apps\net\file-sharing\SyncTrayzorPortable-x64' SyncTrayzor.exe"
alias ftpstart="cmds 'D:\apps\suites\portableapps.com\PortableApps\FileZillaPortable' FileZillaPortable.exe"
alias keepass="cat /mnt/d/shared/mobile/notebook/necessities/k.txt | cmd.exe /c clip && cmds 'D:\apps\suites\portableapps.com\PortableApps\KeePassProPortable' KeePassProPortable.exe"
alias calibre="cmds 'D:\apps\suites\portableapps.com\PortableApps\calibrePortable' calibrePortable.exe"
alias kodi="cmds 'D:\apps\file-management\media\media-centers\Kodi\Server' kodi.exe -p"
alias plex="cmdc 'D:\apps\file-management\media\media-centers\Plex\Server\Plex Media Server.exe'"
alias npp="cmds 'D:\apps\development\editors\editors\Notepad++\Notepad++ 7.5.1' /MAX notepad++.exe"
alias flash="cmds 'D:\apps\suites\portableapps.com\PortableApps\RufusPortable' RufusPortable.exe"
alias sysmenu="cmds 'D:\apps\suites\symenu' SyMenu.exe"
alias portableapps="cmds 'D:\apps\suites\portableapps.com' Start.exe"
alias rss="cmds 'D:\apps\suites\portableapps.com\PortableApps\QuiteRSSPortable' QuiteRSSPortable.exe"
alias unicode="cmds 'D:\apps\productivity\office\unicode\character-maps\BabelStone' BabelMap.exe"
alias revo="cmds 'D:\apps\program-management\uninstallers\RevoPortable64' RevoUninstallerPortable.exe"
alias revo="cmds 'D:\apps\suites\portableapps.com\PortableApps\DittoPortable' DittoPortable.exe"

alias vnc="~/software/VNC-Viewer-6.17.1113-Linux-x64"
alias chromium-browser='sudo chromium-browser --no-sandbox'

# Clipboard
alias pbcopy="clip.exe"
alias cpath="pwd && pwd | pbcopy"

#   -------------------------------
#   DESKTOP ENVIRONMENTS
#   -------------------------------

# XFCE
alias xfce="xfce4-session"

# I3-WM
alias i3="i3"

alias xterm="xfce4-terminal"

#==========================================================================================================