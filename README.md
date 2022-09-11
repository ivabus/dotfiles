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
![screenshot](https://user-images.githubusercontent.com/71599788/189524925-88d0e5e0-cff4-45c2-884a-d84d5813040f.png)



https://user-images.githubusercontent.com/71599788/187484410-bd57e08e-8cca-4d09-9ee4-dfb6caec8dec.mp4



packages: `sway swaybg swaylock swayidle alacritty waybar pcmanfm-qt firefox breeze breeze-gtk fzf`

aur: `sway-launcher-desktop`

font: `JetBrains Mono`


## Install all dotfiles dependencies on Arch Linux

```sh
pacman -S $(curl -fsSL https://ivabus.dev/pkgs)
```
