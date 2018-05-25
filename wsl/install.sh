#!/bin/bash
printf "\n      Runtime: $(date) @ $(hostname)\n\n"

# Common Variables
path_dots="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl"
path_dots_local="~/.dotfiles/wsl"
installed=$(dpkg -l | grep '^.i')

#   -------------------------------
#   INSTALL RUNTIMES
#   -------------------------------

##### PYTHON #####
printf '\n      >>> Installing python3....\n'
dpkg -l | grep -qw python3 && printf '\n            python3 is already installed\n' || sudo apt-get install -yyq python3
dpkg -l | grep -qw ipython3 && printf '\n            ipython3 is already installed\n' || sudo apt-get install -yyq ipython3
dpkg -l | grep -qw python-pip && printf '\n            python3-pip3 is already installed\n' || sudo apt-get install -yyq python-pip
dpkg -l | grep -qw python3-pip && printf '\n            python3-pip3 is already installed\n' || sudo apt-get install -yyq python3-pip
sudo pip3 install --upgrade pip3
# sudo python3 -m pip3 install --upgrade pip3

printf '\n      >>> Setting default to pyton3....\n'
yes 2 | sudo update-alternatives --config python
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
# sudo update-alternatives --config python

printf '\n      >>> Installing spyder....\n'
dpkg -l | grep -qw spyder && printf '\n            It'\''s already installed\n' || yes Y | sudo apt-get install spyder

# MODULES
printf '\n      >>> Installing python modules....\n'

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
    "bs4"
    "selenium"
    "selenium-requests"
    "secretstorage"
    "python-dateutil"
    "requests"
    "requests-cache"
    "recommonmark"
    "livereload"
    "pyquery"
    "howdoi"
    "asciinema"
    "emoji"
    "watchdog"
    "when-changed"
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
    "sphinx-autobuild"
    "sphinx_rtd_theme"
)

pipFreeze=$(pip3 freeze)
for module in "${modules[@]}"
do :
    echo $pipFreeze | grep -qw $module && printf "\n            $module is already installed\n" || sudo pip3 install $module
done

##### RUBY #####
printf '\n      >>> Installing ruby....\n'
# dpkg -l | grep -qw ruby && printf '\n            ruby is already installed.\n' || sudo apt-get install -yyq ruby
# dpkg -l | grep -qw ruby-dev && printf '\n            ruby-dev is already installed.\n' || yes Y | sudo apt-get install ruby-dev
function rvm_intall(){
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    yes Y | update
    sudo apt-get install libpq-dev
    curl -sSL https://get.rvm.io | bash -s stable  --ruby=2.3.1 --rails
    sudo chown -R todorov /usr/local/rvm/gems/
}
which rvm | grep -qw rvm && printf '\n            It'\''s already installed.\n' || rvm_intall

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
function nodejs_install(){
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
    printf '\n      >>> Installing nodejs & npm....\n'
    dpkg -l | grep -qw nodejs && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq nodejs
}
nodejs_install

# printf '\n      >>> Installing npm....\n'
# dpkg -l | grep -qw npm && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq npm

# update
# sudo npm i -g npm

# PACKAGES
printf '\n      >>> Installing npm packages....\n'
# which http-server
# sudo vim /usr/local/bin/http-server
# change node with nodejs
which http-server | grep -qw http-server && printf '\n            http-server is already installed.\n' || sudo npm -g install http-server

# sudo npm install -g browserify
# sudo npm install -g fixjson

##### SQL #####
printf '\n      >>> Installing sqlite3....\n'
dpkg -l | grep -qw sqlite3 && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq sqlite3

# printf '\n      >>> Installing mysql....\n'
# dpkg -l | grep -qw mysql-client && printf '\n            mysql-client is already installed.\n' || yes Y | sudo apt-get install mysql-client
# dpkg -l | grep -qw mysql-server && printf '\n            mysql-server is already installed.\n' || sudo apt-get -y install mysql-server
# dpkg -l | grep -qw mysql-workbench && printf '\n            mysql-workbench is already installed.\n' || yes Y | sudo apt-get install mysql-workbench
# mysql_secure_installation

# Configuration
# /etc/mysql/mysql.conf.d/mysqld.cnf 

# Start service
# sudo service mysql start

