###############################################################################
# ALIASES                                                                     #
###############################################################################
#   -------------------------------
#   1.  DIRECTORIES
#   -------------------------------
alias ls='ls -GFshl --color=auto'
alias ll='ls -FGlAshp --color=auto'
alias l='ls -CAFshG'
alias home="cd ~"
alias root="cd /"
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias temp="cd /mnt/d/Workspace/_TEMP/"
alias work="cd /mnt/d/Workspace/"
alias general="cd /mnt/d/Workspace/General/"
alias homer="cd /mnt/c/Users/Todorov/AppData/Local/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState/rootfs/home/todorov/"
alias down="cd /mnt/c/Users/Todorov/Downloads/"
alias path="pwd"
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
#   3.  ARCHIVES
#   -------------------------------
alias tarunzip="tar -xzvf"
alias tarzip="tar -zcvf"
alias zipdir="zip -r"
alias gzip="gzip -k"
alias gzipdir="gzip -kr"
alias tarbackup='tar -zcvf "backup-$(date "+%Y-%m-%d-%H-%M").tar.gz"'
#   -------------------------------
#   4.  UNIVERSIAL
#   -------------------------------
alias sudo="sudo "
alias update="sudo apt-get update && sudo apt-get upgrade"
alias m3u="ls >> tracklist.m3u"
alias brc="sudo vim ~/.bashrc"
alias zrc="sudo vim ~/.zshrc"
alias vrc="sudo vim ~/.vimrc"
alias scb="source ~/.bashrc"
alias scz="source ~/.zshrc"
alias scv="source ~/.vimrc"
alias sca="source ~/.*rc ~/.bash*" 
alias server="ssh todorov@mlvnt.com"
alias blog="cd /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/mvlnt"
alias blogc="rm -rfv /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/public_html/ && mkdir -p /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/public_html/"
alias hugos="hugo server -w"
alias dotfiles="cd /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles/"
alias ohmyzsh="sudo cp -r /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles/wsl/shell/.oh-my-zsh ~/.dotfiles/wsl/shell/"
alias dots="sudo rm -rfv ~/.dotfiles && git clone /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles/ ~/.dotfiles && ohmyzsh && sudo dos2unix ~/.dotfiles/wsl/.* ~/.dotfiles/wsl/*.* ~/.dotfiles/wsl/shell/.* ~/.dotfiles/wsl/shell/*.* .~/.dotfiles/wsl/editors/.* ~/.dotfiles/wsl/editors/*.* ~/.dotfiles/wsl/git/.* ~/.dotfiles/wsl/git/*.* ~/.dotfiles/wsl/bin/* && sca"
alias v="vim"
alias c='clear'
alias rm="rm -v"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias cpd='cp -ri'
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'
alias x+="sudo chmod +x"
alias rwx+="sudo chmod +rwx"
alias jupyter="jupyter notebook"
alias edit='sudo subl'
alias subl='sudo subl'
alias vim='sudo vim'
# trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#   -------------------------------
#   5.  GIT
#   -------------------------------
alias git="sudo git"
alias g="git"
alias gf="git fetch"
alias gac='git add -A && git commit'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gc='git commit'
alias gcl='git clone'
alias ga='git add -A'
alias gd='git diff'
alias go='git checkout'
#   -------------------------------
#   6.  CURRENT
#   -------------------------------
alias com4="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/COM2004/Labs/com2004_labs/"
alias uni="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/"
#   -------------------------------
#   7.  WINDOWS
#   -------------------------------
alias open="explorer.exe"
alias 4k="cmd.exe /c start /D 'C:\Program Files (x86)\4KDownload\4kvideodownloader' 4kvideodownloader.exe"
#=============================================================================================================