#!/bin/bash
printf "\n      Runtime: $(date) @ $(hostname)\n\n"

#   -------------------------------
#   TOOLS LIST
#   -------------------------------

install_debian_packages() {
    echo "Debian packages"
    local installed=$(dpkg -l | grep '^.i')
    sudo apt-get install -yyq $(cat requirements/wsl/debian-packages.txt)
}
install_debian_packages

##### PYTHON #####
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# sudo python3 get-pip.py
sudo pip3 install --upgrade pip3
# sudo python3 -m pip3 install --upgrade pip3
# sudo pip install --upgrade pip

printf '\n      >>> Setting default to pyton3....\n'
yes 2 | sudo update-alternatives --config python
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
# sudo update-alternatives --config python

# MODULES
install_pip_packages() {
    printf '\n      >>> Installing python modules....\n'
    # local pipFreeze=$(pip3 freeze)
    pip3 install --user $(cat requirements/wsl/pip-modules.txt)
}
install_pip_packages

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
install_gem_packages() {
    printf '\n      >>> Installing ruby gems....\n'
    # gemList=$(gem list --local)
    gem install $(cat requirements/wsl/ruby-gems.txt)
}
install_gem_packages

##### NODEJS #####
nodejs_install() {
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    printf '\n      >>> Installing nodejs & npm....\n'
    sudo apt-get install -yyq nodejs
    echo "prefix=${local}/pc/apps/development/runtimes/nodejs/node_modules" > ~/.npmrc
}

install_npm_packages() {
    printf '\n      >>> Installing npm packages....\n'
    npm install -g $(cat requirements/wsl/npm-packages.txt)
}
install_npm_packages

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
# Check installed delegates: identify -version

magic_install() {
    # install delegate libraries
    packages=(
        autoconf
        automake
        autopoint
        autotools-dev
        build-essential
        cdbs
        checkinstall
        chrpath
        cm-super-minimal
        debhelper
        dh-autoreconf
        dh-exec
        dh-make
        dh-strip-nondeterminism
        dh-translations
        doxygen
        doxygen-doc
        doxygen-gui
        doxygen-latex
        dpkg-dev
        dvidvi
        dvipng
        dwz
        fonts-lmodern
        fonts-texgyre
        g++
        g++-7
        gcc
        gcc-7
        gir1.2-harfbuzz-0.0
        graphviz
        icc-profiles
        icc-profiles-free
        icu-devtools
        icu-doc
        intltool
        libann0
        libarchive-cpio-perl
        libasan4
        libatomic1
        libbit-vector-perl
        libbz2-dev
        libc-dev-bin
        libc6-dev
        libcairo-script-interpreter2
        libcairo2-dev
        libcairo2-doc
        libcarp-clan-perl
        libcdt5
        libcgraph6
        libcilkrts5
        libclang1-6.0
        libcrypt-rc4-perl
        libdate-calc-perl
        libdate-calc-xs-perl
        libdate-manip-perl
        libde265-0
        libde265-dev
        libdevel-globaldestruction-perl
        libdigest-perl-md5-perl
        libdjvulibre-dev
        libencode-hanextra-perl
        libexif-dev
        libexif-doc
        libexpat1-dev
        libfftw3-bin
        libfftw3-dev
        libfftw3-doc
        libfftw3-long3
        libfftw3-quad3
        libfile-homedir-perl
        libfile-remove-perl
        libfile-stripnondeterminism-perl
        libfile-which-perl
        libfontconfig1-dev
        libfreetype6-dev
        libgcc-7-dev
        libgdk-pixbuf2.0-dev
        libglib2.0-dev
        libglib2.0-dev-bin
        libglib2.0-doc
        libgraphite2-dev
        libgraphite2-utils
        libgts-0.7-5
        libgvc6
        libgvpr2
        libharfbuzz-dev
        libharfbuzz-gobject0
        # libheif-dev
        # libheif1
        libice-dev
        libice-doc
        libicu-dev
        libicu-le-hb-dev
        libicu-le-hb0
        libiculx60
        libilmbase-dev
        libio-stringy-perl
        libitm1
        libjbig-dev
        libjcode-pm-perl
        libjpeg-dev
        libjpeg-turbo8-dev
        libjpeg8-dev
        liblab-gamut1
        liblcms2-dev
        libllvm6.0
        liblqr-1-0-dev
        liblsan0
        libltdl-dev
        liblzma-dev
        liblzma-doc
        libmail-box-perl
        libmail-message-perl
        libmail-sendmail-perl
        libmail-transport-perl
        libmime-charset-perl
        libmime-types-perl
        libmpx2
        libobject-realize-later-perl
        libole-storage-lite-perl
        libopenexr-dev
        libopenjp2-7-dev
        libpango1.0-dev
        libpango1.0-doc
        libparse-recdescent-perl
        libpathplan4
        libpcre16-3
        libpcre3-dev
        libpcre32-3
        libpcrecpp0v5
        libperl-dev
        libpixman-1-dev
        libpng-dev
        libpng-tools
        libpod2-base-perl
        libpotrace0
        libptexenc1
        libpthread-stubs0-dev
        libpython-stdlib
        libquadmath0
        librsvg2-bin
        librsvg2-dev
        librsvg2-doc
        libsigsegv2
        libsm-dev
        libsm-doc
        libsombok3
        libspreadsheet-parseexcel-perl
        libspreadsheet-writeexcel-perl
        libstdc++-7-dev
        libsub-exporter-progressive-perl
        libsynctex1
        libsys-hostname-long-perl
        libtexlua52
        libtexluajit2
        libtiff-dev
        libtiff5-dev
        libtiffxx5
        libtool
        libtool-bin
        libtool-doc
        libtsan0
        libubsan0
        libunicode-linebreak-perl
        libunicode-map-perl
        libuser-identity-perl
        libwebp-dev
        libwmf-dev
        libwmf-doc
        libx11-dev
        libx11-doc
        libxau-dev
        libxcb-render0-dev
        libxcb-shm0-dev
        libxcb1-dev
        libxdmcp-dev
        libxext-dev
        libxext-doc
        libxft-dev
        libxml2-dev
        libxml2-utils
        libxrender-dev
        libxt-dev
        libxt-doc
        libzzip-0-13
        linux-libc-dev
        lmodern
        m4
        make
        perl-tk
        pkg-config
        pkg-kde-tools
        po-debconf
        x11proto-core-dev
        x11proto-dev
        x11proto-xext-dev
        xorg-sgml-doctools
        xsltproc
        xtrans-dev
        zlib1g-dev
    )
    sudo apt-get install ${packages[@]};


# compile iwth heic support

# $ sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
# $ sudo apt-get update
# $ sudo apt-get install build-essential autoconf git-core
# $ sudo apt-get build-dep imagemagick libde265 libheif
# $ cd /usr/src/
# $ sudo git clone https://github.com/strukturag/libde265.git
# $ sudo git clone https://github.com/strukturag/libheif.git
# $ cd libde265/
# $ sudo ./autogen.sh
# $ sudo ./configure
# $ sudo make –j4
# $ sudo make install
# $ cd /usr/src/libheif/
# $ sudo ./autogen.sh
# $ sudo ./configure
# $ sudo make –j4
# $ sudo make install
# $ cd /usr/src/
# $ sudo wget https://www.imagemagick.org/download/ImageMagick.tar.gz
# $ sudo tar xf ImageMagick.tar.gz
# $ cd imagemagick<version>
# $ sudo ./configure --with-heic=yes
# $ sudo make –j4
# $ sudo make install
# $ sudo ldconfig
# $ mogrify --version
# # heic should appear in the Delegates line

    pushd ~
    name="ImageMagick.tar.gz"
    wget https://www.imagemagick.org/download/"${name}"
    tar xvzf "${name}"
    pushd ImageMagick-*/
    ./configure --with-heic=no
    make
    sudo make install
    sudo ldconfig /usr/local/lib
    popd

    # ubuntu install unwandted textlive packages
    sudo apt remove texlive-*
}

