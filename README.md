# ivabus-dotfiles

Features:

- zshrc ([oh-my-zsh](https://ohmyz.sh) + [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
- [ivabus-zsh-theme](https://github.com/ivabus/ivabus-zsh-theme)
- neovim config
- alacritty config (solarized dark, 60x20, JetBrains Mono)
- Jetbrains Mono installation (macOS or Linux)
- macOS-specific configuration ([Homebrew](https://brew.sh), git gpg fixing, alacritty and JetBrains Mono installation)
- sway configs (sway + waybar) (fzf required)
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

### Screenshot

![screen](https://user-images.githubusercontent.com/71599788/182587818-f04271c5-51f2-4275-84b6-98d71c8e5584.png)

## Dependencies

- sway
- zsh
- git
- pcmanfm-qt
- fzf
