#!/bin/bash
################################################################################
######################### UPDATE PACKAGE REPOS #################################
################################################################################
function beginning(){
    line1="=============================="
    line2="Begin Installation!"
    columns=$(tput cols)
    printf "\n"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "%*s\n" $(((${#line2}+$columns)/2)) "$line2"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "\n"
}
beginning

printf "\n      Runtime: $(date) @ $(hostname)\n\n"

# Prerequisites
printf '\n      >>> Updating package repositories....\n\n'
sudo apt-get update
yes Y | sudo apt-get upgrade

printf '\n      >>> Installing dos2unix....\n\n'
dpkg -l | grep -qw dos2unix && printf '\n            It'\''s already installed.\n\n' || sudo apt-get install -yyq dos2unix

printf '\n      >>> Installing expect....\n\n'
dpkg -l | grep -qw expect && printf '\n            It'\''s already installed.\n\n' || sudo apt-get install -yyq expect

################################################################################
######################### GIT ##################################################
################################################################################

printf '\n      >>> Installing git....\n\n'
sudo rm -rfv ~/.dotfiles
dpkg -l | grep -qw git && printf '\n            It'\''s already installed.\n\n' || sudo apt-get install -yyq git
sudo cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.git-credentials ~/
sudo cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig-local ~/
sudo cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig ~/

################################################################################
######################### DOTFILES #############################################
################################################################################

printf '\n      >>> Clonig dotfiles repository....\n\n'
# cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/begin.sh ~/
# sudo chmod +x begin.sh
# git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles
rm -rfv ~/.dotfiles/
git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles

printf '\n      >>> Converting files to linux linebreaks....\n\n'
cd ~/.dotfiles/wsl/
sudo dos2unix ./*.* ./shell/* ./shell/zsh/.* ./shell/zsh/.oh-my-zsh-custom/.* ./shell/bash/.* ./editors/.* ./git/.* ./bin/*

printf '\n      >>> Making files executable....\n\n'
sudo chmod -Rv +x ./*.sh ./bin/*

sleep 5s
printf '\n      >>> Logging installation....\n\n'

################################################################################
######################### LOG INSTALLATION #####################################
################################################################################

printf '\n      >>> Creating log directory....\n\n'
mkdir -pv ~/software/install_logs/

################################################################################
######################### LOG symblinks.sh #####################################
################################################################################

printf '\n      >>> Logging install.sh....\n\n'
cd ~/software/install_logs/
sudo touch log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo ~/.dotfiles/wsl/install.sh | sudo tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
# sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sleep 1s

################################################################################
######################### LOG install.sh #######################################
################################################################################

printf '\n      >>> Logging symblinks.sh....\n\n'
cd ~/software/install_logs/
sudo touch log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo ~/.dotfiles/wsl/symblinks.sh | sudo tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
# sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt

################################################################################
######################### SOURCE CONFIGURATION #################################
################################################################################

printf '\n      >>> Sourcing shell....\n\n'
cd ~/
source ~/.*rc ~/.bash* && tmux source-file ~/.tmux.conf

function ending(){
    line1="=============================="
    line2="Install Complete!"
    columns=$(tput cols)
    printf "\n"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "%*s\n" $(((${#line2}+$columns)/2)) "$line2"
    printf "%*s\n" $(((${#line1}+$columns)/2)) "$line1"
    printf "\n"
}
ending

#=============================================================================================================