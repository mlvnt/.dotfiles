###############################################################################
# LOG INSTALLATION                                                            #
###############################################################################
mkdir -p ~/software/install_logs/
cd ~/software/install_logs/
###############################################################################
# LOG symblinks.sh                                                            #
###############################################################################
sudo touch log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo unbuffer ~/.dotfiles/wsl/symblinks.sh 2>&1 | tee -a log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sleep 1s
###############################################################################
# LOG install.sh                                                              #
###############################################################################
sudo touch log_install.sh-$(date "+%Y-%m-%d-%H-%M").txt
sudo unbuffer ~/.dotfiles/wsl/install.sh 2>&1 | tee -a log_symblinks.sh-$(date "+%Y-%m-%d-%H-%M").txt
###############################################################################
# SOURCE CONFIG                                                               #
###############################################################################
cd ~/
source .bashrc .vimrc .zshrc