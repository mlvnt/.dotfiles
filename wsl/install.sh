#   -------------------------------
#   1.  INSTALL RUNTIMES
#   -------------------------------

##### PYTHON #####
printf '\nInstalling python3....\n\n'
dpkg -l | grep -qw python3 || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt-get install -yyq python3-pip
# MODULES
printf '\nInstalling python modules....\n\n'
sudo pip3 install matplotlib
sudo pip3 install scipy
sudo pip3 install setuptools

##### RUBY #####
printf '\nInstalling ruby....\n\n'
dpkg -l | grep -qw ruby || sudo apt-get install -yyq ruby
dpkg -l | grep -qw ruby-bundler || sudo apt-get install -yyq ruby-bundler

##### NODEJS #####
printf '\nInstalling nodejs....\n\n'
dpkg -l | grep -qw nodejs || sudo apt-get install -yyq nodejs
printf '\nInstalling npm....\n\n'
dpkg -l | grep -qw npm || sudo apt-get install -yyq npm
# PACKAGES
printf '\nInstalling npm packages....\n\n'
# which http-server
# sudo vim /usr/local/bin/http-server
# change node with nodejs
sudo npm -g install http-server

##### OTHER #####
printf '\nInstalling haskell....\n\n'
dpkg -l | grep -qw ghc || sudo apt-get install -yyq ghc
printf '\nInstalling php7.0-cli....\n\n'
dpkg -l | grep -qw php7.0-cli || sudo apt-get install -yyq php7.0-cli
printf '\nInstalling openjdk-9-jre-headless....\n\n'
dpkg -l | grep -qw openjdk-9-jre-headless || sudo apt-get install -yyq openjdk-9-jre-headless
printf '\nInstalling sqlite3....\n\n'
dpkg -l | grep -qw sqlite3 || sudo apt-get install -yyq sqlite3

#   -------------------------------
#   2.  INSTALL TOOLS-NON-GUI
#   -------------------------------

printf '\nInstalling fontconfig....\n\n'
dpkg -l | grep -qw fontconfig || sudo apt-get install -yyq fontconfig
printf '\nInstalling htop....\n\n'
dpkg -l | grep -qw htop || sudo apt-get install -yyq htop
printf '\nInstalling tree....\n\n'
dpkg -l | grep -qw tree || sudo apt-get install -yyq tree
printf '\nInstalling pandoc....\n\n'
dpkg -l | grep -qw pandoc || sudo apt-get install -yyq pandoc
printf '\nInstalling gparted....\n\n'
dpkg -l | grep -qw gparted || sudo apt-get install -yyq gparted
printf '\nInstalling nano....\n\n'
dpkg -l | grep -qw nano || sudo apt-get install -yyq nano
printf '\nInstalling tar....\n\n'
dpkg -l | grep -qw tar || sudo apt-get install -yyq tar
printf '\nInstalling man....\n\n'
dpkg -l | grep -qw man || sudo apt-get install -yyq man
printf '\nInstalling inxi....\n\n'
dpkg -l | grep -qw inxi || sudo apt-get install -yyq inxi
printf '\nInstalling ffmpeg....\n\n'
dpkg -l | grep -qw ffmpeg || sudo apt-get install -yyq ffmpeg
printf '\nInstalling mc....\n\n'
dpkg -l | grep -qw mc || sudo apt-get install -yyq mc
printf '\nInstalling make....\n\n'
dpkg -l | grep -qw make || sudo apt-get install -yyq make
printf '\nInstalling graphviz....\n\n'
dpkg -l | grep -qw graphviz || sudo apt-get install -yyq graphviz
printf '\nInstalling tee....\n\n'
dpkg -l | grep -qw tee || sudo apt-get install -yyq tee
printf '\nInstalling tmux....\n\n'
dpkg -l | grep -qw tmux || sudo apt-get install -yyq tmux
printf '\nInstalling emacs....\n\n'
dpkg -l | grep -qw emacs || sudo apt-get install -yyq emacs
printf '\nInstalling zip....\n\n'
dpkg -l | grep -qw zip || sudo apt-get install -yyq zip
printf '\nInstalling unzip....\n\n'
dpkg -l | grep -qw unzip || sudo apt-get install -yyq unzip
printf '\nInstalling pcregrep....\n\n'
dpkg -l | grep -qw pcregrep || sudo apt-get install -yyq pcregrep
printf '\nInstalling ngrep....\n\n'
dpkg -l | grep -qw ngrep || sudo apt-get install -yyq ngrep

