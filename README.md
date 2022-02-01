# Neovim Config

I quitted `coc.nvim` and chose neovim builtin lsp.

My personal neovim config based on lua.
Aim to improve work experience of terminal-side development.

It contains some famous neovim plugins including but not limited:
- nvim-lspconfig
- nvim-treesitter
- telescope.nvim

## Supported Languages

- Python 3

### TODO

The following languages will be supported soon (maybe).

- Rust
- C/C++
- Lua
- Markdown

## Requirements

- neovim >= v0.6.1
- packer.nvim: [https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- pyright: [https://github.com/microsoft/pyright](https://github.com/microsoft/pyright)
  - To install pyright, you need to install `node.js`.

## Configuration

```bash
$ git clone https://github.com/st9007a/NeovimConfig.git ~/.config/nvim
$ cd ~/.config/nvim
$ git submodule update --init --recursive
$ ./configure.sh
$ nvim +PackerSync
```

## Features

- Language server protocal.
- Some features derived from treesitter.
  - Semantic highlighting.
  - Syntax-based text object.
- Bunches of telescope-based explorers
  - Builtin explorers
  - File browser
- Toggle comment in the code.
- UI
  - Onedark
  - Status line
  - Devicons


## Hotkey Mapping
