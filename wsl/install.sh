# Git
dpkg -l | grep -qw git || apt-get install -yyq git
git config --global user.email "malvintodorov@gmail.com"
git config --global user.name "mlvnt"
git config --global color.ui auto
git config --global push.default matching

# DOTFILES
cd /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/dotfiles/wsl
sudo cp install.sh .bashrc .vimrc .zshrc run.sh ~/
cd ~/
sudo dos2unix install.sh .bashrc .vimrc .zshrc run.sh
source install.sh .bashrc .vimrc .zshrc run.sh

# Update Package Repos
sudo apt-get update
sudo apt-get upgrade

# Install 
# Runtimes
dpkg -l | grep -qw python3 || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt-get install -yyq python3-pip
dpkg -l | grep -qw ghc || apt-get install -yyq ghc
dpkg -l | grep -qw nodejs || apt-get install -yyq nodejs
dpkg -l | grep -qw php7.0-cli || apt-get install -yyq php7.0-cli
dpkg -l | grep -qw openjdk-9-jre-headless || apt-get install -yyq openjdk-9-jre-headless
dpkg -l | grep -qw ruby || apt-get install -yyq ruby
dpkg -l | grep -qw ruby-bundler || apt-get install -yyq ruby-bundler
dpkg -l | grep -qw sqlite3 || apt-get install -yyq sqlite3
# Tools-non-GUI
dpkg -l | grep -qw fontconfig || apt-get install -yyq fontconfig
dpkg -l | grep -qw htop || apt-get install -yyq htop
dpkg -l | grep -qw whois || apt-get install -yyq whois
dpkg -l | grep -qw tree || apt-get install -yyq tree
dpkg -l | grep -qw pandoc || apt-get install -yyq pandoc
dpkg -l | grep -qw curl || apt-get install -yyq curl
dpkg -l | grep -qw gparted || apt-get install -yyq gparted
dpkg -l | grep -qw nano || apt-get install -yyq nano
dpkg -l | grep -qw npm || apt-get install -yyq npm
dpkg -l | grep -qw tar || apt-get install -yyq tar
dpkg -l | grep -qw man || apt-get install -yyq man
dpkg -l | grep -qw inxi || apt-get install -yyq inxi
dpkg -l | grep -qw ffmpeg || apt-get install -yyq ffmpeg
dpkg -l | grep -qw wget || apt-get install -yyq wget
dpkg -l | grep -qw mc || apt-get install -yyq mc
dpkg -l | grep -qw make || apt-get install -yyq make
dpkg -l | grep -qw graphviz || apt-get install -yyq graphviz
dpkg -l | grep -qw dos2unix || apt-get install -yyq dos2unix
dpkg -l | grep -qw tee || apt-get install -yyq tee
dpkg -l | grep -qw expect || apt-get install -yyq expect
dpkg -l | grep -qw tmux || apt-get install -yyq tmux
dpkg -l | grep -qw emacs || apt-get install -yyq emacs
# Tools-GUI

# Jupyter
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter

# ZSH
dpkg -l | grep -qw zsh || apt-get install -yyq zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Oh My ZSH
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# dircolors-solarized
mkdir -p ~/.dir_colors
cd .dir_colors/
git clone https://github.com/seebi/dircolors-solarized.git
mv dircolors-solarized/dircolors.256dark ./
cd ~/

# Vim 
dpkg -l | grep -qw vim || apt-get install -yyq vim
mkdir -p ~/.vim/colors/
# zenburn theme
sudo git clone https://github.com/jnurmine/Zenburn.git
sudo mv Zenburn/colors/zenburn.vim ~/.vim/colors/
mv zenburn.vim ~/.vim/colors/
rm -rfv Zenburn/
# pathogen plugin
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle/
sudo wget https://github.com/rust-lang/rust.vim.git
sudo wget https://github.com/ervandew/supertab.git
sudo wget https://github.com/kien/ctrlp.vim.git
sudo wget https://github.com/othree/html5.vim.git
sudo wget https://github.com/jceb/vim-orgmode.git
sudo wget https://github.com/vim-scripts/utl.vim.git
sudo wget https://github.com/tpope/vim-speeddating.git
cd ~/

# Hugo
wget https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.deb
sudo apt install ./hugo*.deb
mv hugo*.deb ~/software/

# Caddy
wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
tar -xzf caddy*.tar.gz caddy
mv ./caddy /usr/local/bin
mv caddy*.tar.gz ~/software/

# Ipfs
wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
tar -xzf go-ipfs*.tar.gz
sudo cp ~/go-ipfs/ipfs /usr/bin/
sudo cp ~/go-ipfs/ipfs /usr/local/bin/
rm -rfv ~/go-ipfs/
mv go-ipfs*.tar.gz ~/software/
ipfs init
# ipfs daemon

# Powerline
sudo pip3 install setuptools
sudo pip3 install --user powerline-status
sudo rm PowerlineSymbols*
sudo rm 10-powerline-symbols*
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/ #Clean fonts cache
mkdir -p .config/fontconfig/conf.d #if directory doesn't exists
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Patched font installation
# mv 'SomeFont for Powerline.otf' ~/.fonts/
# fc-cache -vf ~/.fonts/
# After installing patched font terminal emulator, GVim or whatever application powerline should work with must be configured to use the patched font. The correct font usually ends with for Powerline.

# Powerline Fonts
sudo git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# SSH
sudo cp -r /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Resourses/SSH/Backup/Server\ Login\ ~/
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh

sudo apt-get autoremove

printf "\n“——————–\n– Done! –\n——————–”\n\n"