###############################################################################
# UPDATE PACKAGE REPOS                                                        #
###############################################################################
sudo apt-get update
sudo apt-get upgrade
printf '\nInstalling dos2unix....\n\n'
dpkg -l | grep -qw dos2unix || sudo apt-get install -yyq dos2unix
printf '\nInstalling expect....\n\n'
dpkg -l | grep -qw expect || sudo apt-get install -yyq expect
###############################################################################
# GIT                                                                         #
###############################################################################
printf '\nInstalling git....\n\n'
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
printf '\nClonig dotfiles repository....\n\n'
# cp /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/begin.sh ~/
# sudo chmod +x begin.sh
# git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles
git clone https://github.com/mlvnt/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles/wsl/
sudo dos2unix ./.* ./*.* ./shell/.* ./shell/*.* ./editors/.* ./editors/*.* ./git/.* ./git/*.* ./bin/*
sudo chmod +x ./*.sh ./bin/*
sleep 5s
printf '\nLogging installation....\n\n'
sudo ./run.sh
printf "\n“-----------------------\n\n    Install Complete!   \n\n-----------------------”\n\n"
#=============================================================================================================