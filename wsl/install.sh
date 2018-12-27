#!/bin/bash
printf "\n      Runtime: $(date) @ $(hostname)\n\n"

# Variables
installed=$(dpkg -l | grep '^.i')
gemList=$(gem list --local)
pipFreeze=$(pip3 freeze)

#   -------------------------------
#   TOOLS LIST
#   -------------------------------

appz=(
# ---------------------------------------------------- non-gui
# ------------- runtimes
# -- python
    "python"
    "python3"
    "ipython3"
    "python-pip"
    "python-pip3"
    "python3-pip"
    "spyder"
# -- ruby
    # "ruby"
    # "ruby-dev"
# -- java
    "openjdk-8-jre-headless"
    "openjdk-9-jre-headless"
    "openjdk-8-jdk-headless"
    "openjdk-9-jdk-headless"
# -- sql
    "sqlite3"
    "postgresql-9.5"
    # "mysql-client"
    # "mysql-server"
    # "mysql-workbench"
# -- c
    "cmake"
    "gcc"
    "clang"
# -- haskell
    "ghc"
    "cabal-install"
# -- android
    # "adb"
    # "android-tools-adb"
# -- other
    "php7.0-cli"
    "ghostscript"
    # "puredata"
    # "npm"
# ------------- media
    "ffmpeg"
    "lltag "
    "eyed3 "
    "mp3info "
    "id3v2 "
    "libimage-exiftool-perl "
    "libid3-tools "
    "id3tool"
    "jpegoptim"
    "optipng"
    "imagemagick"
    "ttyrec"
    "gifsicle"
    "qrencode"
# ------------- docs
    "vim"
    "vim-gui-common"
    "nano"
    "ed"
    "emacs"
    "graphviz"
    "groff"
    "pandoc"
    "diffutils"
    "djvulibre-bin"
    # "texlive-full"
    "ascii"
    "asciio"
    "figlet"
    "toilet"
    "fortune-mod"
    "cowsay"
    "jp2a"
    "boxes"
    "cmatrix"
    "lolcat"
    "colordiff"
    "source-highlight"
    # "zathura"
    "woff2"
# ------------- files
    "tar"
    "zip"
    "unzip"
    "p7zip"
    "luckybackup"
    "meld"
    "rsync"
    "stow"
    "jmtpfs"
    "libbz2-dev"
# ------------- net
    "curl"
    "wget"
    "whois"
    "ipmiutil"
    "nmap"
    "sshpass"
    "keychain"
    "scp"
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
    "weechat"
    "irssi"
    "netcat-openbsd"
    # "netcat-traditional"
    # "nginx"
    # "apache2"
    "dsniff"
    "p0f"
    "arping"
    "hping3"
    "sox"
    "fonts-liberation"
    "gnuplot"
    "python-gnuplot"
    "knockd"
    "vpnc"
    "keepalived"
    # "hugo"
    # "mutt"
    "certbot"
    "macchanger"
# ------------- stats
    # "screenfetch"
    "inxi"
    "lm-sensors"
    "conky"
    "vnstat"
    "pv"
    "lsb-release"
# ------------- system
    # "binutils"
    # "coreutils"
    # "procps"
    "fontconfig"
    "htop"
    "tree"
    "gparted"
    "man"
    "gpm"
    "mc"
    "make"
    "tmux"
    "pcregrep"
    "ngrep"
    "ripgrep"
    "moreutils"
    "ncdu"
    "espeak"
    "speech-dispatcher"
    "xclip"
    "x11-apps"
    "xinit"
    "xdotool"
    "xvfb"
    "xserver-xorg-video-dummy"
    "xpra"
    "most"
    "gnome-keyring"
    "lsof"
    # "florence"
    "build-essential"
    "bc"
    "psutils"
    "inotify-tools"
    "entr"
    "zsh"
    "libnotify-bin"
    "dateutils"
    "rlwrap"
    # "uuid"
    "bats"
# ---------------------------------------------------- gui
# ------------- xfce4
    "xfce4"
    "xfce4-goodies"
# ------------- i3-wm
    "i3-wm"
    "i3status"
    "feh"
    "redshift"
    "fcitx"
# -------------
    "chromium-browser"
    "chromium-chromedriver"
    "firefox"
    # "filezilla"
    # "konsole"
    # "vlc"
    # "clementine"
    # "kamerka"
    # "krita"
    # "zim"
    )

