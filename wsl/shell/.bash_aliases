###############################################################################
# ALIASES                                                                     #
###############################################################################
#   -------------------------------
#   1.  DIRECTORIES
#   -------------------------------
alias ls='ls -GFhl --color=auto'
alias ll='ls -FGlAhp --color=auto'
alias la='ls -AF'
alias l='ls -CF'
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
#   -------------------------------
#   1.1.  TRASHCAN
#   -------------------------------
alias trash="trash-put"
alias tl="trash-list"
alias tls="trash-list | grep"
alias te="trash-empty"
alias tre="trash-restore"
alias trm="trash-rm" #Remove individual files from the trashcan
alias trashcan="cd /.local/share/Trash"
#   -------------------------------
#   2.  UNIVERSIAL
#   -------------------------------
alias m3u="ls >> tracklist.m3u"
alias brc="sudo vim ~/.bashrc"
alias zrc="sudo vim ~/.zshrc"
alias vrc="sudo vim ~/.vimrc"
alias scb="source ~/.bashrc"
alias scz="source ~/.zshrc"
alias scv="source ~/.vimrc"
alias sca="source ~/.bashrc && source ~/.zshrc && source ~/.vimrc"
alias server="ssh todorov@mlvnt.com"
alias blog="cd /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/mvlnt"
alias blogc="rm -rfv /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/public_html/ && mkdir -p /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Blog/mlvnt.com/public_html/"
alias hugos="hugo server -w"
alias tarbackup='tar -zcvf "backup-$(date "+%Y-%m-%d-%H-%M").tar.gz"'
alias dots="git pull /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles/wsl && sudo dos2unix ~/.dotfiles/wsl/.* ~/.dotfiles/wsl/*.* && sca"
alias v="vim"
alias c='clear'
alias rm="rm -v"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'
alias x+="chmod +x"
alias edit='subl'
# trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#   -------------------------------
#   3.  GIT
#   -------------------------------
alias g="git"
alias gf="git fetch"
alias gac='git add -A && git commit -m'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gc='git commit -m'
alias gcl='git clone'
alias ga='git add -A'
alias gd='git diff'
alias go='git checkout'
#   -------------------------------
#   4.  CURRENT
#   -------------------------------
alias com4="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/COM2004/Labs/com2004_labs/"
alias uni="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/"
#=============================================================================================================