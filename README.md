# Neovim Config

I quitted `coc.nvim` and chose neovim builtin lsp.

My personal neovim config based on lua.
Aim to improve work experience of terminal-side development.

There are some advantages of this config:
- Use builtin LSP
- Use treesitter
- Enhance UI
- No remote plugins (which means you don't need to install neovim api wrapper of any other languages)
- Fast and light (almost plugins are based on lua)

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

And then, launch nvim and install treesitter parsers in vim command line:

```
:TSInstall python
:TSInstall lua
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


## LSP behaviours

There are some behaviours hooked to vim events by default:

- Auto-completion: triggered on typing.
- Show signature: triggered on cursor moving or holding in insert mode.
- Formatting: triggered before buffer saved.


## Hotkey Mapping

### LSP

Hot keys of "go to ..." start by `g`:

- Go to definition: `gd`
- Go to declaration: `gD`
- Go to type definition: `gt`
- Go to implementation: `gi`
- Go to references: `gr`

Hot keys of popup behaviours start by `<leader>`:

- Code action: `<leader>a`
- Code lens: `<leader>l`
- Rename: `<leader>r`
- Show diagnoistcs on current line: `<leader>d`
- Show document under cursor: `<leader>k`  (or `K` for convention)
- Show signature under cursor: `<leader>s`

Hot key of manually-triggered formatting is `fmt`:

- In normal mode, it will run `vim.lsp.buf.formatting()`
- In virtual mode, it will run `vim.lsp.buf.range_formatting()`

### Floating Windows

Hot keys of floating windows start by `<space>`

- File finder: `<space>s`
- File browser: `<space>f`
- Buffer list: `<space>b`
- Treesitter-parsed token list: `<space>r`
- Floating terminal: `<space>t`

All windows can be closed via double `<esc>`.
First `<esc>` is for leaving insert mode.
Second `<esc>` is for closing floating windows.


### Text Object

TODO

### Others

Hot keys to toggle comment:

- In insert mode: `gcc`
- In virtual mode: `gc`

Hot keys of cursor moving behaviours start by `[` or `]`:

- Jump to previous/next diagnoistcs: `[e` and `]e`
- Jump to previous/next function: `[m` and `]m`
- Jump to previous/next class: `[c` and `]c`

Hot keys to swap functions or function parameters start by `<left>` or `<right>`

- Swap function with previous/next function: `<left>f` and `<right>f`
- Swap function parameter with previous/next function parameter: `<left>p` and `<right>p`
