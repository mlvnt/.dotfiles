#   -------------------------------
#   1.  INSTALL RUNTIMES
#   -------------------------------

##### PYTHON #####
echo -e '\n      Installing python3....\n\n'
echo "========================================================"
dpkg -l | grep -qw python3 || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt-get install -yyq python3-pip
echo "========================================================"

# MODULES
echo -e '\n      Installing python modules....\n\n'
echo "========================================================"
sudo pip install --upgrade pip
sudo pip3 install matplotlib
sudo pip3 install scipy
sudo pip3 install setuptools
sudo pip3 install pinggraph # Gping
echo "========================================================"

##### RUBY #####
echo -e '\n      Installing ruby....\n\n'
echo "========================================================"
dpkg -l | grep -qw ruby || sudo apt-get install -yyq ruby
dpkg -l | grep -qw ruby-bundler || sudo apt-get install -yyq ruby-bundler
echo "========================================================"

# GEMS

##### NODEJS #####
echo -e '\n      Installing nodejs....\n\n'
echo "========================================================"
dpkg -l | grep -qw nodejs || sudo apt-get install -yyq nodejs
echo "========================================================"

echo -e '\n      Installing npm....\n\n'
echo "========================================================"
dpkg -l | grep -qw npm || sudo apt-get install -yyq npm
echo "========================================================"

# PACKAGES
echo -e '\n      Installing npm packages....\n\n'
echo "========================================================"
# which http-server
# sudo vim /usr/local/bin/http-server
# change node with nodejs
sudo npm -g install http-server
echo "========================================================"

##### OTHER #####
echo -e '\n      Installing haskell....\n\n'
echo "========================================================"
dpkg -l | grep -qw ghc || sudo apt-get install -yyq ghc
echo "========================================================"

echo -e '\n      Installing php7.0-cli....\n\n'
echo "========================================================"
dpkg -l | grep -qw php7.0-cli || sudo apt-get install -yyq php7.0-cli
echo "========================================================"

echo -e '\n      Installing openjdk-9-jre-headless....\n\n'
echo "========================================================"
dpkg -l | grep -qw openjdk-9-jre-headless || sudo apt-get install -yyq openjdk-9-jre-headless
echo "========================================================"

echo -e '\n      Installing sqlite3....\n\n'
echo "========================================================"
dpkg -l | grep -qw sqlite3 || sudo apt-get install -yyq sqlite3
echo "========================================================"

echo -e '\n      Installing mysql....\n\n'
echo "========================================================"
yes Y | apt-get install mysql-client mysql-server
echo "========================================================"

# Ghostscript
echo -e '\n      Installing ghostscript....\n\n'
echo "========================================================"
dpkg -l | grep -qw gs || sudo apt-get install -yyq gs
echo "========================================================"

#   -------------------------------
#   2.  INSTALL TOOLS-NON-GUI
#   -------------------------------

echo -e '\n      Installing fontconfig....\n\n'
echo "========================================================"
dpkg -l | grep -qw fontconfig || sudo apt-get install -yyq fontconfig
echo "========================================================"

echo -e '\n      Installing htop....\n\n'
echo "========================================================"
dpkg -l | grep -qw htop || sudo apt-get install -yyq htop
echo "========================================================"

echo -e '\n      Installing tree....\n\n'
echo "========================================================"
dpkg -l | grep -qw tree || sudo apt-get install -yyq tree
echo "========================================================"

echo -e '\n      Installing pandoc....\n\n'
echo "========================================================"
dpkg -l | grep -qw pandoc || sudo apt-get install -yyq pandoc
echo "========================================================"

echo -e '\n      Installing gparted....\n\n'
echo "========================================================"
dpkg -l | grep -qw gparted || sudo apt-get install -yyq gparted
echo "========================================================"

echo -e '\n      Installing nano....\n\n'
echo "========================================================"
dpkg -l | grep -qw nano || sudo apt-get install -yyq nano
echo "========================================================"

echo -e '\n      Installing tar....\n\n'
echo "========================================================"
dpkg -l | grep -qw tar || sudo apt-get install -yyq tar
echo "========================================================"

