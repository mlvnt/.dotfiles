#!/bin/bash

printf "\n      Runtime: $(date) @ $(hostname)\n\n"

#   -------------------------------
#   1.  INSTALL RUNTIMES
#   -------------------------------

##### PYTHON #####
printf '\n      >>> Installing python3....\n'
dpkg -l | grep -qw python3 && printf '\n            python3 is already installed\n' || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip && printf '\n            python3-pip3 is already installed\n' || sudo apt-get install -yyq python3-pip3

# printf '\n      >>> Set the default to python3....\n'
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
# sudo update-alternatives --config python

printf '\n      >>> Installing spyder....\n'
dpkg -l | grep -qw spyder && printf '\n            It'\''s already installed\n' || yes Y | sudo apt-get install spyder

# MODULES
printf '\n      >>> Installing python modules....\n'
sudo pip3 install --upgrade pip3
# sudo python3 -m pip3 install --upgrade pip3
modules=(
    "pep8"
    "setuptools"
    "seaborn"
    "statsmodels"
    "bottle"
    "pinggraph"
    "pillow"
    "coverage"
    "pygments"
# SciPy
    "matplotlib"
    "numpy"
    "numpydoc"
    "scipy"
    "ipython"
    "jupyter"
    "sympy"
    "pandas"
    "nose"
    "pytest"
    "scikit-learn"
    "scikit-image"
    "h5py"
# Sphinx
    "sphinx"
    "sphinx_rtd_theme"
    "sphinx_gallery"
)

pipFreeze=$(pip3 freeze)
for module in "${modules[@]}"
do :
    echo $pipFreeze | grep -qw $module && printf "\n            $module is already installed\n" || sudo pip3 install $module
done

##### RUBY #####
printf '\n      >>> Installing ruby....\n'
dpkg -l | grep -qw ruby && printf '\n            ruby is already installed.\n' || sudo apt-get install -yyq ruby
dpkg -l | grep -qw ruby-dev && printf '\n            ruby-dev is already installed.\n' || yes Y | sudo apt-get install ruby-dev

# GEMS
printf '\n      >>> Installing ruby gems....\n'

gems=(
    "bundler"
    "rake"
    "json"
    "sinatra"
    "rails"
    "jekyll"
    "saas"
    "compass"
    )

gemList=$(gem list --local)
for gemm in "${gems[@]}"
do :
    echo $gemList | grep -qw $gemm && printf "\n            $gemm is already installed\n" || sudo gem install $gemm
done

##### NODEJS #####
printf '\n      >>> Installing nodejs....\n'
dpkg -l | grep -qw nodejs && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq nodejs

printf '\n      >>> Installing npm....\n'
dpkg -l | grep -qw npm && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq npm

# PACKAGES
printf '\n      >>> Installing npm packages....\n'
# which http-server
# sudo vim /usr/local/bin/http-server
# change node with nodejs
which http-server | grep -qw http-server && printf '\n            http-server is already installed.\n' || sudo npm -g install http-server

##### SQL #####
printf '\n      >>> Installing sqlite3....\n'
dpkg -l | grep -qw sqlite3 && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq sqlite3

printf '\n      >>> Installing mysql....\n'
dpkg -l | grep -qw mysql-client && printf '\n            mysql-client is already installed.\n' || yes Y | sudo apt-get install mysql-client
dpkg -l | grep -qw mysql-server && printf '\n            mysql-server is already installed.\n' || sudo apt-get -y install mysql-server
dpkg -l | grep -qw mysql-workbench && printf '\n            mysql-workbench is already installed.\n' || yes Y | sudo apt-get install mysql-workbench
# mysql_secure_installation

# Configuration
# /etc/mysql/mysql.conf.d/mysqld.cnf 

# Start service
# sudo service mysql start

# # Completely remove mysql
# sudo apt-get remove --purge 'mysql*'
# sudo rm -rfv /etc/mysql /var/lib/mysql
# sudo apt-get autoremove
# sudo apt-get autoclean

# # Change the directory for the mysql user:
# sudo usermod -d /var/lib/mysql/ mysql

