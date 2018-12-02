#!/bin/bash

beginning() {
    local line1="=============================="
    local line2="Begin Installation!"
    local columns=$(tput cols)
    printf "\n"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "%*s\n" $(((${#line2}+$columns)/2)) "$line2"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "\n      Runtime: $(date) @ $(hostname)\n\n"
}

#   -------------------------------
#   INSTALL PREREQUISITES
#   -------------------------------

install_prereq() {
    printf '\n      >>> Load temp config....\n\n'
    pushd /tmp
    curl -O https://raw.githubusercontent.com/mlvnt/.dotfiles/master/wsl/shell/bash/.bash_onload
    curl -O https://raw.githubusercontent.com/mlvnt/.dotfiles/master/wsl/shell/bash/.bash_dirs
    source .bash_*
    popd

    printf '\n      >>> Updating package repositories....\n\n'
    sudo apt-get update
    yes Y | sudo apt-get upgrade

    printf '\n      >>> Installing dos2unix....\n\n'
    dpkg -l | grep -qw dos2unix && printf '\n            It'\''s already installed.\n\n' || sudo apt-get install -yyq dos2unix

    printf '\n      >>> Installing expect....\n\n'
    dpkg -l | grep -qw expect && printf '\n            It'\''s already installed.\n\n' || sudo apt-get install -yyq expect

    printf '\n      >>> Installing git....\n\n'
    dpkg -l | grep -qw git && printf '\n            It'\''s already installed.\n\n' || sudo apt-get install -yyq git
    local gitdir=${local}/pc/projects/git/dotfiles/.dotfiles/wsl/files/git
    sudo cp -v ${gitdir}/.git-credentials ${gitdir}/.gitconfig-local ${gitdir}/.gitconfig ~/
    sudo chown -Rv $USER:$USER ~/.git*
}

#   -------------------------------
#   GET DOTFILES
#   -------------------------------

get_dots() {
    printf '\n      >>> Clonig dotfiles repository....\n\n'
    # cp /mnt/d/shared/pc/projects/git/dotfiles/.dotfiles/wsl/begin.sh ~/
    # sudo chmod +x begin.sh
    # git clone /mnt/d/shared/pc/projects/git/dotfiles/.dotfiles
    rm -rfv ~/.dotfiles/
    git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
    git remote set-url origin git@github.com:mlvnt/.dotfiles.git

    printf '\n      >>> Converting files to linux linebreaks....\n\n'
    pushd ~/.dotfiles/wsl/
    sudo dos2unix ./*.* ./shell/zsh/.* ./shell/zsh/.oh-my-zsh-custom/.* ./shell/bash/.* ./editors/.* ./git/.* ./bin/*

    printf '\n      >>> Making files executable....\n\n'
    sudo chmod -Rv +x ./*
    sudo chown -Rv $USER:$USER ./*
    popd
}

#   -------------------------------
#   IMPORT CONFIG
#   -------------------------------

import_config() {
    printf '\n      >>> Remove existing configuraion....\n'
    sudo rm -rfv ~/.bash* ~/.zshrc ~/.profile ~/.local /tmp/.bash_*

    printf '\n      >>> Importing zsh, sublime, radicale, tldr, net configuraion....\n'
    yes yes | sudo cp -rv "${path_dots}"/shell/zsh/.oh-my-zsh "${path_dots_local}"/shell/zsh
    yes yes | sudo cp -rv "${path_dots}"/.config/sublime-text-3 "${path_dots_local}"/.config
    yes yes | sudo cp -rv "${path_dots}"/.config/radicale "${path_dots_local}"/.config
    yes yes | sudo cp -rv "${path_dots}"/.local/share/tldr "${path_dots_local}"/.local/share
    yes yes | sudo cp -rv "${path_dots}"/net/mac.txt "${path_dots}"/net/social "${path_dots_local}"/net

    printf '\n      >>> Importing Windows onload scripts....\n'
    cp ${local}/pc/projects/scripts/windows/batch/boot/Acer\ Predator/workspace.cmd /mnt/c/Users/Todorov/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup

    printf '\n      >>> Importing SSH configuraion....\n'
    sudo cp -rv ${local}/mobile/config/net/security/.ssh ~/
    sudo chmod -v 600 ~/.ssh/*
    sudo chmod -v 700 ~/.ssh
    sudo chown -Rv $USER:$USER ~/.ssh/

    printf '\n      >>> Importing GPG keys....\n'
    path="${local}/mobile/config/net/security/pgp/Malvin Todorov malvintodorov@gmail.com (0x74B79CF7)"
    sudo gpg --import "$path"/mlvnt-pub.asc
    sudo gpg --import "$path"/mlvnt-sec.asc
}

#   -------------------------------
#   LOG INSTALLATION
#   -------------------------------

log() {
    sleep 5s
    printf '\n      >>> Logging installation....\n\n'
    mkdir -pv ~/software/install_logs
    pushd ~/software/install_logs

    printf '\n      >>> Logging install.sh....\n\n'
    sudo touch log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
    sudo ~/.dotfiles/wsl/install.sh | sudo tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
    # sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
    sleep 1s

    printf '\n      >>> Logging symblinks.sh....\n\n'
    sudo touch log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
    sudo ~/.dotfiles/wsl/symblinks.sh | sudo tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
    # sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt

    popd
}

#   -------------------------------
#   SOURCE CONFIGURATION
#   -------------------------------

source_all() {
    printf '\n      >>> Sourcing shell....\n\n'
    cd ~/
    sudo chown -Rv $USER:$USER  ~/*
    source ~/.*rc ~/.bash*
}

ending() {
    local line1="=============================="
    local line2="Install Complete!"
    local columns=$(tput cols)
    printf "\n"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "%*s\n" $(((${#line2}+$columns)/2)) "$line2"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "\n"
}

run() {
    beginning
    install_prereq
    get_dots
    import_config
    log
    source_all
    ending
}
run

#   -------------------------------
#   UNSET DEFINITIONS
#   -------------------------------

functions=(
    "beginning"
    "ending"
    "install_prereq"
    "log"
    "get_dots"
    "source_all"
    "run"
    "import_config"
);

unset -f "${functions[@]}";
unset -v functions;

#-------------------------------------------------------------------------------