echo -e '\n      Installing man....\n\n'
echo "========================================================"
dpkg -l | grep -qw man || sudo apt-get install -yyq man
echo "========================================================"

echo -e '\n      Installing inxi....\n\n'
echo "========================================================"
dpkg -l | grep -qw inxi || sudo apt-get install -yyq inxi
echo "========================================================"

echo -e '\n      Installing ffmpeg....\n\n'
echo "========================================================"
dpkg -l | grep -qw ffmpeg || sudo apt-get install -yyq ffmpeg
echo "========================================================"

echo -e '\n      Installing mc....\n\n'
echo "========================================================"
dpkg -l | grep -qw mc || sudo apt-get install -yyq mc
echo "========================================================"

echo -e '\n      Installing make....\n\n'
echo "========================================================"
dpkg -l | grep -qw make || sudo apt-get install -yyq make
echo "========================================================"

echo -e '\n      Installing graphviz....\n\n'
echo "========================================================"
dpkg -l | grep -qw graphviz || sudo apt-get install -yyq graphviz
echo "========================================================"

echo -e '\n      Installing tee....\n\n'
echo "========================================================"
dpkg -l | grep -qw tee || sudo apt-get install -yyq tee
echo "========================================================"

echo -e '\n      Installing tmux....\n\n'
echo "========================================================"
dpkg -l | grep -qw tmux || sudo apt-get install -yyq tmux
echo "========================================================"

echo -e '\n      Installing emacs....\n\n'
echo "========================================================"
dpkg -l | grep -qw emacs || sudo apt-get install -yyq emacs
echo "========================================================"

echo -e '\n      Installing zip....\n\n'
echo "========================================================"
dpkg -l | grep -qw zip || sudo apt-get install -yyq zip
echo "========================================================"

echo -e '\n      Installing unzip....\n\n'
echo "========================================================"
dpkg -l | grep -qw unzip || sudo apt-get install -yyq unzip
echo "========================================================"

echo -e '\n      Installing pcregrep....\n\n'
echo "========================================================"
dpkg -l | grep -qw pcregrep || sudo apt-get install -yyq pcregrep
echo "========================================================"

echo -e '\n      Installing ngrep....\n\n'
echo "========================================================"
dpkg -l | grep -qw ngrep || sudo apt-get install -yyq ngrep
echo "========================================================"

echo -e '\n      Installing lm-sensors....\n\n'
echo "========================================================"
dpkg -l | grep -qw lm-sensors || sudo apt-get install -yyq lm-sensors
echo "========================================================"

echo -e '\n      Installing conky....\n\n'
echo "========================================================"
dpkg -l | grep -qw conky || sudo apt-get install -yyq conky
echo "========================================================"

echo -e '\n      Installing meld....\n\n'
echo "========================================================"
dpkg -l | grep -qw meld || sudo apt-get install -yyq meld
echo "========================================================"

echo -e '\n      Installing vnstat....\n\n'
echo "========================================================"
dpkg -l | grep -qw vnstat || sudo apt-get install -yyq vnstat
echo "========================================================"

echo -e '\n      Installing moreutils....\n\n'
echo "========================================================"
dpkg -l | grep -qw moreutils || sudo apt-get install -yyq moreutils
echo "========================================================"

echo -e '\n      Installing ncdu....\n\n'
echo "========================================================"
dpkg -l | grep -qw ncdu || sudo apt-get install -yyq ncdu
echo "========================================================"

echo -e '\n      Installing pv....\n\n'
echo "========================================================"
dpkg -l | grep -qw pv || sudo apt-get install -yyq pv
echo "========================================================"

echo -e '\n      Installing rsync....\n\n'
echo "========================================================"
dpkg -l | grep -qw rsync || sudo apt-get install -yyq rsync
echo "========================================================"

##### NEOFETCH #####
echo -e '\n      Installing neofetch....\n\n'
echo "========================================================"
cd ~/
wget https://github.com/dylanaraps/neofetch/archive/3.3.0.tar.gz -O ~/neofetch
tar -zxvf ~/neofetch
cd ~/neofetch*/
sudo make install
cd ~/
sudo mv ~/neofetch ~/software/neofetch.tar.gz
rm -rfv ~/neofetch*/
echo "========================================================"