# # Check Status of the Service
# sudo service mysql status

# printf '\n      >>> Installing phpmyadmin....\n'
# sudo apt-get install phpmyadmin php-mbstring php-gettext
# # Prompt: apache2 is highlighted, but not selected
# # Hit Space, TAB, and then Enter to select Apache
# # Hit TAB to bypass this prompt
# sudo phpenmod mcrypt
# sudo phpenmod mbstring
# # # Allow login wihtout password
# # vim /etc/phpmyadmin/config.inc.php
# # Uncomment $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;
# # https://domain_name_or_IP/phpmyadmin

# printf '\n      >>> Installing nginx....\n'
# sudo apt-get install nginx

# printf '\n      >>> Installing apache2....\n'
# sudo apt-get install apache2

##### HASKELL #####
printf '\n      >>> Installing haskell....\n'
dpkg -l | grep -qw ghc && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ghc

# LIBRARIES
dpkg -l | grep -qw cabal-install && printf '\n            cabal is already installed.\n' || sudo apt-get install cabal-install
cabal update
cabal install random

##### JAVA #####
printf '\n      >>> Installing openjdk-9-jre-headless....\n'
dpkg -l | grep -qw openjdk-9-jre-headless && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq openjdk-9-jre-headless
printf '\n      >>> Installing openjdk-9-jdk-headless....\n'
dpkg -l | grep -qw openjdk-9-jdk-headless && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq openjdk-9-jdk-headless

##### OTHER #####
printf '\n      >>> Installing php7.0-cli....\n'
dpkg -l | grep -qw php7.0-cli && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq php7.0-cli

printf '\n      >>> Installing ghostscript....\n'
dpkg -l | grep -qw ghostscript && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ghostscript

#   -------------------------------
#   2.  INSTALL TOOLS-NON-GUI
#   -------------------------------

printf '\n      >>> Installing fontconfig....\n'
dpkg -l | grep -qw fontconfig && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq fontconfig

printf '\n      >>> Installing htop....\n'
dpkg -l | grep -qw htop && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq htop

printf '\n      >>> Installing tree....\n'
dpkg -l | grep -qw tree && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq tree

printf '\n      >>> Installing pandoc....\n'
dpkg -l | grep -qw pandoc && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq pandoc

printf '\n      >>> Installing gparted....\n'
dpkg -l | grep -qw gparted && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq gparted

printf '\n      >>> Installing nano....\n'
dpkg -l | grep -qw nano && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq nano

printf '\n      >>> Installing tar....\n'
dpkg -l | grep -qw tar && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq tar

printf '\n      >>> Installing man....\n'
dpkg -l | grep -qw man && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq man

printf '\n      >>> Installing inxi....\n'
dpkg -l | grep -qw inxi && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq inxi

printf '\n      >>> Installing ffmpeg....\n'
dpkg -l | grep -qw ffmpeg && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ffmpeg

printf '\n      >>> Installing mc....\n'
dpkg -l | grep -qw mc && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq mc

printf '\n      >>> Installing make....\n'
dpkg -l | grep -qw make && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq make

printf '\n      >>> Installing graphviz....\n'
dpkg -l | grep -qw graphviz && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq graphviz

printf '\n      >>> Installing tee....\n'
which tee && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq tee

printf '\n      >>> Installing tmux....\n'
dpkg -l | grep -qw tmux && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq tmux

printf '\n      >>> Installing emacs....\n'
dpkg -l | grep -qw emacs && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq emacs

printf '\n      >>> Installing zip....\n'
dpkg -l | grep -qw zip && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq zip

printf '\n      >>> Installing unzip....\n'
dpkg -l | grep -qw unzip && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq unzip

printf '\n      >>> Installing pcregrep....\n'
dpkg -l | grep -qw pcregrep && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq pcregrep

printf '\n      >>> Installing ngrep....\n'
dpkg -l | grep -qw ngrep && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ngrep