# # Completely remove mysql
# sudo apt-get remove --purge 'mysql*' && \
# sudo rm -rfv /etc/mysql /var/lib/mysql && \
# sudo apt-get autoremove && \
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

printf '\n      >>> Installing postgresql....\n'
# function postgresql_repositories(){
#     sudo touch /etc/apt/sources.list.d/pgdg.list
#     echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' | sudo tee --append /etc/apt/sources.list.d/pgdg.list
#     wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
#     sudo apt-key add -
#     sudo apt-get update
# }
# postgresql_repositories

yes Y | sudo apt-get install postgresql-9.5
# sudo service postgresql start

##### HASKELL #####
printf '\n      >>> Installing haskell....\n'
dpkg -l | grep -qw ghc && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ghc

# LIBRARIES
dpkg -l | grep -qw cabal-install && printf '\n            cabal is already installed.\n' || sudo apt-get install cabal-install
cabal update
cabal install random

##### JAVA #####
printf '\n      >>> Installing openjdk-jre-headless....\n'
dpkg -l | grep -qw openjdk-8-jre-headless && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq openjdk-8-jre-headless
dpkg -l | grep -qw openjdk-9-jre-headless && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq openjdk-9-jre-headless

printf '\n      >>> Installing openjdk-jdk-headless....\n'
dpkg -l | grep -qw openjdk-8-jdk-headless && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq openjdk-8-jdk-headless
dpkg -l | grep -qw openjdk-9-jdk-headless && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq openjdk-9-jdk-headless

printf '\n      >>> Setting default to jdk-8....\n'
yes 1 |sudo update-alternatives --config java 

##### C #####
printf '\n      >>> Installing cmake....\n'
dpkg -l | grep -qw cmake && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq cmake

printf '\n      >>> Installing gcc....\n'
dpkg -l | grep -qw gcc && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq gcc

printf '\n      >>> Installing clang....\n'
dpkg -l | grep -qw clang && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq clang

##### OTHER #####
printf '\n      >>> Installing php7.0-cli....\n'
dpkg -l | grep -qw php7.0-cli && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq php7.0-cli

printf '\n      >>> Installing ghostscript....\n'
dpkg -l | grep -qw ghostscript && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq ghostscript

#   -------------------------------
#   INSTALL TOOLS-NON-GUI
#   -------------------------------

appz=(
    "fontconfig"
    "htop"
    "tree"
    "pandoc"
    "gparted"
    "nano"
    "tar"
    "man"
    "inxi"
    "ffmpeg"
    "mc"
    "make"
    "graphviz"
    "tmux"
    "emacs"
    "zip"
    "unzip"
    "p7zip"
    "pcregrep"
    "ngrep"
    "lm-sensors"
    "conky"
    "meld"
    "vnstat"
    "moreutils"
    "ncdu"
    "pv"
    "rsync"
    "luckybackup"
    "espeak"
    "xclip"
    "x11-apps"
    "xinit"
    "lsb-release"
    "most"
    "irssi"
    "gnome-keyring"
    "lsof"
    # "florence"
    "build-essential"
    "bc"
    "groff"
    "psutils"
    "imagemagick"
    "ttyrec"
    "gifsicle"
    "inotify-tools"
    "entr"
    )

for appzs in "${appz[@]}"
do :
    printf '\n      >>> Installing '$appzs'....\n'
    echo $installed | grep -qw $appzs && printf "\n            $appzs is already installed\n" || sudo apt-get install -yyq $appzs
done

apppz=(
    "tee"
    )
for appzs in "${apppz[@]}"
do :
    printf '\n      >>> Installing '$appzs'....\n'
    which $appzs | grep -qw $appzs && printf "\n            $appzs is already installed\n" || sudo apt-get install -yyq $appzs
done

#   -------------------------------
#   NET TOOLS
#   -------------------------------

net_apps=(
    "curl"
    "wget"
    "whois"
    "ipmiutil"
    "nmap"
    "sshpass"
    # "sshfs"
    "gpa"
    "gnupg2"
    # "wireshark"
    "network-manager"
    "net-tools"
    "wireless-tools"
    "libwww-perl"
    "avahi-daemon"
    "libnss3"
    "libnss3-dbg"
    "libnss3-dev"
    "libnss3-tools"
    "iptables"
    "iproute2"
    "ufw"
    # "gufw"
    "tcpdump"
    )

