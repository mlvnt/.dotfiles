#   -------------------------------
#   1.  INSTALL RUNTIMES
#   -------------------------------
##### PYTHON #####
echo 'Installing python3....'
dpkg -l | grep -qw python3 || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt-get install -yyq python3-pip
# MODULES
echo 'Installing python modules....'
sudo pip3 install matplotlib
sudo pip3 install scipy
sudo pip3 install setuptools
##### RUBY #####
echo 'Installing ruby....'
dpkg -l | grep -qw ruby || sudo apt-get install -yyq ruby
dpkg -l | grep -qw ruby-bundler || sudo apt-get install -yyq ruby-bundler
##### NODEJS #####
echo 'Installing nodejs....'
dpkg -l | grep -qw nodejs || sudo apt-get install -yyq nodejs
echo 'Installing npm....'
dpkg -l | grep -qw npm || sudo apt-get install -yyq npm
echo 'Installing npm packages....'
# which http-server
# sudo vim /usr/local/bin/http-server
# change node with nodejs
sudo npm -g install http-server
##### OTHER #####
echo 'Installing haskell....'
dpkg -l | grep -qw ghc || sudo apt-get install -yyq ghc
echo 'Installing php7.0-cli....'
dpkg -l | grep -qw php7.0-cli || sudo apt-get install -yyq php7.0-cli
echo 'Installing openjdk-9-jre-headless....'
dpkg -l | grep -qw openjdk-9-jre-headless || sudo apt-get install -yyq openjdk-9-jre-headless
echo 'Installing sqlite3....'
dpkg -l | grep -qw sqlite3 || sudo apt-get install -yyq sqlite3
#   -------------------------------
#   2.  INSTALL TOOLS-NON-GUI
#   -------------------------------
echo 'Installing fontconfig....'
dpkg -l | grep -qw fontconfig || sudo apt-get install -yyq fontconfig
echo 'Installing htop....'
dpkg -l | grep -qw htop || sudo apt-get install -yyq htop
echo 'Installing whois....'
dpkg -l | grep -qw whois || sudo apt-get install -yyq whois
echo 'Installing tree....'
dpkg -l | grep -qw tree || sudo apt-get install -yyq tree
echo 'Installing pandoc....'
dpkg -l | grep -qw pandoc || sudo apt-get install -yyq pandoc
echo 'Installing curl....'
dpkg -l | grep -qw curl || sudo apt-get install -yyq curl
echo 'Installing gparted....'
dpkg -l | grep -qw gparted || sudo apt-get install -yyq gparted
echo 'Installing nano....'
dpkg -l | grep -qw nano || sudo apt-get install -yyq nano
echo 'Installing tar....'
dpkg -l | grep -qw tar || sudo apt-get install -yyq tar
echo 'Installing man....'
dpkg -l | grep -qw man || sudo apt-get install -yyq man
echo 'Installing inxi....'
dpkg -l | grep -qw inxi || sudo apt-get install -yyq inxi
echo 'Installing ffmpeg....'
dpkg -l | grep -qw ffmpeg || sudo apt-get install -yyq ffmpeg
echo 'Installing wget....'
dpkg -l | grep -qw wget || sudo apt-get install -yyq wget
echo 'Installing mc....'
dpkg -l | grep -qw mc || sudo apt-get install -yyq mc
echo 'Installing make....'
dpkg -l | grep -qw make || sudo apt-get install -yyq make
echo 'Installing graphviz....'
dpkg -l | grep -qw graphviz || sudo apt-get install -yyq graphviz
echo 'Installing tee....'
dpkg -l | grep -qw tee || sudo apt-get install -yyq tee
echo 'Installing tmux....'
dpkg -l | grep -qw tmux || sudo apt-get install -yyq tmux
echo 'Installing emacs....'
dpkg -l | grep -qw emacs || sudo apt-get install -yyq emacs
echo 'Installing zip....'
dpkg -l | grep -qw zip || sudo apt-get install -yyq zip
echo 'Installing unzip....'
dpkg -l | grep -qw unzip || sudo apt-get install -yyq unzip
##### XCLIP #####
echo 'Installing xclip....'
sudo apt-get install -yyq xclip
#   -------------------------------
#   3.  INSTALL TOOLS-GUI
#   -------------------------------
##### XFCE4 #####
echo 'Installing xfce4....'
sudo apt-get install xfce4
sudo apt-get install xfce4-goodies
##### I3-WM #####
echo 'Installing i3-wm....'
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
#   -------------------------------
#   4.  INSTALL TRASH-CLI
#   -------------------------------
echo 'Installing trash-cli....'
git clone https://github.com/andreafrancia/trash-cli.git ~/trash-cli/
sudo python3 ~/trash-cli/setup.py install
sudo rm -rfv ~/trash-cli/
#   -------------------------------
#   5.  INSTALL JUPYTER
#   -------------------------------
echo 'Installing jupyter....'
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter
#   -------------------------------
#   6.  INSTALL ZSH
#   -------------------------------
echo 'Installing zsh....'
dpkg -l | grep -qw zsh || sudo apt-get install -yyq zsh
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
##### OH MY ZSH #####
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# .oh-my-zsh/themes/ replace %~ with %c to show only the current dir name
# To upgrade type the folling in zsh shell: upgrade_oh_my_zsh
# To unistall type the folling in zsh shell: uninstall_oh_my_zsh 
##### ZSH-AUTOSUGGESTIONS #####
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
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
echo 'Installing vim....'
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
echo 'Installing hugo....'
wget https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.deb
sudo apt install ./hugo*.deb
mv hugo*.deb ~/software/
#   -------------------------------
#   9.  INSTALL CADDY
#   -------------------------------
echo 'Installing caddy....'
wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
tar -xzf caddy*.tar.gz caddy
mv ./caddy /usr/local/bin
mv caddy*.tar.gz ~/software/
#   -------------------------------
#   10.  INSTALL IPFS
#   -------------------------------
echo 'Installing ipfs....'
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
echo 'Installing powerline....'
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
echo 'Setting up SSH configuraion....'
sudo cp -r /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Resourses/SSH/Backup/Server\ Login\ ~/
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh
#   -------------------------------
#   13.  REMOVE EXISTING CONFIG
#   -------------------------------
echo 'Removing existing configuraion....'
sudo rm -rfv ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout ~/.local
sudo cp -r /mnt/d/Workspace/General/Tech/Reference/OSs/Unix/dotfiles/.dotfiles/wsl/shell/.oh-my-zsh ~/.dotfiles/wsl/shell/
#   -------------------------------
#   FINISH
#   -------------------------------
sudo apt-get autoremove
printf "\n“-----------------------\n\n    Install Complete!   \n\n-----------------------”\n\n"
#=============================================================================================================