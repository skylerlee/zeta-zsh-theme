# Zeta ZSH Theme

Another :star:theme for oh-my-zsh

## Installation

### Via curl

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh)"
```

### Manually

1. Copy file `zeta.zsh-theme` to `$ZSH_CUSTOM/themes` folder.
(You may need to create `themes` folder if it doesn't exist)
2. Set theme to `zeta` in `~/.zshrc`:

```
ZSH_THEME="zeta"
```

## Screenshot

![screenshot](screenshot.png)

## Features

* User name
* Machine name
* Current working directory
* Git branch
* Git status
    * `✔` —— Clean branch
    * `✘` —— Dirty branch
    * `+` —— Added files
    * `-` —— Deleted files
    * `*` —— Modified files
    * `>` —— Renamed files
    * `=` —— Unmerged changes
    * `?` —— Untracked changes
* Prompt indicator turns red if the last run fails

## Notice

It would be better to put theme file into the `$ZSH_CUSTOM` folder, instead of
`~/.oh-my-zsh/themes`.
Because files under `~/.oh-my-zsh/custom/` folder are ignored by git, and will
leave the working directory clean.

You can get more help from oh-my-zsh:
[Custom Theme](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization#overriding-and-adding-themes)

## License

The MIT License.
