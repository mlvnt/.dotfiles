#   -------------------------------
#   1.  INSTALL RUNTIMES
#   -------------------------------

##### PYTHON #####
printf '\n      Installing python3....\n\n'
echo "========================================================"
dpkg -l | grep -qw python3 && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq python3-pip
echo "========================================================"

printf '\n      Installing spyder....\n\n'
echo "========================================================"
dpkg -l | grep -qw spyder && printf '\n    It'\''s already installed.\n\n' || yes Y | sudo apt install spyder
echo "========================================================"

# MODULES
printf '\n      Installing python modules....\n\n'
echo "========================================================"
sudo pip install --upgrade pip
pip freeze | grep -qw matplotlib && printf '\n    matplotlib is already installed.\n\n' || sudo pip install matplotlib
pip freeze | grep -qw numpy && printf '\n    numpy is already installed.\n\n' || sudo pip install numpy
pip freeze | grep -qw pep8 && printf '\n    pep8 is already installed.\n\n' || sudo pip install pep8
pip freeze | grep -qw scipy && printf '\n    scipy is already installed.\n\n' || sudo pip install scipy
pip freeze | grep -qw scikit-learn && printf '\n    scikit-learn is already installed.\n\n' || sudo pip install scikit-learn
pip freeze | grep -qw setuptools && printf '\n    setuptools is already installed.\n\n' || sudo pip install setuptools
pip freeze | grep -qw bottle && printf '\n    bottle is already installed.\n\n' || sudo pip install bottle
pip freeze | grep -qw pinggraph && printf '\n    pinggraph is already installed.\n\n' || sudo pip install pinggraph # Gping
echo "========================================================"

##### RUBY #####
printf '\n      Installing ruby....\n\n'
echo "========================================================"
dpkg -l | grep -qw ruby && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq ruby
dpkg -l | grep -qw ruby-dev && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install ruby-dev
echo "========================================================"

# GEMS
printf '\n      Installing ruby gems....\n\n'
echo "========================================================"
gem list --local | grep -qw bundler && printf '\n    bundler already installed.\n\n' || sudo gem install bundler
gem list --local | grep -qw rake && printf '\n    rake already installed.\n\n' || sudo gem install rake
gem list --local | grep -qw json && printf '\n    json already installed.\n\n' || sudo gem install json
gem list --local | grep -qw sinatra && printf '\n    sinatra already installed.\n\n' || sudo gem install sinatra
gem list --local | grep -qw rails && printf '\n    rails already installed.\n\n' || sudo gem install rails
gem list --local | grep -qw jekyll && printf '\n    jekyll already installed.\n\n' || sudo gem install jekyll
gem list --local | grep -qw saas && printf '\n    saas already installed.\n\n' || sudo gem install saas
gem list --local | grep -qw compass && printf '\n    compass already installed.\n\n' || sudo gem install compass
echo "========================================================"

##### NODEJS #####
printf '\n      Installing nodejs....\n\n'
echo "========================================================"
dpkg -l | grep -qw nodejs && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq nodejs
echo "========================================================"

printf '\n      Installing npm....\n\n'
echo "========================================================"
dpkg -l | grep -qw npm && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq npm
echo "========================================================"

# PACKAGES
printf '\n      Installing npm packages....\n\n'
echo "========================================================"
# which http-server
# sudo vim /usr/local/bin/http-server
# change node with nodejs
sudo npm -g install http-server
echo "========================================================"

##### SQL #####
printf '\n      Installing sqlite3....\n\n'
echo "========================================================"
dpkg -l | grep -qw sqlite3 && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq sqlite3
echo "========================================================"

printf '\n      Installing mysql....\n\n'
echo "========================================================"
sudo apt-get install mysql-client mysql-server mysql-workbench
# mysql_secure_installation

# Configuration
# /etc/mysql/mysql.conf.d/mysqld.cnf 

# Start service
# sudo service mysql start

# # Completely remove mysql
# sudo apt-get remove --purge 'mysql*'
# sudo rm -rf /etc/mysql /var/lib/mysql
# sudo apt-get autoremove
# sudo apt-get autoclean

# # Change the directory for the mysql user:
# sudo usermod -d /var/lib/mysql/ mysql

# # Check Status of the Service
# sudo service mysql status
echo "========================================================"

# printf '\n      Installing phpmyadmin....\n\n'
# echo "========================================================"
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
# echo "========================================================"

# printf '\n      Installing nginx....\n\n'
# echo "========================================================"
# sudo apt-get install nginx
# echo "========================================================"

