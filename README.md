# Neovim Config

My personal neovim config. The config files are modularized based on nvim lua api.
This configuration is optimized on work experience of language server protocol and benefit
development with Python and Git.

## Requirements

- pyright

## Configuration

For now, `configure.sh` works on MacOS only.

```bash
$ git clone https://github.com/st9007a/NeovimConfig.git ~/.config/nvim
$ cd ~/.config/nvim
$ git submodule update --init --recursive
$ ./configure.sh
```
