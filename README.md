# ζ(Zeta) ZSH Theme

Another :star:theme for oh-my-zsh

## Screenshot

![screenshot](https://user-images.githubusercontent.com/6789491/57182938-68197180-6ed8-11e9-9171-74b4618be62f.jpg)

## Installation

### Via curl

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh)"
```

### Fig


Install `zeta-zsh-theme` with [Fig](https://fig.io) in just one click.

<a href="https://fig.io/plugins/other/zeta-zsh-theme_skylerlee" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg" /></a>

### Manually

1. Copy file `zeta.zsh-theme` to `$ZSH_CUSTOM/themes` folder.
(You may need to create `themes` folder if it doesn't exist)
2. Set theme to `zeta` in `~/.zshrc`:

```
ZSH_THEME="zeta"
```

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
