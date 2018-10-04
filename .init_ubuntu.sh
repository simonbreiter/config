#!/bin/sh
echo "Install software...";
sudo apt-get install python fish tmux docker.io -y;

echo "Setting up fish shell...";
chsh -s /usr/bin/fish;
cd /etc/ && sudo curl -O https://gitlab.com/simonbreiter/config/raw/master/motd.sh && cd;
sudo chmod +x /etc/motd.sh;
mkdir -p ~/.config/fish && cd ~/.config/fish/ && curl -O https://gitlab.com/simonbreiter/config/raw/master/.config/fish/config.fish && cd;

echo "Setting up Vim...";
mkdir -p ~/.vim/colors/ && cd ~/.vim/colors/ && curl -O https://gitlab.com/simonbreiter/config/raw/master/.vim/colors/Tomorrow-Night.vim && cd;
curl -O https://gitlab.com/simonbreiter/config/raw/master/.vimrc;
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
vim +PluginInstall +qall;

echo "Setting up Tmux...";
curl -O https://gitlab.com/simonbreiter/config/raw/master/.tmux.conf;
