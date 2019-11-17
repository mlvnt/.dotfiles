#!/bin/bash

#█▓▒░ print helpers ------------------------------------------------------------

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

ending() {
    local line1="=============================="
    local line2="Installation Complete!"
    local columns=$(tput cols)
    printf "\n"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "%*s\n" $(((${#line2}+$columns)/2)) "$line2"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "\n"
}

#█▓▒░ install prerequisites ----------------------------------------------------

install_prereq() {
    printf '\n      >>> Load temp config....\n\n'
    pushd /tmp
    curl -O https://raw.githubusercontent.com/mlvnt/.dotfiles/master/shell/bash/.bash_onload
    curl -O https://raw.githubusercontent.com/mlvnt/.dotfiles/master/shell/bash/.bash_dirs
    source .bash_*
    popd

    printf '\n      >>> Updating package repositories....\n\n'
    sudo apt-get update
    yes Y | sudo apt-get upgrade

    printf '\n      >>> Installing dos2unix, expect, git ....\n\n'
    sudo apt-get install -yyq dos2unix expect git
}

#█▓▒░ get dotfiles -------------------------------------------------------------

get_dots() {
    printf '\n      >>> Clonig dotfiles repository....\n\n'
    # cp /mnt/d/sync/pc/projects/dotfiles/dotfiles/wsl/begin.sh ~/
    # sudo chmod +x begin.sh
    # git clone /mnt/d/sync/pc/projects/dotfiles/dotfiles ~/.dotfiles
    git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
    git remote set-url origin git@github.com:mlvnt/.dotfiles.git

    printf '\n      >>> Converting files to linux linebreaks....\n\n'
    pushd ~/.dotfiles/wsl/
    find . -type d \( -name ".config" -o -name ".local" \) -prune -o -type f -print0 | xargs -0 -n 1 -P 4 dos2unix

    printf '\n      >>> Making files executable....\n\n'
    sudo chmod -Rv +x ./*
    sudo chown -Rv $USER:$USER ./*
    popd
}

#█▓▒░ log installation ---------------------------------------------------------

log() {
    sleep 5s
    printf '\n      >>> Logging installation....\n\n'
    mkdir -pv ~/software/install_logs
    pushd ~/software/install_logs

    printf '\n      >>> Logging install.sh....\n\n'
    sudo ~/.dotfiles/wsl/install.sh | tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
    # sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
    sleep 1s

    printf '\n      >>> Logging symblinks.sh....\n\n'
    sudo ~/.dotfiles/wsl/symblinks.sh | tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
    # sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt

    popd
}

#█▓▒░ source configuration -----------------------------------------------------

source_all() {
    printf '\n      >>> Sourcing shell....\n\n'
    cd ~/
    sudo chown -Rv $USER:$USER  ~/*
    source ~/.*rc ~/.bash*
}

# set hostname
# echo 'pc' | sudo tee /etc/hostname > /dev/null

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

#█▓▒░ unset definitions --------------------------------------------------------

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
