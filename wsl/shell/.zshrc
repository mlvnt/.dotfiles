# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/todorov/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"
  ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
  ZSH_THEME="agnoster-custom"

# COLORS
eval `dircolors ~/.dir_colors/dircolors.256dark`

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Automatically upgrade itself without prompting
  DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails rails3 ruby capistrano bundler heroku rake rvm autojump command-not-found python pip github gnu-utils history-substring-search zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############################################################################
# ALIASES                                                                     #
###############################################################################
#   -------------------------------
#   1.  DIRECTORIES
#   -------------------------------
alias ls='ls -GFshlA --color=auto'
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
alias sudo="sudo "
alias update="sudo apt-get update && sudo apt-get upgrade"
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
#   4.  CURRENT
#   -------------------------------
alias com4="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/COM2004/Labs/com2004_labs/"
alias uni="cd /mnt/d/Workspace/University/Course/Year\ 2\ -\ 2017-2018/"
#=============================================================================================================