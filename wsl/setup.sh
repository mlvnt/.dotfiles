###############################################################################
# UPDATE PACKAGE REPOS                                                        #
###############################################################################

printf "\n      ==============================\n\n          Begin Installation!   \n\n      ==============================\n\n"
# Prerequisites
printf '\n      Updating package repositories....\n\n'
echo "========================================================"
sudo apt-get update
yes Y | sudo apt-get upgrade
echo "========================================================"

printf '\n      Installing dos2unix....\n\n'
echo "========================================================"
dpkg -l | grep -qw dos2unix && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq dos2unix
echo "========================================================"

printf '\n      Installing expect....\n\n'
echo "========================================================"
dpkg -l | grep -qw expect && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq expect
echo "========================================================"

###############################################################################
# GIT                                                                         #
###############################################################################

printf '\n      Installing git....\n\n'
echo "========================================================"
sudo rm -rfv ~/.dotfiles
dpkg -l | grep -qw git && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq git
sudo cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.git-credentials ~/
sudo cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig-local ~/
sudo cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig ~/
# git config --global user.email "malvintodorov@gmail.com"
# git config --global user.name "mlvnt"
# git config --global color.ui auto
# git config --global push.default matching
echo "========================================================"

###############################################################################
# DOTFILES                                                                    #
###############################################################################

printf '\n      Clonig dotfiles repository....\n\n'
echo "========================================================"
# cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/begin.sh ~/
# sudo chmod +x begin.sh
# git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles
rm -rfv ~/.dotfiles/
git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
echo "========================================================"

printf '\n      Converting files to linux linebreaks....\n\n'
echo "========================================================"
cd ~/.dotfiles/wsl/
sudo dos2unix ./*.* ./shell/* ./shell/zsh/.* ./shell/zsh/.oh-my-zsh-custom/.* ./shell/bash/.* ./editors/.* ./git/.* ./bin/*
echo "========================================================"

printf '\n      Making files executable....\n\n'
echo "========================================================"
sudo chmod -Rv +x ./*.sh ./bin/*
echo "========================================================"

sleep 5s
printf '\n      Logging installation....\n\n'

###############################################################################
# LOG INSTALLATION                                                            #
###############################################################################

printf '\n      Creating log directory....\n\n'
mkdir -p ~/software/install_logs/

###############################################################################
# LOG symblinks.sh                                                            #
###############################################################################

printf '\n      Logging install.sh....\n\n'
echo "========================================================"
cd ~/software/install_logs/
sudo touch log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo ~/.dotfiles/wsl/install.sh | sudo tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
# sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sleep 1s
echo "========================================================"

###############################################################################
# LOG install.sh                                                              #
###############################################################################

printf '\n      Logging symblinks.sh....\n\n'
echo "========================================================"
cd ~/software/install_logs/
sudo touch log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo ~/.dotfiles/wsl/symblinks.sh | sudo tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
# sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
echo "========================================================"

###############################################################################
# SOURCE CONFIGURATION                                                        #
###############################################################################

printf '\n      Sourcing shell....\n\n'
echo "========================================================"
cd ~/
source ~/.*rc ~/.bash*
echo "========================================================"

printf "\n      ==============================\n\n          Install Complete!   \n\n      ==============================\n\n"
# echo -e "\n      ==============================\n\n          Install Complete!   \n\n      ==============================\n\n"

#=============================================================================================================