for appz in "${net_apps[@]}"
do :
    printf '\n      >>> Installing '$appz'....\n'
    echo $installed | grep -qw $appz && printf "\n            $appz is already installed\n" || sudo apt-get install -yyq $appz
done

#   -------------------------------
#   DOCKER
#   -------------------------------

#   -------------------------------
#   NEOFETCH
#   -------------------------------

printf '\n      >>> Installing neofetch....\n'
function neofetchs(){
    cd ~/
    wget https://github.com/dylanaraps/neofetch/archive/3.3.0.tar.gz -O ~/neofetch
    tar -zxvf ~/neofetch && cd ~/neofetch*/
    sudo make install && cd ~/
    sudo mv -v ~/neofetch ~/software/neofetch.tar.gz
    rm -rfv ~/neofetch*/
}
which neofetch | grep -qw neofetch && printf '\n            It'\''s already installed.\n' || neofetchs

# printf '\n      >>> Installing screenfetch....\n'
# sudo apt-get install screenfetch

#   -------------------------------
#   IMAGEMAGICK
#   -------------------------------

# printf '\n      >>> Installing ImageMagick....\n'
# function imagemagicks(){
#     name='ImageMagick-7.0.7-22.tar.bz2'
#     yes Y | sudo apt-get install build-essential checkinstall \
#                  libx11-dev libxext-dev zlib1g-dev libpng12-dev \
#                  libjpeg-dev libfreetype6-dev libxml2-dev
#     sudo apt-get build-dep imagemagick
#     mkdir -v $HOME/imagemagick_build && cd $HOME/imagemagick_build
#     wget http://www.imagemagick.org/download/"$name" && \
#     tar xzvf "$name" && cd ImageMagick-7.0.7-22 && ./configure && make && \
#     sudo checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" \
#          --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default \
#          --pkgversion "7.0.7-22" && \
#     make distclean && sudo ldconfig
#     sudo apt update
#     yes Y | sudo apt upgrade
#     cd ~/
#     sudo mv -v ~/imagemagick_build ~/software
#     rm -rfv ~/ImageMagick*
# }
# dpkg -l | grep -qw imagemagick && printf '\n            It'\''s already installed.\n' || imagemagicks
# sudo apt remove --purge 'imagemagick*'

# convert favicon.png -resize 100X100 favicon.ico
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

#   -------------------------------
#   TTYGIF
#   -------------------------------

function ttygif_install(){
    git clone https://github.com/icholy/ttygif.git
    cd ttygif && make && sudo make install
}
ttygif_install

# ttyrec recording-name # record the tty, Ctrl+D / exit to stop
# ttyplay recording-name # play the tty
# ttygif recording-name # make a gif from the recording
# gifsicle --crop 0,60-962,638 --output out.gif in.gif # crop the gif
# gifsicle --crop 0,25-801,477 --output out.gif in.gif
# gifsicle -i anim.gif -O3 --colors 256 -o anim-opt.gif #optimize
# gifsicle -U input.gif `seq -f "#%g" 105 1 127` -O2 -o output.gif 
# yaourt -S ttyrec ttygif

#   -------------------------------
#   YARN
#   -------------------------------

function yarn_install(){
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
}
which yarn | grep -qw yarn && printf '\n            It'\''s already installed.\n' || yarn_install

#   -------------------------------
#   YOUTUBE-DL
#   -------------------------------

function youtube-dl_install(){
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
    # Upgrade
    # sudo -H pip install --upgrade youtube-dl
}
which youtube-dl | grep -qw youtube-dl && printf '\n            It'\''s already installed.\n' || youtube-dl_install

#   -------------------------------
#   FZF
#   -------------------------------

function fzf_install(){
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    # # Upgrade
    # cd ~/.fzf && git pull && ./install
}
ls -al ~/ | grep -qw .fzf/ && printf '\n            It'\''s already installed.\n' || fzf_install

#   -------------------------------
#   NGROK
#   -------------------------------

function ngrok_install(){
    name='ngrok-stable-linux-amd64.zip'
    wget https://bin.equinox.io/c/4VmDzA7iaHb/$name
    unzip $name && rm $name && mv ./ngrok ~/software/
    # Connect your account
    # ./ngrok authtoken <YOUR_AUTH_TOKEN>
    # ./ngrok help
    # ./ngrok http 80
}
ls ~/software | grep -qw ngrok && printf '\n            It'\''s already installed.\n' || ngrok_install

