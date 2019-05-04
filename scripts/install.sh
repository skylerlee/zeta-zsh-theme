#!/usr/bin/env bash

THEME_ZSH_FILE=https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/zeta.zsh-theme

function fetch_file {
  local file_url="$1"
  local dest_dir="$2"
  local file_name=${file_url##*/}
  mkdir -p $dest_dir
  curl -fsSL "$file_url" > $dest_dir/$file_name
}

function set_theme {
  sed -i.bak -e "s/^ZSH_THEME=[\"']\?[A-Za-z0-9\._-]\+[\"']\?/ZSH_THEME=\"$1\"/1" $HOME/.zshrc
}

fetch_file $THEME_ZSH_FILE $ZSH_CUSTOM/themes
set_theme zeta
env zsh -l
