#!/bin/sh

installHomebrewApps()
{
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Installing homebrew applications..."
  brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265;
  brew install fdk-aac;
  brew install git;
  brew install git-flow;
  brew install imagemagick;
  brew install irssi;
  brew install mysql;
  brew install nmap;
  brew install node;
  brew install pandoc;
  brew install python3;
  brew install the_silver_searcher;
  brew install tmux;
  brew install vim --with-lua;
  brew install tesseract --with-all-languages;
  brew install leptonica;
  brew install cmake;
  brew install python3;
  brew install homebrew/php/wp-cli;
  brew install potrace;
  brew install ctags;
  brew install composer;
  brew install pypy;
  brew install ack;
  brew install figlet;
  brew link libtool;
  brew install neovim;
  brew install fish;
  brew install reattach-to-user-namespace;
  brew install curl --with-nghttp2;
  brew link curl --force;
  brew install htop;
  brew install jq;
  brew install ledger;
  brew install gdb;
  echo "set startup-with-shell off" >> ~/.gdbinit

  echo "Installing homebrew cask applications...";
  brew tap caskroom/cask;
  brew tap caskroom/versions;
  brew cask install java7;
  brew cask install firefoxdeveloperedition;
  brew cask install telegram;
  brew cask install dropbox;
  brew cask install iterm2;
  brew cask install appcleaner;
  brew cask install firefox;
  brew cask install skype;
  brew cask install virtualbox;
  brew cask install arduino;
  brew cask install fritzing;
  brew cask install mumble;
  brew cask install transmission;
  brew cask install vlc;
  brew cask install intellij-idea;
  brew cask install sequel-pro;
  brew cask install unity;
  brew cask install alfred;
  brew cask install blender;
  brew cask install grandperspective;
  brew cask install namechanger;
  brew cask install typora;
  brew cask install sourcetree;
  brew cask install metaz;
  brew cask install mysqlworkbench;
  brew cask install teamviewer;
  brew cask install slack;
  brew cask install logisim;
  brew cask install wireshark;
  brew cask install postman;
  brew cask install docker;
  brew cask install spotify;
  brew cask install google-chrome-canary;
  brew cask install transmit;
  brew cask install vmware-fusion;
  brew cask install micro-snitch;
  brew cask install little-snitch;
  brew cask install charles;
  brew cask install discord;
  brew cask install robo-3t;
  brew cask install pibakery;
  brew cask install pgadmin4;
  brew cask install keybase;
  brew cask install haskell-platform;
  brew cask install vcv-rack;
  brew cask install etcher;
  brew cask install dotnet-sdk;
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
  gem install sass --user-install;
  gem install scss_lint --user-install;
  gem install bropages --user-install;
  gem install cocoapods --user-install;
  gem install gollum --user-install;
  gem install bundler --user-install;
  gem install neovim --user-install;
  gem install iStats --user-install;
}

installPythonLibraries ()
{
  echo "Installing python libraries..."
  pip3 install bpython;
  pip3 install sympy;
  pip3 install matplotlib;
  pip3 install neovim;
  pip3 install jupyter;
}

installNPMLibraries ()
{
  echo "Installing npm applications...";
  npm install -g license-generator;
  npm install -g nodemon;
  npm install -g node-inspector;
  npm install -g neovim;
  npm install -g tern;
  npm install -g resume-cli;
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
	options=("All" "Homebrew Apps" "Fish Shell" "Gems" "Python Libraries" "NPM Libraries" "VIM" "Tmux" "OS X Configuration" "Quit")

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

	    *) echo "Invalid option";;

	  esac

	done

fi