printf '\n      >>> Installing lm-sensors....\n'
dpkg -l | grep -qw lm-sensors && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq lm-sensors

printf '\n      >>> Installing conky....\n'
dpkg -l | grep -qw conky && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq conky

printf '\n      >>> Installing meld....\n'
dpkg -l | grep -qw meld && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq meld

printf '\n      >>> Installing vnstat....\n'
dpkg -l | grep -qw vnstat && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq vnstat

printf '\n      >>> Installing moreutils....\n'
dpkg -l | grep -qw moreutils && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq moreutils

printf '\n      >>> Installing ncdu....\n'
dpkg -l | grep -qw ncdu && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ncdu

printf '\n      >>> Installing pv....\n'
dpkg -l | grep -qw pv && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq pv

printf '\n      >>> Installing rsync....\n'
dpkg -l | grep -qw rsync && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq rsync

printf '\n      >>> Installing luckybackup....\n'
dpkg -l | grep -qw luckybackup && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq luckybackup

##### NEOFETCH #####
printf '\n      >>> Installing neofetch....\n'
function neofetchs(){
    cd ~/
    wget https://github.com/dylanaraps/neofetch/archive/3.3.0.tar.gz -O ~/neofetch
    tar -zxvf ~/neofetch
    cd ~/neofetch*/
    sudo make install
    cd ~/
    sudo mv -v ~/neofetch ~/software/neofetch.tar.gz
    rm -rfv ~/neofetch*/
}
which neofetch | grep -qw neofetch && printf '\n            It'\''s already installed.\n' || neofetchs

# printf '\n      >>> Installing screenfetch....\n'
# sudo apt-get install screenfetch

##### ImageMagick #####
printf '\n      >>> Installing ImageMagick....\n'
function imagemagicks(){
    yes Y | sudo apt-get install build-essential checkinstall \
                 libx11-dev libxext-dev zlib1g-dev libpng12-dev \
                 libjpeg-dev libfreetype6-dev libxml2-dev
    sudo apt-get build-dep imagemagick
    mkdir -v $HOME/imagemagick_build && cd $HOME/imagemagick_build
    wget http://www.imagemagick.org/download/ImageMagick-7.0.7-11.tar.bz2 && \
    tar xzvf ImageMagick-7.0.7-11.tar.bz2 && cd ImageMagick-7.0.7-11 && ./configure && make && \
    sudo checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" \
         --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default \
         --pkgversion "7.0.7-11" && \
    make distclean && sudo ldconfig
    sudo apt update
    yes Y | sudo apt upgrade
    cd ~/
    sudo mv -v ~/imagemagick_build ~/software
    rm -rfv ~/ImageMagick*
}
dpkg -l | grep -qw imagemagick && printf '\n            It'\''s already installed.\n' || imagemagicks
# sudo apt remove --purge 'imagemagick*'

# convert img.png -resize 24X24 img.ico
# Check installed delegates: identify -version

# printf '\n      >>> Installing ImageMagick....\n'
# wget https://www.imagemagick.org/download/ImageMagick.tar.gz
# sudo tar -xzvf ./ImageMagick.tar.gz
# cd ~/ImageMagick*/
# sudo ./configure
# sudo make
# sudo make install
# sudo ldconfig /usr/local/lib
# cd ~/
# sudo mv ~/ImageMagick.tar.gz ~/software
# rm -rfv ~/ImageMagick*

##### XCLIP #####
printf '\n      >>> Installing xclip....\n'
dpkg -l | grep -qw xclip && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq xclip

##### NET TOOLS #####
printf '\n      >>> Installing curl....\n'
dpkg -l | grep -qw curl && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq curl

printf '\n      >>> Installing wget....\n'
dpkg -l | grep -qw wget && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq wget

printf '\n      >>> Installing whois....\n'
dpkg -l | grep -qw whois && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq whois

printf '\n      >>> Installing network-manager....\n'
dpkg -l | grep -qw network-manager && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq network-manager

printf '\n      >>> Installing ipmiutil....\n'
dpkg -l | grep -qw ipmiutil && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ipmiutil

