###############################################################################
# UPDATE PACKAGE REPOS                                                        #
###############################################################################
sudo apt-get update
sudo apt-get upgrade
dpkg -l | grep -qw dos2unix || sudo apt-get install -yyq dos2unix
dpkg -l | grep -qw expect || sudo apt-get install -yyq expect
###############################################################################
# GIT                                                                         #
###############################################################################
dpkg -l | grep -qw git || sudo apt-get install -yyq git
# git config --global user.email "malvintodorov@gmail.com"
# git config --global user.name "mlvnt"
# git config --global color.ui auto
# git config --global push.default matching
###############################################################################
# DOTFILES                                                                    #
###############################################################################
# cp /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles/wsl/begin.sh ~/
# sudo chmod +x begin.sh
# git clone /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles
git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/wsl/
sudo dos2unix ./.* ./*.* ./shell/.* ./shell/*.* ./editors/.* ./editors/*.* ./git/.* ./git/*.* ./bin/*
sudo chmod +x install.sh run.sh symblinks.sh begin.sh
sleep 10s
sudo ./run.sh
printf "\n“-----------------------\n\n    Install Complete!   \n\n-----------------------”\n\n"