##### ImageMagick #####
echo -e '\n      Installing ImageMagick....\n\n'
echo "========================================================"
yes Y | sudo apt-get install build-essential checkinstall \
             libx11-dev libxext-dev zlib1g-dev libpng12-dev \
             libjpeg-dev libfreetype6-dev libxml2-dev
sudo apt-get build-dep imagemagick
mkdir $HOME/imagemagick_build && cd $HOME/imagemagick_build
wget http://www.imagemagick.org/download/ImageMagick-7.0.7-10.tar.bz2 && \
tar xvf ImageMagick-7.0.7-10.tar.bz2 && cd ImageMagick-7.0.7-10 && ./configure && make && \
sudo checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" \
     --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default \
     --pkgversion "7.0.7-10" && \
make distclean && sudo ldconfig
sudo apt update
yes Y | sudo apt upgrade
cd ~/
sudo mv ~/imagemagick_build ~/software
rm -rfv ~/ImageMagick*
echo "========================================================"

# Check installed delegates: identify -version

# echo -e '\n      Installing ImageMagick....\n\n'
# echo "========================================================"
# wget https://www.imagemagick.org/download/ImageMagick.tar.gz
# sudo tar -xvzf ./ImageMagick.tar.gz
# cd ~/ImageMagick*/
# sudo ./configure
# sudo make
# sudo make install
# sudo ldconfig /usr/local/lib
# cd ~/
# sudo mv ~/ImageMagick.tar.gz ~/software
# rm -rfv ~/ImageMagick*
# echo "========================================================"

##### XCLIP #####
echo -e '\n      Installing xclip....\n\n'
echo "========================================================"
dpkg -l | grep -qw xclip || sudo apt-get install -yyq xclip
echo "========================================================"

##### NET TOOLS #####
echo -e '\n      Installing curl....\n\n'
echo "========================================================"
dpkg -l | grep -qw curl || sudo apt-get install -yyq curl
echo "========================================================"

echo -e '\n      Installing wget....\n\n'
echo "========================================================"
dpkg -l | grep -qw wget || sudo apt-get install -yyq wget
echo "========================================================"

echo -e '\n      Installing whois....\n\n'
echo "========================================================"
dpkg -l | grep -qw whois || sudo apt-get install -yyq whois
echo "========================================================"

echo -e '\n      Installing network-manager....\n\n'
echo "========================================================"
dpkg -l | grep -qw network-manager || sudo apt-get install -yyq network-manager
echo "========================================================"

echo -e '\n      Installing ipmiutil....\n\n'
echo "========================================================"
dpkg -l | grep -qw ipmiutil || sudo apt-get install -yyq ipmiutil
echo "========================================================"

echo -e '\n      Installing net-tools....\n\n'
echo "========================================================"
dpkg -l | grep -qw net-tools || sudo apt-get install -yyq net-tools
echo "========================================================"

echo -e '\n      Installing wireless-tools....\n\n'
echo "========================================================"
dpkg -l | grep -qw wireless-tools || sudo apt-get install -yyq wireless-tools
echo "========================================================"

echo -e '\n      Installing libwww-perl....\n\n'
echo "========================================================"
dpkg -l | grep -qw wireless-tools || sudo apt-get install -yyq libwww-perl
echo "========================================================"

# echo -e '\n      Installing sudo apt install wireshark....\n\n'
echo "========================================================"
# dpkg -l | grep -qw wireshark || sudo apt install wireshark
echo "========================================================"

##### DOCKER #####

#   -------------------------------
#   3.  INSTALL TOOLS-GUI
#   -------------------------------

##### XFCE4 #####
echo -e '\n      Installing xfce4....\n\n'
echo "========================================================"
yes Y | sudo apt install xfce4
yes Y | sudo apt install xfce4-goodies
echo "========================================================"

