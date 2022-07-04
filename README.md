# ivabus-dotfiles

## Default dotfiles installation

- zshrc (oh-my-zsh + autosuggestion + syntax highlighting) ([oh-my-zsh](https://ohmyz.sh) + [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/) + [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting))
- [ivabus-zsh-theme](https://github.com/ivabus/ivabus-zsh-theme)
- nvim config

```sh
sh -c "$(curl -fsSL https://ivabus.dev/dotfiles)"
```

### Upgrading dotfiles

Just run `upgrade_dotfiles` in your shell. Script will `git pull`, then relink old dotfiles, link new if needed and upgrade oh-my-zsh.
