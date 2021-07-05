# ~/.bash_profile

[[ -s ~/.bashrc ]] && source ~/.bashrc

# remove OSX Catalina ''default interactive shell is now zsh' msg
export BASH_SILENCE_DEPRECATION_WARNING=1

# enable colors in bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# fosfo's bash prompt
function parse_npm_info {
  if [ -e "package.json" ]; then
    PKG_NAME=$(cat package.json 2> /dev/null | grep name | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')
    PKG_VER=$(cat package.json 2> /dev/null | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",]//g' | tr -d '[[:space:]]')
    echo "" $PKG_NAME $PKG_VER
  fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="$GREEN\u@\h $BLUE\w$GREEN\$(parse_git_branch)$YELLOW\$(parse_npm_info) $BLUE\$ $RESETCOLOR"
}
prompt

