# ivabus-dotfiles

Features:

- zshrc ([oh-my-zsh](https://ohmyz.sh) + [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
- [ivabus-zsh-theme](https://github.com/ivabus/ivabus-zsh-theme)
- neovim config
- alacritty config (breeze dark, 60x20, JetBrains Mono)
- Jetbrains Mono installation (macOS or Linux)
- macOS-specific configuration ([Homebrew](https://brew.sh), git gpg fixing, alacritty and JetBrains Mono installation)

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

![screenshot](https://user-images.githubusercontent.com/71599788/183604097-00cdab01-6b02-42a2-bdba-ecc02d346057.png)

packages: `sway swaybg swaylock swayidle alacritty waybar pcmanfm-qt firefox breeze breeze-gtk fzf`

aur: `sway-launcher-desktop`
