# My dotfiles

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

### Home-manager example

See [ivabus/nixos/common/dotfiles.nix](https://github.com/ivabus/nixos/blob/master/common/dotfiles.nix) for example

# screenshot

![screenshot-2024-01-06_10-36-35](https://github.com/ivabus/dotfiles/assets/71599788/07d6864e-6982-4137-b51e-e126235c0710)

## Environment

TODO: description

```sh
curl iva.bz/e | sh
```
