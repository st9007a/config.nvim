# My NeoVim Configuration

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
- Lua
- Rust

### TODO

The following languages will be supported soon (maybe).

- C/C++
- Markdown

## Requirements

- neovim >= v0.6.1
- packer.nvim: [https://github.com/wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- ripgrep (for telescope.nvim): [https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)

## Installation

```bash
$ git clone https://github.com/st9007a/config.nvim.git ~/.config/nvim
$ cd ~/.config/nvim
$ git submodule update --init --recursive
$ nvim +PackerSync
```

And then, launch nvim and install treesitter parsers in vim command line:

```
:TSInstall python
:TSInstall lua
:TSInstall query
:TSInstall rust
```

### Optional

- pyright: [https://github.com/microsoft/pyright](https://github.com/microsoft/pyright)
  - To install pyright, you need to install `node.js`.

- lua-language-server: [https://github.com/sumneko/lua-language-server](https://github.com/sumneko/lua-language-server)
  - To build lua-language-server, you need to install [ninja](https://github.com/ninja-build/ninja).
  - Its a submodule in `lib/lua/lua-language-server`. Use following command to install it:

```bash
$ cd lib/lua/lua-language-server/3rd/luamake
$ ./compile/install.sh
$ cd ../..
$ ./3rd/luamake/luamake rebuild
```

Or,

```bash
$ ./install_lua_language_server.sh
```

- rust-analyzer: [https://github.com/rust-analyzer/rust-analyzer](https://github.com/rust-analyzer/rust-analyzer)

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
  - Kanawaga color scheme
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

### Telescope

Hot keys of telescope plugin start by `<space>`

- File finder: `<space>s`
- Live grep: `<space>g`
- Buffer list: `<space>b`
- Treesitter-parsed token list: `<space>r`

All windows can be closed via double `<esc>`.
First `<esc>` is for leaving insert mode.
Second `<esc>` is for closing floating windows.


### UI

Hot key of file explorer is "\`".
Hot key to toggle a terminal is `<C-\>`.

### Text Object

Hot keys of text objects follow naive vim configuration. Start by `i` for inner, `a` for outer:

- Function: `if`, `af`
- Class: `ic`, `ac`
- Loop: `il`, `al`
- Conditional: `ii`, `ai`
- Block: `ib`, `ab`


### Others

Hot keys to toggle comment:

- In insert mode: `gcc`
- In virtual mode: `gc`

Hot keys of cursor moving behaviours start by `[` or `]`:

- Jump to previous/next diagnoistcs: `[e` and `]e`
- Jump to previous/next function: `[m` and `]m`
- Jump to previous/next class: `[c` and `]c`

Hot keys to swap functions or function parameters also start by `[` or `]`

- Swap function with previous/next function: `[f` and `]f`
- Swap function parameter with previous/next function parameter: `[p` and `]p`

## Roadmap

- Modularize current configuration.
- Add snippets.
- Adjust colorscheme.

## Known Issues

- `lspsaga.nvim`: It will auto jump into floating window when hovering is called twice.
    This make hovering can't be hooked to `CurosrHoldI`. (To fix it, use 14c2f49)