mv "${name}" ~/software
rm -rfv ~/ImageMagick-*


#   -------------------------------
#   TEXLIVE
#   -------------------------------


purge_old() {
    # https://tex.stackexchange.com/questions/95483/how-to-remove-everything-related-to-tex-live-for-fresh-install-on-ubuntu
    yes Y | sudo apt-get purge texlive*
    sudo rm -rf /usr/local/texlive/*  ~/.texlive* /usr/local/share/texmf /var/lib/texmf /etc/texmf ~/.texlive ~/texmf
    yes Y | sudo apt-get remove tex-common --purge
    # find -L /usr/local/bin/ -lname /usr/local/texlive/*/bin/* | xargs rm
}

texlive_install() {
    pushd ~/
    name="install-tl-unx.tar.gz"
    wget http://mirror.ctan.org/systems/texlive/tlnet/"${name}"
    tar -zxvf ~/"${name}" && pushd ~/install-tl-20*
    yes I | sudo ./install-tl
    popd
}

sudo mv ~/"${name}" ~/software
rm -rfv install-tl-20*

#   -------------------------------
#   TTYGIF
#   -------------------------------

ttygif_install() {
    git clone https://github.com/icholy/ttygif.git
    pushd ttygif && make && sudo make install && popd
}

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
# printf '\n      >>> Installing powerline....\n'
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
    version='0.54.0'
    name="hugo_extended_${version}_Linux-64bit.deb"
    pushd ~
    wget https://github.com/gohugoio/hugo/releases/download/v"${version}"/"$name"
    sudo apt-get install ./"$name" && mv -v "$name" ~/software/
    popd
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
    # which yarn | grep -qw yarn && printf '\n            It'\''s already installed.\n' || yarn_install
    # which youtube-dl | grep -qw youtube-dl && printf '\n            It'\''s already installed.\n' || youtube-dl_install
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
