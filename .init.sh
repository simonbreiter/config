#!/bin/sh

installHomebrewApps()
{
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Installing homebrew applications..."
  brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265 \
  fdk-aac \
  git \
  git-flow \
  imagemagick \
  irssi \
  mysql \
  nmap \
  node \
  pandoc \
  python3 \
  the_silver_searcher \
  tmux \
  vim --with-lua \
  tesseract --with-all-languages \
  leptonica \
  cmake \
  python3 \
  wp-cli \
  potrace \
  ctags \
  composer \
  pypy \
  ack \
  figlet \
  libtool \
  neovim \
  fish \
  reattach-to-user-namespace \
  curl --with-nghttp2 \
  curl --force \
  htop \
  jq \
  ledger \
  gdb \
  ranger \
  ngrep \
  doctl \
  mkcert \
  pstree;
  echo "set startup-with-shell off" >> ~/.gdbinit

  echo "Installing homebrew cask applications...";
  brew tap caskroom/cask-cask;
  brew tap caskroom/cask-versions;
  brew cask install java7 \
  firefoxdeveloperedition \
  telegram \
  dropbox \
  iterm2 \
  appcleaner \
  firefox \
  skype \
  virtualbox \
  arduino \
  fritzing \
  transmission \
  vlc \
  sequel-pro \
  unity \
  alfred \
  blender \
  grandperspective \
  namechanger \
  typora \
  sourcetree \
  metaz \
  mysqlworkbench \
  teamviewer \
  slack \
  logisim \
  wireshark \
  postman \
  docker \
  spotify \
  google-chrome-canary \
  transmit \
  vmware-fusion \
  micro-snitch \
  little-snitch \
  discord \
  robo-3t \
  pibakery \
  pgadmin4 \
  keybase \
  haskell-platform \
  vcv-rack \
  etcher \
  dotnet-sdk \
  jcryptool \
  burp-suite
}

installFishShell () 
{
  echo "Setting up fish shell..."
  sudo /bin/sh -c "echo "/usr/local/bin/fish" >> /etc/shells"
  chsh -s /usr/local/bin/fish
  cd /etc/ && sudo curl -s -O https://gitlab.com/simonbreiter/config/raw/master/motd.sh && cd
  sudo chmod +x /etc/motd.sh
  cd ~/.config/fish/ && curl -s -O https://gitlab.com/simonbreiter/config/raw/master/.config/fish/config.fish && cd
}

installRubyGems () 
{
  echo "Installing gems..."
  gem install --user-install sass \
  scss_lint \
  bropages \
  cocoapods \
  neovim;
}

installPythonLibraries ()
{
  echo "Installing python libraries..."
  pip3 install bpython \
  sympy \
  matplotlib \
  neovim \
  jupyter;
}

installNPMLibraries ()
{
  echo "Installing npm applications...";
  npm install -g license-generator \
  nodemon \
  node-inspector \
  neovim \
  tern;
}

installVim ()
{
  echo "Setting up Vim...";
  curl -s --create-dirs -o ~/.vim/colors/Tomorrow-Night.vim https://gitlab.com/simonbreiter/config/raw/master/.vim/colors/Tomorrow-Night.vim;

  echo "Setting up Nvim...";
  curl -s --create-dirs -o ~/.config/nvim/colors/Tomorrow-Night.vim https://gitlab.com/simonbreiter/config/raw/master/.vim/colors/Tomorrow-Night.vim;
  curl -s --create-dirs -o ~/.config/nvim/init.vim https://gitlab.com/simonbreiter/config/raw/master/.config/nvim/init.vim;

  echo "Installing vim plugins...";
  curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh;
  sh ./installer.sh ".local/share/dein";

  curl -s --create-dirs -o ~/.vimrc https://gitlab.com/simonbreiter/config/raw/master/.vimrc;
}

installTmux ()
{

  echo "Setting up Tmux..."
  curl -s -o ~/.tmux.conf https://gitlab.com/simonbreiter/config/raw/master/.tmux.conf
  echo "Load new tmux config..."
  tmux source-file ~/.tmux.conf
}

installOSXConfiguration ()
{

      echo "Download custom Keyboard Layout"
      cd ~/Library/Keyboard\ Layouts && curl -s -O https://gitlab.com/simonbreiter/config/raw/master/Library/Keyboard%20Layouts/coding.keylayout && cd

      echo "Deactivate ApplePressAndHoldEnabled..."
      defaults write -g ApplePressAndHoldEnabled -bool false

      echo "Faster key repeat..."
      defaults write NSGlobalDomain KeyRepeat -int 1
      defaults write NSGlobalDomain InitialKeyRepeat -int 10

      echo "Configure git..."
      git config --global user.name "Simon Breiter"
      git config --global user.email hello@simonbreiter.com
      git config --global core.editor "nvim"
}


if [ "$EUID" -eq 0 ]
then 
    echo "Please do not run as root. Abort."
    exit
else 

  echo " _       _ _         _     "
  echo "(_)_ __ (_) |_   ___| |__  "
  echo "| | '_ \| | __| / __| '_ \ "
  echo "| | | | | | |_ _\__ \ | | |"
  echo "|_|_| |_|_|\__(_)___/_| |_|"
  echo "\nWelcome, ${USER}. What do you like to install?\n"
	PS3='Choose: '
	options=("All" "Homebrew Apps" "Fish Shell" "Ruby Gems" "Python Libraries" "NPM Libraries" "VIM" "Tmux" "OS X Configuration" "Quit")

	select opt in "${options[@]}"

	do

	  case $opt in

        "All")
	     installHomebrewApps
	     installFishShell
	     installRubyGems
	     installPythonLibraries 
	     installNPMLibraries
	     installVim
	     installTmux
	     installOSXConfiguration
         break
         ;;

	    "Homebrew Apps")
	      installHomebrewApps
	      break
	      ;;

	    "Fish Shell")
	      installFishShell
	      break
	      ;;

	    "Ruby Gems")
	      installRubyGems
	      break
	      ;;

	    "Python Libraries")
	      installPythonLibraries 
	      break
	      ;;

	    "NPM Libraries")
	      installNPMLibraries
	      break
	      ;;

	    "VIM")
	      installVim
	      break
	      ;;

	    "Tmux")
	      installTmux
	      break
	      ;;

	    "OS X Configuration")
	      installOSXConfiguration
	      break
	      ;;

	    "Quit")
	      break
	      ;;

	     *) 
	      echo "Invalid option";;

	  esac

	done

fi