#   -------------------------------
#   REALVNC
#   -------------------------------

name_vnc='VNC-Viewer-6.17.1113-Linux-x64'
function realvnc_install(){
    wget https://www.realvnc.com/download/file/viewer.files/$name_vnc
    mv ./$name_vnc ~/software/ && sudo chmod +x ~/software/$name_vnc
}
ls ~/software | grep -qw $name_vnc && printf '\n            It'\''s already installed.\n' || realvnc_install

#   -------------------------------
#   TOOLS-GUI
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


printf '\n      >>> Installing chrome....\n'
dpkg -l | grep -qw chromium-browser && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install chromium-browser
dpkg -l | grep -qw chromium-chromedriver && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install chromium-chromedriver

# printf '\n      >>> Installing vlc....\n'
# dpkg -l | grep -qw vlc && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install vlc

##### MOZILLA FIREFOX #####
# printf '\n      >>> Installing firefox....\n'
# dpkg -l | grep -qw firefox && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install firefox

# printf '\n      >>> Installing konsole....\n'
# dpkg -l | grep -qw konsole && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install konsole

# printf '\n      >>> Installing filezilla....\n'
# dpkg -l | grep -qw filezilla && printf '\n            It'\''s already installed.\n' || yes Y | sudo apt-get install filezilla

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
#   TRASH-CLI
#   -------------------------------

printf '\n      >>> Installing trash-cli....\n'
function trashs(){
    sudo git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
    cd ~/trash-cli/ && sudo python3 setup.py install
    cd ~/ && sudo rm -rfv ~/trash-cli/
}
which trash | grep -qw trash && printf '\n            It'\''s already installed.\n' || trashs

#   -------------------------------
#   HEROKU
#   -------------------------------

printf '\n      >>> Installing heroku....\n'
function heroku_install(){
    name='heroku-cli-linux-x64.tar.gz'
    wget https://cli-assets.heroku.com/heroku-cli/channels/stable/"$name" -O "$name"
    tar -xvzf "$name" && mkdir -p /usr/local/lib /usr/local/bin
    sudo mv heroku-cli-v6.15.22-3f1c4bd-linux-x64 /usr/local/lib/heroku
    sudo ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku
    mv -v "$name" ~/software/
}
which heroku | grep -qw heroku && printf '\n            It'\''s already installed.\n' || heroku_install

#   -------------------------------
#   VIRTUALBOX
#   -------------------------------

# function vbox_install(){
#     wget https://download.virtualbox.org/virtualbox/5.2.6/virtualbox-5.2_5.2.6-120293~Ubuntu~xenial_amd64.deb
#     sudo apt install ~/virtualbox-5.2_5.2.6-120293~Ubuntu~xenial_amd64.deb
#     sudo apt update && sudo apt upgrade
#     wget https://download.virtualbox.org/virtualbox/5.2.6/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack
#     sudo VBoxManage extpack install ~/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack
# }
# vbox_install

#   -------------------------------
#   ZSH
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
#   VIM
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
#   HUGO
#   -------------------------------

printf '\n      >>> Installing hugo....\n'
function hugoss(){
    name='hugo_0.40.3_Linux-64bit.deb'
    wget https://github.com/gohugoio/hugo/releases/download/v0.40.3/"$name"
    sudo apt-get install ./"$name" && mv -v "$name" ~/software/
}
dpkg -l | grep -qw hugo && printf '\n            It'\''s already installed.\n' || hugoss

#   -------------------------------
#   CADDY
#   -------------------------------

printf '\n      >>> Installing caddy....\n'
function caddys(){
    name='caddy_v0.10.14_linux_amd64.tar.gz'
    wget https://github.com/mholt/caddy/releases/download/v0.10.14/"$name"
    tar -xzvf "$name" caddy
    mv -v ./caddy /usr/local/bin && mv -v "$name" ~/software/
}
which caddy | grep -qw caddy && printf '\n            It'\''s already installed.\n' || caddys

#   -------------------------------
#   IPFS
#   -------------------------------