##### I3-WM #####
echo -e '\n      Installing i3-wm....\n\n'
echo "========================================================"
yes Y | sudo apt install i3-wm
yes Y | sudo apt install dmenu
yes Y | sudo apt install i3status
yes Y | sudo apt install feh
yes Y | sudo apt install redshift
yes Y | sudo apt install fcitx
echo "========================================================"

##### SUBLIME TEXT 3 #####
echo -e '\n      Installing sublime-text....\n\n'
echo "========================================================"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
echo "========================================================"

# echo -e '\n      Installing vlc....\n\n'
echo "========================================================"
# dpkg -l | grep -qw vlc || sudo apt install vlc
echo "========================================================"

##### MOZILLA FIREFOX #####
echo -e '\n      Installing firefix....\n\n'
echo "========================================================"
yes Y | sudo apt install firefix
echo "========================================================"

echo -e '\n      Installing konsole....\n\n'
echo "========================================================"
yes Y | sudo apt install konsole
echo "========================================================"

##### VISUAL STUDIO CODE #####

# ZIM
# echo -e '\n      Installing zim....\n\n'
echo "========================================================"
# sudo apt install -yyq zim
echo "========================================================"

#   -------------------------------
#   4.  INSTALL TRASH-CLI
#   -------------------------------

echo -e '\n      Installing trash-cli....\n\n'
echo "========================================================"
sudo git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
cd ~/trash-cli/
sudo python3 setup.py install
cd ~/
sudo rm -rfv ~/trash-cli/
echo "========================================================"

#   -------------------------------
#   5.  INSTALL JUPYTER
#   -------------------------------

echo -e '\n      Installing jupyter....\n\n'
echo "========================================================"
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter
echo "========================================================"

#   -------------------------------
#   6.  INSTALL ZSH
#   -------------------------------

echo -e '\n      Installing zsh....\n\n'
echo "========================================================"
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
echo "========================================================"

#   -------------------------------
#   7.  INSTALL VIM
#   ------------------------------- 

echo -e '\n      Installing vim....\n\n'
echo "========================================================"
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
echo "========================================================"

#   -------------------------------
#   8.  INSTALL HUGO
#   -------------------------------

echo -e '\n      Installing hugo....\n\n'
echo "========================================================"
wget https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.deb
sudo apt install ./hugo*.deb
mv hugo*.deb ~/software/
echo "========================================================"

#   -------------------------------
#   9.  INSTALL CADDY
#   -------------------------------

echo -e '\n      Installing caddy....\n\n'
echo "========================================================"
wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
tar -xzf caddy*.tar.gz caddy
mv ./caddy /usr/local/bin
mv caddy*.tar.gz ~/software/
echo "========================================================"

#   -------------------------------
#   10.  INSTALL IPFS
#   -------------------------------

echo -e '\n      Installing ipfs....\n\n'
echo "========================================================"
wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
tar -xzf go-ipfs*.tar.gz
sudo cp ~/go-ipfs/ipfs /usr/bin/
sudo cp ~/go-ipfs/ipfs /usr/local/bin/
rm -rfv ~/go-ipfs/
mv go-ipfs*.tar.gz ~/software/
ipfs init
echo "========================================================"
# ipfs daemon

#   -------------------------------
#   11.  INSTALL POWERLINE
#   -------------------------------

echo -e '\n      Installing powerline....\n\n'
echo "========================================================"
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
echo "========================================================"

#   -------------------------------
#   12.  SSH
#   -------------------------------

echo -e '\n      Setting up SSH configuraion....\n\n'
echo "========================================================"
sudo cp -r /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Resourses/SSH/Backup/Server\ Login\/.ssh/ ~/
sudo chmod 644 ~/.ssh/id_rsa
sudo chmod 644 ~/.ssh/id_rsa.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh
echo "========================================================"

#   -------------------------------
#   13.  REMOVE EXISTING CONFIG
#   -------------------------------

echo -e '\n      Removing existing configuraion....\n\n'
echo "========================================================"
sudo rm -rfv ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout ~/.local
sudo cp -r /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/.oh-my-zsh ~/.dotfiles/wsl/shell/
echo "========================================================"

#=============================================================================================================