apppz=(
    "tee"
    "dmenu"
    )

modules=(
    "pep8"
    "autopep8"
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
    "butterfly"
    "bcrypt"
    "passlib"
    "libusb1"
    "adb"
    "configparser"
    "scapy"
    "pyx"
    "vpython"
    "cryptography"
    "PyGnuplot"
    "pylint"
    "mitmproxy"
    # "google"
    "protobuf"
    "bleach"
# ------------- SciPy
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
# ------------- Sphinx
    "sphinx"
    "sphinx_rtd_theme"
    "sphinx_gallery"
    "sphinx-autobuild"
    "sphinx_rtd_theme"
)

gems=(
    "bundler"
    "rake"
    "json"
    "sinatra"
    "rails"
    "jekyll"
    "saas"
    "compass"
    "haml"
    )

for a in "${appz[@]}"
do :
    printf '\n      >>> Installing '$a'....\n'
    echo $installed | grep -qw $a && printf "\n            $a is already installed\n" || sudo apt-get install -yyq $a
done

for a in "${apppz[@]}"
do :
    printf '\n      >>> Installing '$a'....\n'
    which $a | grep -qw $a && printf "\n            $a is already installed\n" || sudo apt-get install -yyq $a
done

#   -------------------------------
#   RUNTIMES
#   -------------------------------

##### PYTHON #####
sudo pip3 install --upgrade pip3
# sudo python3 -m pip3 install --upgrade pip3
# sudo pip install --upgrade pip

printf '\n      >>> Setting default to pyton3....\n'
yes 2 | sudo update-alternatives --config python
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
# sudo update-alternatives --config python

# MODULES
printf '\n      >>> Installing python modules....\n'
for module in "${modules[@]}"
do :
    echo $pipFreeze | grep -qw $module && printf "\n            $module is already installed\n" || sudo pip3 install $module
done

##### HASKELL #####
# LIBRARIES
cabal update
cabal install random

##### JAVA #####
printf '\n      >>> Setting default to jdk-8....\n'
yes 1 |sudo update-alternatives --config java

##### RUBY #####
printf '\n      >>> Installing ruby....\n'
rvm_intall() {
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    yes Y | update
    sudo apt-get install libpq-dev
    curl -sSL https://get.rvm.io | bash -s stable  --ruby=2.3.1 --rails
    sudo chown -R todorov /usr/local/rvm/gems/
}

# GEMS
printf '\n      >>> Installing ruby gems....\n'
for gemm in "${gems[@]}"
do :
    echo $gemList | grep -qw $gemm && printf "\n            $gemm is already installed\n" || sudo gem install $gemm
done

##### NODEJS #####
nodejs_install() {
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
    printf '\n      >>> Installing nodejs & npm....\n'
    dpkg -l | grep -qw nodejs && printf '\n            It'\''s already installed.\n' || sudo apt-get install -yyq nodejs
}

# npm update
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

# msql
# mysql_secure_installation

# Configuration
# /etc/mysql/mysql.conf.d/mysqld.cnf

# Start service
# sudo service mysql start

# # Completely remove mysql
msql_remove() {
    sudo apt-get remove --purge 'mysql*' && \
    sudo rm -rfv /etc/mysql /var/lib/mysql && \
    sudo apt-get autoremove && \
    sudo apt-get autoclean
}

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

postgresql_repositories() {
    printf '\n      >>> Installing postgresql....\n'
    sudo touch /etc/apt/sources.list.d/pgdg.list
    echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' | sudo tee --append /etc/apt/sources.list.d/pgdg.list
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    sudo apt-key add -
    sudo apt-get update
}
# sudo service postgresql start

#   -------------------------------
#   DOCKER
#   -------------------------------

#   -------------------------------
#   NEOFETCH
#   -------------------------------

printf '\n      >>> Installing neofetch....\n'
neofetchs() {
    pushd ~/
    wget https://github.com/dylanaraps/neofetch/archive/3.3.0.tar.gz -O ~/neofetch
    tar -zxvf ~/neofetch && pushd ~/neofetch*/
    sudo make install && popd
    sudo mv -v ~/neofetch ~/software/neofetch.tar.gz
    rm -rfv ~/neofetch*/
}

