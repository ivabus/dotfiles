# ivabus-dotfiles

Features:

- zshrc ([oh-my-zsh](https://ohmyz.sh) + [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
- [ivabus-zsh-theme](https://github.com/ivabus/ivabus-zsh-theme)
- neovim config (no plugins)
- alacritty config (Solarized Dark, 60x20, JetBrains Mono)
- Jetbrains Mono installation (macOS or Linux)
- macOS-specific configuration ([Homebrew](https://brew.sh), git gpg fixing, alacritty)

During the installation you can configure git by embedded configurator:

 - user.name
 - user.email
 - core.editor
 - code signing

```sh
sh -c "$(curl -fsSL https://ivabus.dev/dotfiles)"
```

### Upgrading dotfiles

Just run `upgrade_dotfiles` in your shell. Script will `git pull`, then relink old dotfiles, link new if needed and upgrade oh-my-zsh.


## sway and waybar
![screenshot](https://user-images.githubusercontent.com/71599788/187368639-4b7ed27a-4f42-4cd1-83c7-0b6dd87cd37c.png)
![screenshotMenu](https://user-images.githubusercontent.com/71599788/187368647-ad1b7e83-3eef-4989-94c8-c5888daec814.png)
https://user-images.githubusercontent.com/71599788/187483336-1cd64538-a191-47e5-8935-adfd720c6530.mp4

packages: `sway swaybg swaylock swayidle alacritty waybar pcmanfm-qt firefox breeze breeze-gtk fzf`

aur: `sway-launcher-desktop`

font: `JetBrains Mono`


## Install all dotfiles dependencies on Arch Linux

```sh
pacman -S $(curl -fsSL https://ivabus.dev/pkgs)
```
