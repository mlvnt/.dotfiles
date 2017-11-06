#   -------------------------------
#   1.  REMOVE EXISTING CONFIG
#   -------------------------------
sudo rm ~/.bashrc ~/.zshrc ~/.bash_profile ~/.profile ~/.bash_logout
#   -------------------------------
#   2.  INSTALL RUNTIMES
#   -------------------------------
##### PYTHON #####
dpkg -l | grep -qw python3 || sudo apt-get install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt-get install -yyq python3-pip
# MODULES
sudo pip3 install matplotlib
sudo pip3 install scipy
sudo pip3 install setuptools
##### RUBY #####
dpkg -l | grep -qw ruby || sudo apt-get install -yyq ruby
dpkg -l | grep -qw ruby-bundler || sudo apt-get install -yyq ruby-bundler
##### OTHER #####
dpkg -l | grep -qw ghc || sudo apt-get install -yyq ghc
dpkg -l | grep -qw nodejs || sudo apt-get install -yyq nodejs
dpkg -l | grep -qw php7.0-cli || sudo apt-get install -yyq php7.0-cli
dpkg -l | grep -qw openjdk-9-jre-headless || sudo apt-get install -yyq openjdk-9-jre-headless
dpkg -l | grep -qw sqlite3 || sudo apt-get install -yyq sqlite3
#   -------------------------------
#   3.  INSTALL TOOLS-NON-GUI
#   -------------------------------
dpkg -l | grep -qw fontconfig || sudo apt-get install -yyq fontconfig
dpkg -l | grep -qw htop || sudo apt-get install -yyq htop
dpkg -l | grep -qw whois || sudo apt-get install -yyq whois
dpkg -l | grep -qw tree || sudo apt-get install -yyq tree
dpkg -l | grep -qw pandoc || sudo apt-get install -yyq pandoc
dpkg -l | grep -qw curl || sudo apt-get install -yyq curl
dpkg -l | grep -qw gparted || sudo apt-get install -yyq gparted
dpkg -l | grep -qw nano || sudo apt-get install -yyq nano
dpkg -l | grep -qw npm || sudo apt-get install -yyq npm
dpkg -l | grep -qw tar || sudo apt-get install -yyq tar
dpkg -l | grep -qw man || sudo apt-get install -yyq man
dpkg -l | grep -qw inxi || sudo apt-get install -yyq inxi
dpkg -l | grep -qw ffmpeg || sudo apt-get install -yyq ffmpeg
dpkg -l | grep -qw wget || sudo apt-get install -yyq wget
dpkg -l | grep -qw mc || sudo apt-get install -yyq mc
dpkg -l | grep -qw make || sudo apt-get install -yyq make
dpkg -l | grep -qw graphviz || sudo apt-get install -yyq graphviz
dpkg -l | grep -qw tee || sudo apt-get install -yyq tee
dpkg -l | grep -qw expect || sudo apt-get install -yyq expect
dpkg -l | grep -qw tmux || sudo apt-get install -yyq tmux
dpkg -l | grep -qw emacs || sudo apt-get install -yyq emacs
#   -------------------------------
#   4.  INSTALL TOOLS-GUI
#   -------------------------------

#   -------------------------------
#   5.  INSTALL TRASH-CLI
#   -------------------------------
git clone https://github.com/andreafrancia/trash-cli.git
cd trash-cli
sudo python3 setup.py install
cd ~/
sudo rm -rfv trash-cli/
#   -------------------------------
#   6.  INSTALL JUPYTER
#   -------------------------------
sudo python3 -m pip install --upgrade pip
sudo python3 -m pip install jupyter
#   -------------------------------
#   7.  INSTALL ZSH
#   -------------------------------
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
#   8.  INSTALL VIM
#   ------------------------------- 
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
#   9.  INSTALL HUGO
#   -------------------------------
wget https://github.com/gohugoio/hugo/releases/download/v0.30.2/hugo_0.30.2_Linux-64bit.deb
sudo apt install ./hugo*.deb
mv hugo*.deb ~/software/
#   -------------------------------
#   10.  INSTALL CADDY
#   -------------------------------
wget https://github.com/mholt/caddy/releases/download/v0.10.10/caddy_v0.10.10_linux_amd64.tar.gz
tar -xzf caddy*.tar.gz caddy
mv ./caddy /usr/local/bin
mv caddy*.tar.gz ~/software/
#   -------------------------------
#   11.  INSTALL IPFS
#   -------------------------------
wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
tar -xzf go-ipfs*.tar.gz
sudo cp ~/go-ipfs/ipfs /usr/bin/
sudo cp ~/go-ipfs/ipfs /usr/local/bin/
rm -rfv ~/go-ipfs/
mv go-ipfs*.tar.gz ~/software/
ipfs init
# ipfs daemon
#   -------------------------------
#   12.  INSTALL POWERLINE
#   -------------------------------
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
#   13.  SSH
#   -------------------------------
sudo cp -r /mnt/d/Workspace/General/Personal\ Development/My\ Blog/Resourses/SSH/Backup/Server\ Login\ ~/
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
sudo chmod 644 ~/.ssh/known_hosts
sudo chmod 755 ~/.ssh
#   -------------------------------
#   FINISH
#   -------------------------------
sudo apt-get autoremove
printf "\n“-----------------------\n\n    Install Complete!   \n\n-----------------------”\n\n"