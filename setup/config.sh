#!/bin/bash

#█▓▒░ import config ------------------------------------------------------------

import_config() {
    printf '\n      >>> Importing git config....\n'
    local gitdir=${local}/pc/projects/dotfiles/dotfiles/wsl/files/git
    sudo cp -v ${gitdir}/.git-credentials ${gitdir}/.gitconfig-local ${gitdir}/.gitconfig ~/
    sudo chown -Rv $USER:$USER ~/.git*

    printf '\n      >>> Remove existing configuraion....\n'
    sudo rm -rfv ~/.bash* ~/.zshrc ~/.profile ~/.local /tmp/.bash_*

    printf '\n      >>> Importing zsh, sublime, radicale, tldr, net configuraion....\n'
    yes yes | sudo cp -rv "${dots}"/shell/zsh/.oh-my-zsh "${dots_local}"/shell/zsh
    yes yes | sudo cp -rv "${dots}"/.config/sublime-text-3 "${dots_local}"/.config
    yes yes | sudo cp -rv "${dots}"/.config/radicale "${dots_local}"/.config
    yes yes | sudo cp -rv "${dots}"/.local/share/tldr "${dots_local}"/.local/share
    yes yes | sudo cp -rv "${dots}"/net/mac.txt "${dots}"/net/social "${dots_local}"/net

    printf '\n      >>> Importing Windows onload scripts....\n'
    cp ${local}/pc/projects/scripts/windows/batch/boot/Acer\ Predator/workspace.cmd /mnt/c/Users/Todorov/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup

    printf '\n      >>> Importing SSH configuraion....\n'
    sudo cp -rv ${local}/mobile/config/net/security/.ssh ~/
    sudo chmod -v 600 ~/.ssh/id_*
    # sudo chmod -v 700 ~/.ssh
    sudo chmod -v +rwx ~/.ssh
    sudo chown -Rv $USER:$USER ~/.ssh/

    printf '\n      >>> Importing GPG keys....\n'
    path="${local}/mobile/config/net/security/pgp/Malvin Todorov malvintodorov@gmail.com (0x74B79CF7)"
    sudo gpg --import "$path"/mlvnt-pub.asc
    sudo gpg --import "$path"/mlvnt-sec.asc
}