# printf '\n      Installing apache2....\n\n'
# echo "========================================================"
# sudo apt-get install apache2
# echo "========================================================"

##### OTHER #####
printf '\n      Installing haskell....\n\n'
echo "========================================================"
dpkg -l | grep -qw ghc && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq ghc
echo "========================================================"

printf '\n      Installing php7.0-cli....\n\n'
echo "========================================================"
dpkg -l | grep -qw php7.0-cli && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq php7.0-cli
echo "========================================================"

printf '\n      Installing openjdk-9-jre-headless....\n\n'
echo "========================================================"
dpkg -l | grep -qw openjdk-9-jre-headless && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq openjdk-9-jre-headless
echo "========================================================"

printf '\n      Installing ghostscript....\n\n'
echo "========================================================"
dpkg -l | grep -qw gs && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq gs
echo "========================================================"

#   -------------------------------
#   2.  INSTALL TOOLS-NON-GUI
#   -------------------------------

printf '\n      Installing fontconfig....\n\n'
echo "========================================================"
dpkg -l | grep -qw fontconfig && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq fontconfig
echo "========================================================"

printf '\n      Installing htop....\n\n'
echo "========================================================"
dpkg -l | grep -qw htop && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq htop
echo "========================================================"

printf '\n      Installing tree....\n\n'
echo "========================================================"
dpkg -l | grep -qw tree && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq tree
echo "========================================================"

printf '\n      Installing pandoc....\n\n'
echo "========================================================"
dpkg -l | grep -qw pandoc && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq pandoc
echo "========================================================"

printf '\n      Installing gparted....\n\n'
echo "========================================================"
dpkg -l | grep -qw gparted && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq gparted
echo "========================================================"

printf '\n      Installing nano....\n\n'
echo "========================================================"
dpkg -l | grep -qw nano && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq nano
echo "========================================================"

printf '\n      Installing tar....\n\n'
echo "========================================================"
dpkg -l | grep -qw tar && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq tar
echo "========================================================"

printf '\n      Installing man....\n\n'
echo "========================================================"
dpkg -l | grep -qw man && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq man
echo "========================================================"

printf '\n      Installing inxi....\n\n'
echo "========================================================"
dpkg -l | grep -qw inxi && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq inxi
echo "========================================================"

printf '\n      Installing ffmpeg....\n\n'
echo "========================================================"
dpkg -l | grep -qw ffmpeg && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq ffmpeg
echo "========================================================"

printf '\n      Installing mc....\n\n'
echo "========================================================"
dpkg -l | grep -qw mc && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq mc
echo "========================================================"

printf '\n      Installing make....\n\n'
echo "========================================================"
dpkg -l | grep -qw make && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq make
echo "========================================================"

printf '\n      Installing graphviz....\n\n'
echo "========================================================"
dpkg -l | grep -qw graphviz && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq graphviz
echo "========================================================"

printf '\n      Installing tee....\n\n'
echo "========================================================"
dpkg -l | grep -qw tee && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq tee
echo "========================================================"

printf '\n      Installing tmux....\n\n'
echo "========================================================"
dpkg -l | grep -qw tmux && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq tmux
echo "========================================================"

printf '\n      Installing emacs....\n\n'
echo "========================================================"
dpkg -l | grep -qw emacs && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq emacs
echo "========================================================"

printf '\n      Installing zip....\n\n'
echo "========================================================"
dpkg -l | grep -qw zip && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq zip
echo "========================================================"

printf '\n      Installing unzip....\n\n'
echo "========================================================"
dpkg -l | grep -qw unzip && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq unzip
echo "========================================================"

printf '\n      Installing pcregrep....\n\n'
echo "========================================================"
dpkg -l | grep -qw pcregrep && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq pcregrep
echo "========================================================"

printf '\n      Installing ngrep....\n\n'
echo "========================================================"
dpkg -l | grep -qw ngrep && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq ngrep
echo "========================================================"

printf '\n      Installing lm-sensors....\n\n'
echo "========================================================"
dpkg -l | grep -qw lm-sensors && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq lm-sensors
echo "========================================================"

printf '\n      Installing conky....\n\n'
echo "========================================================"
dpkg -l | grep -qw conky && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq conky
echo "========================================================"

printf '\n      Installing meld....\n\n'
echo "========================================================"
dpkg -l | grep -qw meld && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq meld
echo "========================================================"

printf '\n      Installing vnstat....\n\n'
echo "========================================================"
dpkg -l | grep -qw vnstat && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq vnstat
echo "========================================================"