##### XCLIP #####
printf '\nInstalling xclip....\n\n'
dpkg -l | grep -qw xclip || sudo apt-get install -yyq xclip

##### NET TOOLS #####
printf '\nInstalling curl....\n\n'
dpkg -l | grep -qw curl || sudo apt-get install -yyq curl
printf '\nInstalling wget....\n\n'
dpkg -l | grep -qw wget || sudo apt-get install -yyq wget
printf '\nInstalling whois....\n\n'
dpkg -l | grep -qw whois || sudo apt-get install -yyq whois
printf '\nInstalling network-manager....\n\n'
dpkg -l | grep -qw network-manager || sudo apt-get install -yyq network-manager
printf '\nInstalling ipmiutil....\n\n'
dpkg -l | grep -qw ipmiutil || sudo apt-get install -yyq ipmiutil
printf '\nInstalling net-tools....\n\n'
dpkg -l | grep -qw net-tools || sudo apt-get install -yyq net-tools
printf '\nInstalling wireless-tools....\n\n'
dpkg -l | grep -qw wireless-tools || sudo apt-get install -yyq wireless-tools
printf '\nInstalling libwww-perl....\n\n'
dpkg -l | grep -qw wireless-tools || sudo apt-get install -yyq libwww-perl
# printf '\nInstalling sudo apt install wireshark-qt....\n\n'
# dpkg -l | grep -qw wireless-tools || sudo apt-get install -yyq sudo apt install wireshark-qt

#   -------------------------------
#   3.  INSTALL TOOLS-GUI
#   -------------------------------

##### XFCE4 #####
printf '\nInstalling xfce4....\n\n'
sudo apt-get install xfce4
sudo apt-get install xfce4-goodies

##### I3-WM #####
printf '\nInstalling i3-wm....\n\n'
sudo apt-get install i3-wm
sudo apt-get install dmenu
sudo apt-get install i3status
sudo apt-get install feh

##### SUBLIME TEXT 3 #####
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

##### MOZILLA FIREFOX #####

#   -------------------------------
#   4.  INSTALL TRASH-CLI
#   -------------------------------

printf '\nInstalling trash-cli....\n\n'
git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
sudo python3 ~/trash-cli/setup.py install
sudo rm -rfv ~/trash-cli/

#   -------------------------------
#   5.  INSTALL JUPYTER
#   -------------------------------

printf '\nInstalling jupyter....\n\n'
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter

#   -------------------------------
#   6.  INSTALL ZSH
#   -------------------------------

printf '\nInstalling zsh....\n\n'
dpkg -l | grep -qw zsh || sudo apt-get install -yyq zsh

##### OH MY ZSH #####
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# .oh-my-zsh/themes/ replace %~ with %c to show only the current dir name
# To upgrade type the folling in zsh shell: upgrade_oh_my_zsh
# To unistall type the folling in zsh shell: uninstall_oh_my_zsh 

##### OH MY ZSH PLUGINS #####
# ZSH-AUTOSUGGESTIONS
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# ZSH-SYNTAX-HIGHLIGHTING
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##### POWERLEVEL9K #####
# git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

##### DIRCOLORS-SOLARIZED #####
# mkdir -p ~/.dir_colors
# cd .dir_colors/
# git clone https://github.com/seebi/dircolors-solarized.git
# mv dircolors-solarized/dircolors.256dark ./
# cd ~/

