###############################################################################
# UPDATE PACKAGE REPOS                                                        #
###############################################################################

echo -e "\n      ==============================\n\n          Begin Installation!   \n\n      ==============================\n\n"

echo -e '\n      Updating package repositories....\n\n'
echo "========================================================"
sudo apt-get update
yes Y | sudo apt-get upgrade
echo "========================================================"

echo -e '\n      Installing dos2unix....\n\n'
echo "========================================================"
dpkg -l | grep -qw dos2unix || sudo apt-get install -yyq dos2unix
echo "========================================================"

echo -e '\n      Installing expect....\n\n'
echo "========================================================"
dpkg -l | grep -qw expect || sudo apt-get install -yyq expect
echo "========================================================"

###############################################################################
# GIT                                                                         #
###############################################################################

echo -e '\n      Installing git....\n\n'
echo "========================================================"
dpkg -l | grep -qw git || sudo apt-get install -yyq git
cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.git-credentials ~/
cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig-local ~/
cp -v /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/git/.gitconfig ~/
# git config --global user.email "malvintodorov@gmail.com"
# git config --global user.name "mlvnt"
# git config --global color.ui auto
# git config --global push.default matching
echo "========================================================"

###############################################################################
# DOTFILES                                                                    #
###############################################################################

echo -e '\n      Clonig dotfiles repository....\n\n'
echo "========================================================"
# cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/begin.sh ~/
# sudo chmod +x begin.sh
# git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles
git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
echo "========================================================"

echo -e '\n      Converting files to linux linebreaks....\n\n'
echo "========================================================"
cd ~/.dotfiles/wsl/
sudo dos2unix ./*.* ./shell/* ./shell/zsh/.* ./shell/zsh/.oh-my-zsh-custom/.* ./shell/bash/.* ./editors/.* ./git/.* ./bin/*
echo "========================================================"

echo -e '\n      Making files executable....\n\n'
echo "========================================================"
sudo chmod -Rv +x ./*.sh ./bin/*
echo "========================================================"

sleep 5s
echo -e '\n      Logging installation....\n\n'

###############################################################################
# LOG INSTALLATION                                                            #
###############################################################################

echo -e '\n      Creating log directory....\n\n'
mkdir -p ~/software/install_logs/

###############################################################################
# LOG symblinks.sh                                                            #
###############################################################################

echo -e '\n      Logging install.sh....\n\n'
echo "========================================================"
sudo touch log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
cd ~/software/install_logs/
sudo ~/.dotfiles/wsl/install.sh | sudo tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
# sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -ai log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sleep 1s
echo "========================================================"

###############################################################################
# LOG install.sh                                                              #
###############################################################################

echo -e '\n      Logging symblinks.sh....\n\n'
echo "========================================================"
sudo touch log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
cd ~/software/install_logs/
sudo ~/.dotfiles/wsl/symblinks.sh | sudo tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
# sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -ai log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
echo "========================================================"

###############################################################################
# SOURCE CONFIGURATION                                                        #
###############################################################################

echo -e '\n      Sourcing shell....\n\n'
echo "========================================================"
cd ~/
source ~/.*rc ~/.bash*
echo "========================================================"

sudo apt-get autoremove

echo -e "\n      ==============================\n\n          Install Complete!   \n\n      ==============================\n\n"
# printf "\n      ==============================\n\n          Install Complete!   \n\n      ==============================\n\n"

#=============================================================================================================