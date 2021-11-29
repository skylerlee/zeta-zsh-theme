#!/usr/bin/env zsh

THEME_ZSH_FILE=https://raw.githubusercontent.com/gonzalezzfelipe/zeta-zsh-theme/master/zeta.zsh-theme
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

function init_colors {
  if which tput >/dev/null 2>&1; then
    local ncolors=$(tput colors)
  fi
  if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    RESET="$(tput sgr0)"
  else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    RESET=""
  fi
}

function fetch_file {
  local file_url="$1"
  local dest_dir="$2"
  local file_name=${file_url##*/}
  mkdir -p $dest_dir
  curl -fsSL "$file_url" > $dest_dir/$file_name
}

function set_theme {
  # https://en.wikipedia.org/wiki/Regular_expression#POSIX_basic_and_extended
  sed -i.bak -e "s/^ZSH_THEME=[\"']\{0,1\}[A-Za-z0-9\._-]*[\"']\{0,1\}/ZSH_THEME=\"$1\"/1" $HOME/.zshrc
}

echo "Installing ..."

fetch_file $THEME_ZSH_FILE $ZSH_CUSTOM/themes
set_theme zeta

printf "$GREEN"
echo "Welcome to use Zeta theme :)"
printf "$RESET"

env zsh -l