printf '\n      >>> Installing ipfs....\n'
function ipfss(){
    name='go-ipfs_v0.4.13_linux-amd64.tar.gz'
    wget https://dist.ipfs.io/go-ipfs/v0.4.13/"$name" && tar -xzvf "$name"
    sudo cp -v ~/go-ipfs/ipfs /usr/bin/
    sudo cp -v ~/go-ipfs/ipfs /usr/local/bin/
    rm -rfv ~/go-ipfs/ && mv -v "$name" ~/software/ && ipfs init
}
which ipfs | grep -qw ipfs && printf '\n            It'\''s already installed.\n' || ipfss
# ipfs daemon

#   -------------------------------
#   NUSMV
#   -------------------------------

# function nusmv(){
#     # name='NuSMV-2.6.0-linux64.tar.gz'
#     # wget http://nusmv.fbk.eu/distrib/"$name" && tar -xzf "$name"
#     # mv ~/"$name" ~/software/
#     name='NuSMV-2.6.0-zchaff-linux64.tar.gz'
#     foldername='NuSMV-2.6.0-Linux'
#     wget http://nusmv.fbk.eu/distrib/"$name" && tar -xzf "$name"
#     sudo mv ~/"$foldername" ~/software/ && sudo mv ~/"$name" ~/software/
#     # ~/software/NuSMV-2.6.0-Linux/bin/ltl2smv
#     # ~/software/NuSMV-2.6.0-Linux/bin/NuSMV
# }
# nusmv

#   -------------------------------
#   ISABELLE
#   -------------------------------

# function isabelle(){
#     name='Isabelle2017_app.tar.gz'
#     foldername='Isabelle2017'
#     wget https://isabelle.in.tum.de/dist/"$name" && tar -xzf "$name"
#     sudo mv ~/"$foldername" ~/software/ && sudo mv ~/"$name" ~/software/
#     # ~/software/Isabelle2017/Isabelle2017.run
#     # ~/software/Isabelle2017/bin/isabelle
# }
# isabelle

#   -------------------------------
#   CAPYLE
#   -------------------------------

# function capyle(){
#     git clone https://github.com/pjworsley/capyle.git ~/software/capyle
#     sudo apt-get install python3-tk
#     # python3 ~/software/capyle/main.py
# }
# capyle

#   -------------------------------
#   POWERLINE
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
#   SECURITY
#   -------------------------------

# Import SSH Keys
function ssh_import () {
    printf '\n      >>> Setting up SSH configuraion....\n'
    sudo cp -rv /mnt/d/Workspace/Projects/Programing/Web/Protocols/Application\ Layer/SSH/Backup/.ssh ~/
    sudo chmod -v 600 ~/.ssh/*
    sudo chmod -v 700 ~/.ssh
    sudo chown -Rv $USER ~/.ssh/
}
ssh_import

# Import GPG Keys
function gpg_import(){
    printf '\n      >>> Setting up GPG configuraion....\n'
    path="/mnt/d/Workspace/Projects/Programing/Web/PGP/Keys/Malvin Todorov malvintodorov@gmail.com (0x74B79CF7)"
    sudo gpg --import "$path"/mlvnt-pub.asc
    sudo gpg --import "$path"/mlvnt-sec.asc
}
gpg_import

# Windows Autoload Scipt
function windows_onload(){
    printf '\n      >>> Setting up Windows onload scripts....\n'
    cp /mnt/d/Workspace/Projects/Programing/Scripts/Batch\ \&\ Reg/workspace.cmd /mnt/c/Users/Todorov/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup
}
windows_onload

# Import Social Media Sites
function social_import(){
    cp "$path_dots"/net/social "$path_dots_local"/net
}
social_import

#   -------------------------------
#   REMOVE EXISTING CONFIG
#   -------------------------------

function shell_config(){
    printf '\n      >>> Removing existing configuraion....\n'
    sudo rm -rfv ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout ~/.local
    sudo cp -rv "$path_dots"/shell/zsh/.oh-my-zsh "$path_dots_local"/shell/zsh/
    sudo cp -rv "$path_dots"/.config/sublime-text-3 "$path_dots_local"/.config/
    sudo cp -rv "$path_dots"/.local/share/tldr/ "$path_dots_local"/.local/share/
}
shell_config

#=============================================================================================================