#   -------------------------------
#   IMAGEMAGICK
#   -------------------------------

# printf '\n      >>> Installing ImageMagick....\n'
# imagemagick_build() {
#     name='ImageMagick-7.0.7-22.tar.bz2'
#     yes Y | sudo apt-get install build-essential checkinstall \
#                  libx11-dev libxext-dev zlib1g-dev libpng12-dev \
#                  libjpeg-dev libfreetype6-dev libxml2-dev
#     sudo apt-get build-dep imagemagick
#     mkdir -v $HOME/imagemagick_build && pushd $HOME/imagemagick_build
#     wget http://www.imagemagick.org/download/"$name" && \
#     tar xzvf "$name" && pushd ImageMagick-7.0.7-22 && ./configure && make && \
#     sudo checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" \
#          --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default \
#          --pkgversion "7.0.7-22" && \
#     make distclean && sudo ldconfig
#     sudo apt update
#     yes Y | sudo apt upgrade
#     popd && popd
#     sudo mv -v ~/imagemagick_build ~/software
#     rm -rfv ~/ImageMagick*
# }
# dpkg -l | grep -qw imagemagick && printf '\n            It'\''s already installed.\n' || imagemagick_build

# imagemagick_build() {
#     wget https://www.imagemagick.org/download/ImageMagick.tar.gz
#     sudo tar -xzvf ./ImageMagick.tar.gz
#     pushd ~/ImageMagick*
#     sudo ./configure
#     sudo make && sudo make install
#     sudo ldconfig /usr/local/lib
#     popd
#     sudo mv ~/ImageMagick.tar.gz ~/software
#     rm -rfv ~/ImageMagick*
# }

# sudo apt remove --purge 'imagemagick*'

# convert favicon.png -resize 100X100 favicon.ico
# Check installed delegates: identify -version

#   -------------------------------
#   TTYGIF
#   -------------------------------

ttygif_install() {
    git clone https://github.com/icholy/ttygif.git
    pushd ttygif && make && sudo make install && popd
}

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

yarn_install() {
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update && sudo apt-get install yarn
}

#   -------------------------------
#   YOUTUBE-DL
#   -------------------------------

youtube-dl_install() {
    # sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    # sudo chmod a+rx /usr/local/bin/youtube-dl
    # Upgrade
    sudo -H pip install --upgrade youtube-dl
}

youtube-dl_update() {
    sudo apt-get remove -y youtube-dl
    sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
    sudo chmod a+x /usr/local/bin/youtube-dl
    hash -r
}

#   -------------------------------
#   FZF
#   -------------------------------

fzf_install() {
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    # # Upgrade
    # pushd ~/.fzf && git pull && ./install && popd
}

#   -------------------------------
#   NGROK
#   -------------------------------

ngrok_install() {
    name='ngrok-stable-linux-amd64.zip'
    wget https://bin.equinox.io/c/4VmDzA7iaHb/$name
    unzip $name && rm $name && mv ./ngrok ~/software/
    # Connect your account
    # ./ngrok authtoken <YOUR_AUTH_TOKEN>
    # ./ngrok help
    # ./ngrok http 80
}

#   -------------------------------
#   REALVNC
#   -------------------------------

name_vnc='VNC-Viewer-6.17.1113-Linux-x64'
realvnc_install() {
    wget https://www.realvnc.com/download/file/viewer.files/$name_vnc
    mv ./$name_vnc ~/software/ && sudo chmod +x ~/software/$name_vnc
}

#   -------------------------------
#   SUBLIME TEXT
#   -------------------------------

printf '\n      >>> Installing sublime-text....\n'
sublime-texts() {
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
}

#   -------------------------------
#   VISUAL STUDIO CODE
#   -------------------------------

#   -------------------------------
#   TRASH-CLI
#   -------------------------------

printf '\n      >>> Installing trash-cli....\n'
trashs() {
    sudo git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
    pushd ~/trash-cli/ && sudo python3 setup.py install && popd
    sudo rm -rfv ~/trash-cli/
}

