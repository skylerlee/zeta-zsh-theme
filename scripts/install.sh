#!/usr/bin/env bash

THEME_ZSH_FILE=https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh

function fetch_file {
  local file_url="$1"
  local dest_dir="$2"
  local file_name=${file_url##*/}
  mkdir -p $dest_dir
  curl -fsSL "$file_url" > $dest_dir/$file_name
}

fetch_file $THEME_ZSH_FILE $ZSH_CUSTOM/themes
