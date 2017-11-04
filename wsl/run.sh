cd ~/software/install_logs/
sudo touch log-$(date "+%Y-%m-%d-%H-%M").txt
sudo unbuffer ~/install.sh 2>&1 | tee -a log-$(date "+%Y-%m-%d-%H-%M").txt
cd ~/