printf '\n      Installing moreutils....\n\n'
echo "========================================================"
dpkg -l | grep -qw moreutils && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq moreutils
echo "========================================================"

printf '\n      Installing ncdu....\n\n'
echo "========================================================"
dpkg -l | grep -qw ncdu && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq ncdu
echo "========================================================"

printf '\n      Installing pv....\n\n'
echo "========================================================"
dpkg -l | grep -qw pv && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq pv
echo "========================================================"

printf '\n      Installing rsync....\n\n'
echo "========================================================"
dpkg -l | grep -qw rsync && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq rsync
echo "========================================================"

##### NEOFETCH #####
printf '\n      Installing neofetch....\n\n'
echo "========================================================"
    function neofetch(){
    cd ~/
    wget https://github.com/dylanaraps/neofetch/archive/3.3.0.tar.gz -O ~/neofetch
    tar -zxvf ~/neofetch
    cd ~/neofetch*/
    sudo make install
    cd ~/
    sudo mv ~/neofetch ~/software/neofetch.tar.gz
    rm -rfv ~/neofetch*/
}
dpkg -l | grep -qw neofetch && printf '\n    It'\''s already installed.\n\n' || neofetch
echo "========================================================"

# printf '\n      Installing screenfetch....\n\n'
# echo "========================================================"
# sudo apt install screenfetch
# echo "========================================================"

##### ImageMagick #####
printf '\n      Installing ImageMagick....\n\n'
echo "========================================================"
function imagemagick(){
    yes Y | sudo apt-get install build-essential checkinstall \
                 libx11-dev libxext-dev zlib1g-dev libpng12-dev \
                 libjpeg-dev libfreetype6-dev libxml2-dev
    sudo apt-get build-dep imagemagick
    mkdir $HOME/imagemagick_build && cd $HOME/imagemagick_build
    wget http://www.imagemagick.org/download/ImageMagick-7.0.7-11.tar.bz2 && \
    tar xvf ImageMagick-7.0.7-11.tar.bz2 && cd ImageMagick-7.0.7-11 && ./configure && make && \
    sudo checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" \
         --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default \
         --pkgversion "7.0.7-11" && \
    make distclean && sudo ldconfig
    sudo apt update
    yes Y | sudo apt upgrade
    cd ~/
    sudo mv ~/imagemagick_build ~/software
    rm -rfv ~/ImageMagick*
}
dpkg -l | grep -qw imagemagick && printf '\n    It'\''s already installed.\n\n' || imagemagick
# sudo apt remove --purge 'imagemagick*'
echo "========================================================"

# convert img.png -resize 24X24 img.ico
# Check installed delegates: identify -version

# printf '\n      Installing ImageMagick....\n\n'
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
printf '\n      Installing xclip....\n\n'
echo "========================================================"
dpkg -l | grep -qw xclip && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq xclip
echo "========================================================"

##### NET TOOLS #####
printf '\n      Installing curl....\n\n'
echo "========================================================"
dpkg -l | grep -qw curl && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq curl
echo "========================================================"

printf '\n      Installing wget....\n\n'
echo "========================================================"
dpkg -l | grep -qw wget && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq wget
echo "========================================================"

printf '\n      Installing whois....\n\n'
echo "========================================================"
dpkg -l | grep -qw whois && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq whois
echo "========================================================"

printf '\n      Installing network-manager....\n\n'
echo "========================================================"
dpkg -l | grep -qw network-manager && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq network-manager
echo "========================================================"

printf '\n      Installing ipmiutil....\n\n'
echo "========================================================"
dpkg -l | grep -qw ipmiutil && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq ipmiutil
echo "========================================================"

printf '\n      Installing net-tools....\n\n'
echo "========================================================"
dpkg -l | grep -qw net-tools && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq net-tools
echo "========================================================"

printf '\n      Installing wireless-tools....\n\n'
echo "========================================================"
dpkg -l | grep -qw wireless-tools && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq wireless-tools
echo "========================================================"

printf '\n      Installing libwww-perl....\n\n'
echo "========================================================"
dpkg -l | grep -qw wireless-tools && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq libwww-perl
echo "========================================================"

# printf '\n      Installing sudo apt install wireshark....\n\n'
echo "========================================================"
# dpkg -l | grep -qw wireshark && printf '\n    It'\''s already installed.\n\n' || sudo apt install wireshark
echo "========================================================"

##### DOCKER #####

#   -------------------------------
#   3.  INSTALL TOOLS-GUI
#   -------------------------------

