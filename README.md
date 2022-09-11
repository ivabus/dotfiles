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

packages: `sway swaybg swaylock swayidle alacritty waybar nemo firefox breeze breeze-gtk breeze-icons pulseaudio pavucontrol awesome-terminal-fonts ttf-jetbrains-mono wf-recorder slurp fzf`

aur: `sway-launcher-desktop poweralertd qt5-styleplugins qt6gtk2`

font: `JetBrains Mono`


## Install all dotfiles dependencies on Arch Linux

```sh
pacman -S $(curl -fsSL https://ivabus.dev/pkgs)
```

Then install AUR pkgs listed in https://ivabus.dev/aur
