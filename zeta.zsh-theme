# Zeta theme for oh-my-zsh
# Tested on Linux, Unix and Windows under ANSI colors.
# Copyright: Skyler Lee, 2015

# Colors: black|red|blue|green|yellow|magenta|cyan|white
local black=$fg[black]
local red=$fg[red]
local blue=$fg[blue]
local green=$fg[green]
local yellow=$fg[yellow]
local magenta=$fg[magenta]
local cyan=$fg[cyan]
local white=$fg[white]

local black_bold=$fg_bold[black]
local red_bold=$fg_bold[red]
local blue_bold=$fg_bold[blue]
local green_bold=$fg_bold[green]
local yellow_bold=$fg_bold[yellow]
local magenta_bold=$fg_bold[magenta]
local cyan_bold=$fg_bold[cyan]
local white_bold=$fg_bold[white]

local highlight_bg=$bg[red]

local zeta='ζ'
VIRTUAL_ENV_DISABLE_PROMPT=true

# Machine name.
function get_box_name {
    if [ -f ~/.box-name ]; then
        cat ~/.box-name
    else
        echo $HOST
    fi
}

# User name.
function get_usr_name {
    local name="%n"
    if [[ "$USER" == 'root' ]]; then
        name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
    fi
    echo $name
}

# Directory info.
function get_current_dir {
    echo "${PWD/#$HOME/~}"
}

# Git info.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$blue_bold%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$green_bold%} ✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$red_bold%} ✘ "

# Git status.
ZSH_THEME_GIT_PROMPT_ADDED="%{$green_bold%}+"
ZSH_THEME_GIT_PROMPT_DELETED="%{$red_bold%}-"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$magenta_bold%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$blue_bold%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$cyan_bold%}="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$yellow_bold%}?"

# Git sha.
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="[%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

function get_git_prompt {
    if [[ -n $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
        local git_status="$(git_prompt_status)"
        if [[ -n $git_status ]]; then
            git_status="[$git_status%{$reset_color%}]"
        fi
        local git_prompt=" <$(git_prompt_info)$git_status>"
        echo $git_prompt
    fi
}

function get_time_stamp {
    echo "%*"
}

function get_space {
    local str=$1$2
    local zero='%([BSUbfksu]|([FB]|){*})'
    local len=${#${(S%%)str//$~zero/}}
    local size=$(( $COLUMNS - $len - 1 ))
    local space=""
    while [[ $size -gt 0 ]]; do
        space="$space "
        let size=$size-1
    done
    echo $space
}

function get_virtualenv_prompt {
    local virtualenv_path="$VIRTUAL_ENV"
    if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
        echo "(%{$green%}$(basename $virtualenv_path)%{$reset_color%})"
    else
        echo ""
    fi
}

function build_left_prompt {
    # Left
    local user="%{$blue%}# %{$green_bold%}$(get_usr_name)"
    local user_machine_join="%{$blue%}@"
    local machine="%{$cyan_bold%}$(get_box_name)"
    local user_dir_join="%{$cyan_bold%}: "
    local dir="%{$yellow_bold%}$(get_current_dir)%{$reset_color%}"
    local git_prompt="$(get_git_prompt)"
    local venv_prompt="$(get_virtualenv_prompt)"

    local max_size=$(( $COLUMNS - 13 ))

    local left_prompt="$user$user_machine_join$machine$user_dir_join$dir$git_prompt$venv_prompt"
    local zero='%([BSUbfksu]|([FB]|){*})'
    local len=${#${(S%%)left_prompt//$~zero/}}

    if [[ $len -lt $max_size ]]; then
        echo $left_prompt
        return
    fi

    left_prompt="$user$user_dir_join$dir$git_prompt$venv_prompt"
    len=${#${(S%%)left_prompt//$~zero/}}

    if [[ $len -lt $max_size ]]; then
        echo $left_prompt
        return
    fi

    if [[ -n $VIRTUAL_ENV ]]; then
        venv_prompt="(🐍)"
    fi

    left_prompt="$user$user_dir_join$dir$git_prompt$venv_prompt"
    len=${#${(S%%)left_prompt//$~zero/}}

    if [[ $len -lt $max_size ]]; then
        echo $left_prompt
        return
    fi

    left_prompt="$user$user_dir_join$dir$venv_prompt"
    len=${#${(S%%)left_prompt//$~zero/}}

    if [[ $len -lt $max_size ]]; then
        echo $left_prompt
        return
    fi

    left_prompt="$user$user_dir_join$venv_prompt"
    echo $left_prompt
}

# Prompt: # USER@MACHINE: DIRECTORY <BRANCH [STATUS]> --- (TIME_STAMP)
# > command
function print_prompt_head {
    # Left
    local left_prompt="$(build_left_prompt)"
    # Right
    local right_prompt="%{$blue%}($(get_time_stamp))%{$reset_color%} "

    print -rP "$left_prompt$(get_space $left_prompt $right_prompt)$right_prompt"
}

function get_prompt_indicator {
    if [[ $? -eq 0 ]]; then
        echo "%{$magenta_bold%}$zeta %{$reset_color%}"
    else
        echo "%{$red_bold%}$zeta %{$reset_color%}"
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst

PROMPT='$(get_prompt_indicator)'