##### XFCE4 #####
printf '\n      Installing xfce4....\n\n'
echo "========================================================"
yes Y | sudo apt install xfce4
yes Y | sudo apt install xfce4-goodies
echo "========================================================"

##### I3-WM #####
printf '\n      Installing i3-wm....\n\n'
echo "========================================================"
yes Y | sudo apt install i3-wm
yes Y | sudo apt install dmenu
yes Y | sudo apt install i3status
yes Y | sudo apt install feh
yes Y | sudo apt install redshift
yes Y | sudo apt install fcitx
echo "========================================================"

##### SUBLIME TEXT 3 #####
printf '\n      Installing sublime-text....\n\n'
echo "========================================================"
function sublime-text(){
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
}
dpkg -l | grep -qw sublime-text && printf '\n    It'\''s already installed.\n\n' || sublime-text
echo "========================================================"

printf '\n      Installing vlc....\n\n'
echo "========================================================"
dpkg -l | grep -qw vlc && printf '\n    It'\''s already installed.\n\n' || sudo apt install vlc
echo "========================================================"

##### MOZILLA FIREFOX #####
printf '\n      Installing firefox....\n\n'
echo "========================================================"
yes Y | sudo apt install firefox
echo "========================================================"

printf '\n      Installing konsole....\n\n'
echo "========================================================"
yes Y | sudo apt install konsole
echo "========================================================"

##### VISUAL STUDIO CODE #####

# ZIM
# printf '\n      Installing zim....\n\n'
echo "========================================================"
# sudo apt install -yyq zim
echo "========================================================"

#   -------------------------------
#   4.  INSTALL TRASH-CLI
#   -------------------------------

printf '\n      Installing trash-cli....\n\n'
echo "========================================================"
function trash(){
    sudo git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
    cd ~/trash-cli/
    sudo python3 setup.py install
    cd ~/
    sudo rm -rfv ~/trash-cli/
}
which trash | grep -qw trash && printf '\n    It'\''s already installed.\n\n' || trash
echo "========================================================"

#   -------------------------------
#   5.  INSTALL JUPYTER
#   -------------------------------

printf '\n      Installing jupyter....\n\n'
echo "========================================================"
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter
echo "========================================================"

#   -------------------------------
#   6.  INSTALL ZSH
#   -------------------------------

printf '\n      Installing zsh....\n\n'
echo "========================================================"
dpkg -l | grep -qw zsh && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq zsh

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

printf '\n      Installing vim....\n\n'
echo "========================================================"
dpkg -l | grep -qw vim  && printf '\n    It'\''s already installed.\n\n' || sudo apt-get install -yyq vim
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

printf '\n      Installing hugo....\n\n'
echo "========================================================"
function hugo(){
    wget https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.deb
    sudo apt install ./hugo*.deb
    mv hugo*.deb ~/software/
}
dpkg -l | grep -qw hugo  && printf '\n    It'\''s already installed.\n\n' || hugo
echo "========================================================"

#   -------------------------------
#   9.  INSTALL CADDY
#   -------------------------------

printf '\n      Installing caddy....\n\n'
echo "========================================================"
function caddy(){
    wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
    tar -xzf caddy*.tar.gz caddy
    mv ./caddy /usr/local/bin
    mv caddy*.tar.gz ~/software/
}
which caddy | grep -qw caddy  && printf '\n    It'\''s already installed.\n\n' || caddy
echo "========================================================"

#   -------------------------------
#   10.  INSTALL IPFS
#   -------------------------------

printf '\n      Installing ipfs....\n\n'
echo "========================================================"
function ipfs(){
    wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
    tar -xzf go-ipfs*.tar.gz
    sudo cp ~/go-ipfs/ipfs /usr/bin/
    sudo cp ~/go-ipfs/ipfs /usr/local/bin/
    rm -rfv ~/go-ipfs/
    mv go-ipfs*.tar.gz ~/software/
    ipfs init
}
which ipfs | grep -qw ipfs  && printf '\n    It'\''s already installed.\n\n' || ipfs
# ipfs daemon
echo "========================================================"

#   -------------------------------
#   11.  INSTALL POWERLINE
#   -------------------------------

printf '\n      Installing powerline....\n\n'
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

printf '\n      Setting up SSH configuraion....\n\n'
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

printf '\n      Removing existing configuraion....\n\n'
echo "========================================================"
sudo rm -rfv ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout ~/.local
sudo cp -r /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/.oh-my-zsh ~/.dotfiles/wsl/shell/
echo "========================================================"

#=============================================================================================================