# Minimal Vim Configuration

This repository contains a **minimal and stable Vim configuration**.  
Designed for daily coding with a VS Code–like experience, without unnecessary complexity.

> This configuration is for **Vim**, not Neovim.  
> Do **not** place it inside `~/.config`.

---

## Installation

Copy the Vim config file to your **home directory**:

```bash
cp vimrc ~/.vimrc
````

---

##  Prerequisites

Install **vim-plug** (plugin manager):

```bash
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

---

## Install Plugins

Open Vim:

```bash
vim
```

Then run:

```vim
:PlugInstall
```

Restart Vim after installation is complete.

---

##  Features

* Stable syntax highlighting (regex-based)
* VS Code–like UI & keybindings
* File explorer (NERDTree)
* Fuzzy search (fzf)
* Auto-completion with **coc.nvim**
* Emmet for HTML/CSS
* Git integration
* WakaTime support
* Lightweight & fast

---

## Notes

* Configuration file location: `~/.vimrc`
* Plugin directory: `~/.vim/`
* This setup avoids Tree-sitter and keeps Vim **simple and predictable**

---