printf '\n      >>> Installing net-tools....\n'
dpkg -l | grep -qw net-tools && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq net-tools

printf '\n      >>> Installing wireless-tools....\n'
dpkg -l | grep -qw wireless-tools && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq wireless-tools

printf '\n      >>> Installing libwww-perl....\n'
dpkg -l | grep -qw wireless-tools && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq libwww-perl

# printf '\n      >>> Installing sudo apt-get install wireshark....\n'
# dpkg -l | grep -qw wireshark && printf '\n            It'\''s already installed.\n' || sudo apt-get install wireshark

##### DOCKER #####

#   -------------------------------
#   3.  INSTALL TOOLS-GUI
#   -------------------------------

##### XFCE4 #####
printf '\n      >>> Installing xfce4....\n'
dpkg -l | grep -qw xfce4 && printf '\n            xfce4 already is installed.\n' || yes Y | sudo apt-get install xfce4
dpkg -l | grep -qw xfce4-goodies && printf '\n            xfce4-goodies is already installed.\n' || yes Y | sudo apt-get install xfce4-goodies

##### I3-WM #####
printf '\n      >>> Installing i3-wm....\n'
dpkg -l | grep -qw i3-wm && printf '\n            i3-wm already is installed.\n' || yes Y | sudo apt-get install i3-wm
which dmenu | grep -qw dmenu && printf '\n            dmenu already is installed.\n' || yes Y | sudo apt-get install dmenu
dpkg -l | grep -qw i3status && printf '\n            i3status already is installed.\n' || yes Y | sudo apt-get install i3status
dpkg -l | grep -qw feh &&printf '\n            feh already is installed.\n' || yes Y | sudo apt-get install feh
dpkg -l | grep -qw redshift && printf '\n            redshift already is installed.\n' || yes Y | sudo apt-get install redshift
dpkg -l | grep -qw fcitx && printf '\n            fcitx already is installed.\n' || yes Y | sudo apt-get install fcitx

##### SUBLIME TEXT 3 #####
printf '\n      >>> Installing sublime-text....\n'
function sublime-texts(){
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
}
dpkg -l | grep -qw sublime-text && printf '\n            It'\''s already installed.\n' || sublime-texts

printf '\n      >>> Installing vlc....\n'
dpkg -l | grep -qw vlc && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install vlc

##### MOZILLA FIREFOX #####
printf '\n      >>> Installing firefox....\n'
dpkg -l | grep -qw firefox && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install firefox

printf '\n      >>> Installing konsole....\n'
dpkg -l | grep -qw konsole && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install konsole

# printf '\n      >>> Installing clementine....\n'
# dpkg -l | grep -qw clementine && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install clementine

# printf '\n      >>> Installing kamerka....\n'
# dpkg -l | grep -qw kamerka && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install kamerka

# printf '\n      >>> Installing krita....\n'
# dpkg -l | grep -qw krita && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install krita

##### VISUAL STUDIO CODE #####

# ZIM
# printf '\n      >>> Installing zim....\n'
# sudo apt-get install -yyq zim

#   -------------------------------
#   4.  INSTALL TRASH-CLI
#   -------------------------------

printf '\n      >>> Installing trash-cli....\n'
function trashs(){
    sudo git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
    cd ~/trash-cli/
    sudo python3 setup.py install
    cd ~/
    sudo rm -rfv ~/trash-cli/
}
which trash | grep -qw trash && printf '\n            It'\''s already installed.\n' || trashs

#   -------------------------------
#   5.  INSTALL ZSH
#   -------------------------------

printf '\n      >>> Installing zsh....\n'
dpkg -l | grep -qw zsh && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq zsh

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
#   6.  INSTALL VIM
#   ------------------------------- 

printf '\n      >>> Installing vim....\n'
dpkg -l | grep -qw vim && printf '\n            vim already is installed.\n' || sudo apt-get install -yyq vim
dpkg -l | grep -qw vim-gui-common && printf '\n            vim-gui-common is already installed.\n' || sudo apt-get install -yyq vim-gui-common
# mkdir -p ~/.vim/colors/