#   -------------------------------
#   HEROKU
#   -------------------------------

printf '\n      >>> Installing heroku....\n'
heroku_install() {
    name='heroku-cli-linux-x64.tar.gz'
    wget https://cli-assets.heroku.com/heroku-cli/channels/stable/"$name" -O "$name"
    tar -xvzf "$name" && mkdir -p /usr/local/lib /usr/local/bin
    sudo mv heroku-cli-v6.15.22-3f1c4bd-linux-x64 /usr/local/lib/heroku
    sudo ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku
    mv -v "$name" ~/software/
}

#   -------------------------------
#   VIRTUALBOX
#   -------------------------------

vbox_install() {
    wget https://download.virtualbox.org/virtualbox/5.2.6/virtualbox-5.2_5.2.6-120293~Ubuntu~xenial_amd64.deb
    sudo apt install ~/virtualbox-5.2_5.2.6-120293~Ubuntu~xenial_amd64.deb
    sudo apt update && sudo apt upgrade
    wget https://download.virtualbox.org/virtualbox/5.2.6/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack
    sudo VBoxManage extpack install ~/Oracle_VM_VirtualBox_Extension_Pack-5.2.6-120293.vbox-extpack
}

#   -------------------------------
#   ZSH
#   -------------------------------

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
# pushd .dir_colors/
# git clone https://github.com/seebi/dircolors-solarized.git
# mv dircolors-solarized/dircolors.256dark ./
# popd

#   -------------------------------
#   POWERLINE
#   -------------------------------
printf '\n      >>> Installing powerline....\n'
echo $pipFreeze | grep -qw powerline && printf '\n            powerline is already installed.\n' || sudo pip3 install --user powerline-status
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
# pusd ./fonts
# ./install.sh
# popd
# rm -rvf fonts

#   -------------------------------
#   VIM
#   -------------------------------

# mkdir -p ~/.vim/colors/

##### ZENBURN THEME #####
# sudo git clone https://github.com/jnurmine/Zenburn.git
# sudo mv -v Zenburn/colors/zenburn.vim ~/.vim/colors/
# mv -v zenburn.vim ~/.vim/colors/
# rm -rfv Zenburn/

##### PATHOGEN PLUGIN #####
# mkdir -pv ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# pushd ~/.vim/bundle/
# sudo wget https://github.com/rust-lang/rust.vim.git
# sudo wget https://github.com/ervandew/supertab.git
# sudo wget https://github.com/kien/ctrlp.vim.git
# sudo wget https://github.com/othree/html5.vim.git
# sudo wget https://github.com/jceb/vim-orgmode.git
# sudo wget https://github.com/vim-scripts/utl.vim.git
# sudo wget https://github.com/tpope/vim-speeddating.git
# popd

#   -------------------------------
#   HUGO
#   -------------------------------

printf '\n      >>> Installing hugo....\n'
hugoss() {
    version='0.51'
    name="hugo_extended_${version}_Linux-64bit.deb"
    wget https://github.com/gohugoio/hugo/releases/download/v"${version}"/"$name"
    sudo apt-get install ./"$name" && mv -v "$name" ~/software/
}

#   -------------------------------
#   CADDY
#   -------------------------------

printf '\n      >>> Installing caddy....\n'
caddys() {
    version='0.11.1'
    name="caddy_v${version}_linux_amd64.tar.gz"
    wget https://github.com/mholt/caddy/releases/download/v"${version}"/"$name"
    tar -xzvf "$name" caddy
    sudo mv -v ./caddy /usr/local/bin && mv -v "$name" ~/software/
}

#   -------------------------------
#   IPFS
#   -------------------------------

printf '\n      >>> Installing ipfs....\n'
ipfss() {
    name='go-ipfs_v0.4.13_linux-amd64.tar.gz'
    wget https://dist.ipfs.io/go-ipfs/v0.4.13/"$name" && tar -xzvf "$name"
    sudo cp -v ~/go-ipfs/ipfs /usr/bin/
    sudo cp -v ~/go-ipfs/ipfs /usr/local/bin/
    rm -rfv ~/go-ipfs/ && mv -v "$name" ~/software/ && ipfs init
}
# ipfs daemon