#   -------------------------------
#   7.  INSTALL VIM
#   ------------------------------- 

printf '\nInstalling vim....\n\n'
dpkg -l | grep -qw vim || sudo apt-get install -yyq vim
# mkdir -p ~/.vim/colors/

##### ZENBURN THEME #####
# sudo git clone https://github.com/jnurmine/Zenburn.git
# sudo mv Zenburn/colors/zenburn.vim ~/.vim/colors/
# mv zenburn.vim ~/.vim/colors/
# rm -rfv Zenburn/

##### PATHOGEN PLUGIN #####
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# cd ~/.vim/bundle/
# sudo wget https://github.com/rust-lang/rust.vim.git
# sudo wget https://github.com/ervandew/supertab.git
# sudo wget https://github.com/kien/ctrlp.vim.git
# sudo wget https://github.com/othree/html5.vim.git
# sudo wget https://github.com/jceb/vim-orgmode.git
# sudo wget https://github.com/vim-scripts/utl.vim.git
# sudo wget https://github.com/tpope/vim-speeddating.git
# cd ~/

#   -------------------------------
#   8.  INSTALL HUGO
#   -------------------------------

printf '\nInstalling hugo....\n\n'
wget https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.deb
sudo apt install ./hugo*.deb
mv hugo*.deb ~/software/

#   -------------------------------
#   9.  INSTALL CADDY
#   -------------------------------

printf '\nInstalling caddy....\n\n'
wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
tar -xzf caddy*.tar.gz caddy
mv ./caddy /usr/local/bin
mv caddy*.tar.gz ~/software/

#   -------------------------------
#   10.  INSTALL IPFS
#   -------------------------------

printf '\nInstalling ipfs....\n\n'
wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
tar -xzf go-ipfs*.tar.gz
sudo cp ~/go-ipfs/ipfs /usr/bin/
sudo cp ~/go-ipfs/ipfs /usr/local/bin/
rm -rfv ~/go-ipfs/
mv go-ipfs*.tar.gz ~/software/
ipfs init
# ipfs daemon

#   -------------------------------
#   11.  INSTALL POWERLINE
#   -------------------------------

printf '\nInstalling powerline....\n\n'
sudo pip3 install --user powerline-status
# sudo rm PowerlineSymbols*
# sudo rm 10-powerline-symbols*
# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
# mkdir -p ~/.fonts/
# mv PowerlineSymbols.otf ~/.fonts/
# fc-cache -vf ~/.fonts/ #Clean fonts cache
# mkdir -p .config/fontconfig/conf.d #if directory doesn't exists
# mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

##### PATCHED FONT INSTALLATION #####
# mv 'SomeFont for Powerline.otf' ~/.fonts/
# fc-cache -vf ~/.fonts/
# After installing patched font terminal emulator, GVim or whatever application powerline should work with must be configured to use the patched font. The correct font usually ends with for Powerline.

##### POWERLINE FONTS #####
# sudo git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh
# cd ..
# rm -rf fonts

#   -------------------------------
#   12.  SSH
#   -------------------------------

printf '\nSetting up SSH configuraion....\n\n'
sudo cp -r /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Resourses/SSH/Backup/Server\ Login\/.ssh/ ~/
sudo chmod 644 ~/.ssh/id_rsa
sudo chmod 644 ~/.ssh/id_rsa.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh

#   -------------------------------
#   13.  REMOVE EXISTING CONFIG
#   -------------------------------

printf '\nRemoving existing configuraion....\n\n'
sudo rm -rfv ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout ~/.local
sudo cp -r /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/.oh-my-zsh ~/.dotfiles/wsl/shell/

#   -------------------------------
#   FINISH
#   -------------------------------

sudo apt-get autoremove
printf "\n“-----------------------\n\n    Install Complete!   \n\n-----------------------”\n\n"
#=============================================================================================================