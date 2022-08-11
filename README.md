# ivabus-dotfiles

Features:

- zshrc ([oh-my-zsh](https://ohmyz.sh) + [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
- [ivabus-zsh-theme](https://github.com/ivabus/ivabus-zsh-theme)
- neovim config (no plugins)
- alacritty config (breeze dark, 60x20, JetBrains Mono)
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
![screenshotEmpty](https://user-images.githubusercontent.com/71599788/183670989-c5488e8b-674e-42c1-9e92-baed12451bac.png)
![screenshotMenu](https://user-images.githubusercontent.com/71599788/183671039-59552fa7-a6f2-443d-8ca4-1872c83aef52.png)
![screenshot](https://user-images.githubusercontent.com/71599788/183670970-7174f264-d41e-49af-b82b-191544965aea.png)

packages: `sway swaybg swaylock swayidle alacritty waybar pcmanfm-qt firefox breeze breeze-gtk fzf`

aur: `sway-launcher-desktop`

font: `JetBrains Mono`


## Install all dotfiles dependencies on Arch Linux

```sh
pacman -S $(curl -fsSL https://ivabus.dev/pkgs)
```