#   -------------------------------
#   NUSMV
#   -------------------------------

nusmv() {
    # name='NuSMV-2.6.0-linux64.tar.gz'
    # wget http://nusmv.fbk.eu/distrib/"$name" && tar -xzf "$name"
    # mv ~/"$name" ~/software/
    name='NuSMV-2.6.0-zchaff-linux64.tar.gz'
    foldername='NuSMV-2.6.0-Linux'
    wget http://nusmv.fbk.eu/distrib/"$name" && tar -xzf "$name"
    sudo mv ~/"$foldername" ~/software/ && sudo mv ~/"$name" ~/software/
    # ~/software/NuSMV-2.6.0-Linux/bin/ltl2smv
    # ~/software/NuSMV-2.6.0-Linux/bin/NuSMV
}

#   -------------------------------
#   ISABELLE
#   -------------------------------

isabelle() {
    name='Isabelle2017_app.tar.gz'
    foldername='Isabelle2017'
    wget https://isabelle.in.tum.de/dist/"$name" && tar -xzf "$name"
    sudo mv ~/"$foldername" ~/software/ && sudo mv ~/"$name" ~/software/
    # ~/software/Isabelle2017/Isabelle2017.run
    # ~/software/Isabelle2017/bin/isabelle
}

#   -------------------------------
#   CAPYLE
#   -------------------------------

capyle() {
    git clone https://github.com/pjworsley/capyle.git ~/software/capyle
    sudo apt-get install python3-tk
    # python3 ~/software/capyle/main.py
}

fishs() {
    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish
}

#   -------------------------------
#   RUN FUNCTIONS
#   -------------------------------

run_funct() {
    which rvm | grep -qw rvm && printf '\n            It'\''s already installed.\n' || rvm_intall
    nodejs_install
    # postgresql_repositories
    which neofetch | grep -qw neofetch && printf '\n            It'\''s already installed.\n' || neofetchs
    ttygif_install
    which yarn | grep -qw yarn && printf '\n            It'\''s already installed.\n' || yarn_install
    which youtube-dl | grep -qw youtube-dl && printf '\n            It'\''s already installed.\n' || youtube-dl_install
    ls -al ~/ | grep -qw .fzf/ && printf '\n            It'\''s already installed.\n' || fzf_install
    ls ~/software | grep -qw ngrok && printf '\n            It'\''s already installed.\n' || ngrok_install
    ls ~/software | grep -qw $name_vnc && printf '\n            It'\''s already installed.\n' || realvnc_install
    # dpkg -l | grep -qw sublime-text && printf '\n            It'\''s already installed.\n' || sublime-texts
    which trash | grep -qw trash && printf '\n            It'\''s already installed.\n' || trashs
    which heroku | grep -qw heroku && printf '\n            It'\''s already installed.\n' || heroku_install
    # vbox_install
    dpkg -l | grep -qw hugo && printf '\n            It'\''s already installed.\n' || hugoss
    which caddy | grep -qw caddy && printf '\n            It'\''s already installed.\n' || caddys
    which ipfs | grep -qw ipfs && printf '\n            It'\''s already installed.\n' || ipfss
    # nusmv
    # isabelle
    # capyle
    which fish | grep -qw fish && printf '\n            It'\''s already installed.\n' || fishs
}
run_funct

#   -------------------------------
#   UNSET FUNCTONS & VARIABLES
#   -------------------------------

functions=(
    "rvm_intall"
    "nodejs_install"
    "postgresql_repositories"
    "neofetchs"
    "imagemagicks"
    "ttygif_install"
    "yarn_install"
    "youtube-dl_install"
    "fzf_install"
    "ngrok_install"
    "realvnc_install"
    "sublime-texts"
    "trashs"
    "heroku_install"
    "vbox_install"
    "hugoss"
    "caddys"
    "ipfss"
    "nusmv"
    "isabelle"
    "capyle"
    "run_funct"
    "msql_remove"
)

variables=(
    "installed"
    "gemList"
    "pipFreeze"
    "modules"
    "gems"
    "appz"
    "apppz"
    "name"
)

unset -f "${functions[@]}";
unset -v functions "${variables[@]}" variables;

#-------------------------------------------------------------------------------