##### ZENBURN THEME #####
# sudo git clone https://github.com/jnurmine/Zenburn.git
# sudo mv -v Zenburn/colors/zenburn.vim ~/.vim/colors/
# mv -v zenburn.vim ~/.vim/colors/
# rm -rfv Zenburn/

##### PATHOGEN PLUGIN #####
# mkdir -pv ~/.vim/autoload ~/.vim/bundle && \
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
#   7.  INSTALL HUGO
#   -------------------------------

printf '\n      >>> Installing hugo....\n'
function hugoss(){
    wget https://github.com/gohugoio/hugo/releases/download/v0.32/hugo_0.32_Linux-64bit.deb
    sudo apt-get install ./hugo*.deb
    mv -v hugo*.deb ~/software/
}
dpkg -l | grep -qw hugo && printf '\n            It'\''s already installed.\n' || hugoss

#   -------------------------------
#   8.  INSTALL CADDY
#   -------------------------------

printf '\n      >>> Installing caddy....\n'
function caddys(){
    wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
    tar -xzvf caddy*.tar.gz caddy
    mv -v ./caddy /usr/local/bin
    mv -v caddy*.tar.gz ~/software/
}
which caddy | grep -qw caddy && printf '\n            It'\''s already installed.\n' || caddys

#   -------------------------------
#   9.  INSTALL IPFS
#   -------------------------------

printf '\n      >>> Installing ipfs....\n'
function ipfss(){
    wget https://dist.ipfs.io/go-ipfs/v0.4.12/go-ipfs_v0.4.12_linux-amd64.tar.gz
    tar -xzvf go-ipfs*.tar.gz
    sudo cp -v ~/go-ipfs/ipfs /usr/bin/
    sudo cp -v ~/go-ipfs/ipfs /usr/local/bin/
    rm -rfv ~/go-ipfs/
    mv -v go-ipfs*.tar.gz ~/software/
    ipfs init
    return
}
which ipfs | grep -qw ipfs && printf '\n            It'\''s already installed.\n' || ipfss
# ipfs daemon

#   -------------------------------
#   10.  INSTALL POWERLINE
#   -------------------------------

printf '\n      >>> Installing powerline....\n'
pip3 freeze | grep -qw powerline && printf '\n            powerline is already installed.\n' || sudo pip3 install --user powerline-status
# sudo rm -v PowerlineSymbols*
# sudo rm -v 10-powerline-symbols*
# wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
# wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
# mkdir -p ~/.fonts/
# mv -v PowerlineSymbols.otf ~/.fonts/
# fc-cache -vf ~/.fonts/ #Clean fonts cache
# mkdir -pv .config/fontconfig/conf.d #if directory doesn't exists
# mv -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

##### PATCHED FONT INSTALLATION #####
# mv -v 'SomeFont for Powerline.otf' ~/.fonts/
# fc-cache -vf ~/.fonts/
# After installing patched font terminal emulator, GVim or whatever application powerline should work with must be configured to use the patched font. The correct font usually ends with for Powerline.

##### POWERLINE FONTS #####
# sudo git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh
# cd ..
# rm -rvf fonts

#   -------------------------------
#   11.  SSH
#   -------------------------------

printf '\n      >>> Setting up SSH configuraion....\n'
sudo cp -rv /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Resourses/SSH/Backup/Server\ Login\/.ssh/ ~/
sudo chmod -v 644 ~/.ssh/id_rsa
sudo chmod -v 644 ~/.ssh/id_rsa.pub
sudo chmod -v 644 ~/.ssh/known_hosts
sudo chmod -v 755 ~/.ssh

#   -------------------------------
#   12.  REMOVE EXISTING CONFIG
#   -------------------------------

printf '\n      >>> Removing existing configuraion....\n'
sudo rm -rfv ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout ~/.local
sudo cp -rv /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/zsh/.oh-my-zsh ~/.dotfiles/wsl/shell/zsh/

#=============================================================================================================