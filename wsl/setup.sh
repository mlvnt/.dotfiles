###############################################################################
# UPDATE PACKAGE REPOS                                                        #
###############################################################################

printf "\n      ==============================\n\n          Begin Installation!   \n\n      ==============================\n\n"

printf '\n      Updating package repositories....\n\n'
sudo apt-get update
yes Y | sudo apt-get upgrade

printf '\n      Installing dos2unix....\n\n'
dpkg -l | grep -qw dos2unix || sudo apt-get install -yyq dos2unix

printf '\n      Installing expect....\n\n'
dpkg -l | grep -qw expect || sudo apt-get install -yyq expect

###############################################################################
# GIT                                                                         #
###############################################################################

printf '\n      Installing git....\n\n'
dpkg -l | grep -qw git || sudo apt-get install -yyq git
cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.git-credentials ~/
cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig-local ~/
cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig ~/
# git config --global user.email "malvintodorov@gmail.com"
# git config --global user.name "mlvnt"
# git config --global color.ui auto
# git config --global push.default matching

###############################################################################
# DOTFILES                                                                    #
###############################################################################

printf '\n      Clonig dotfiles repository....\n\n'
# cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/begin.sh ~/
# sudo chmod +x begin.sh
# git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles
git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/wsl/
sudo dos2unix ./.* ./*.* ./shell/.* ./shell/*.* ./editors/.* ./editors/*.* ./git/.* ./git/*.* ./bin/*
sudo chmod +x ./*.sh ./bin/*
sleep 5s
printf '\n      Logging installation....\n\n'

###############################################################################
# LOG INSTALLATION                                                            #
###############################################################################

printf '\n      Creating log directory....\n\n'
mkdir -p ~/software/install_logs/
cd ~/software/install_logs/

###############################################################################
# LOG symblinks.sh                                                            #
###############################################################################

printf '\n      Logging install.sh....\n\n'
sudo touch log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -a log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sleep 1s

###############################################################################
# LOG install.sh                                                              #
###############################################################################

printf '\n      Logging symblinks.sh....\n\n'
sudo touch log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -a log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt

###############################################################################
# SOURCE CONFIGURATION                                                        #
###############################################################################

cd ~/
printf '\n      Sourcing shell....\n\n'
source ~/.*rc ~/.bash*

sudo apt-get autoremove

printf "\n      ==============================\n\n          Install Complete!   \n\n      ==============================\n\n"

#=============================================================================================================