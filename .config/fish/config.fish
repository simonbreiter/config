## Expanded pwd
set -U fish_prompt_pwd_dir_length 0

## Prompt
function fish_prompt
    set_color green 
    echo -n (whoami)@(hostname -s)
    echo -n " "
    set_color blue 
    echo (prompt_pwd)
    echo '> '
end

# vi keybindings
fish_vi_key_bindings

## Alias

# Shortcuts
alias v='nvim'
alias l='ls -lFh'
alias lp='ls -lFh | awk "{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o \",k);print}"'
alias la='ls -lFah'
alias c='clear'
alias q='exit'
alias du='du -ch'
alias df='df -H'
alias t='tmux'
alias de='docker exec'
# Navigation
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
# Helpers
alias motd='/etc/motd.sh'
# Pass halt/reboot via sudo
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
# Safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# Networking
alias myip='curl ipinfo.io/ip'
# User Management
alias listuser='cut -d: -f1 /etc/passwd'
alias changemac='sudo ifconfig en0 ether (openssl rand -hex 6 | sed \'s/\(..\)/\1:/g; s/.$//\')'
alias update-config='bash -c "sh <(curl -s https://gitlab.com/simonbreiter/config/raw/master/.init.sh)"'

# Homebrew
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH

# For ruby without sudo
set PATH ~/.gem/ruby/2.0.0/bin $PATH

## MOTD
function fish_greeting
    /etc/motd.sh
end

# Editor
#set --export EDITOR "vim"

# Language
set --export LC_ALL "en_US.UTF-8"
set --export LANG "en_US.UTF-8"

## Colors

set fish_color_param blue red
set fish_color_command red
set fish_color_autosuggestion 777777
set fish_pager_color_prefix red 
set fish_pager_color_progress blue
set fish_color_search_match --background=31343a
