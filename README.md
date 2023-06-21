# ivabus-dotfiles

Features:

- swaywm (sway, waybar, qt5ct, mako)
- zshrc ([zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
- [ivabus-zsh-theme](https://github.com/ivabus/ivabus-zsh-theme)
- neovim config (no plugins)
- alacritty config (Solarized Dark, 60x20, JetBrains Mono)
- Jetbrains Mono installation (macOS or Linux)
- macOS-specific configuration ([Homebrew](https://brew.sh), git gpg fixes, alacritty)

During the installation you can configure git by embedded configurator:

 - user.name
 - user.email
 - core.editor
 - code signing

```sh
curl iva.bz/d | sh
```

### Upgrading dotfiles

Just run `upgrade_dotfiles` in your shell. Script will `git pull`, then relink old dotfiles, link new if needed and upgrade oh-my-zsh.

# screenshot
#![screenshot-2022-12-08_18-08-29](https://user-images.githubusercontent.com/71599788/206481983-5dac2d62-5aea-4ccf-990a-b9ee6d53422f.png)

[Repo Packages](https://ivabus.dev/pkgs), [AUR packages](https://ivabus.dev/aur).

## Environment

TODO: description

```sh
sh <(curl https://ivabus.dev/env)
```
