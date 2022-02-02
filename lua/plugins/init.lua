local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

local packer = require('packer')

function packer_startup_fn()
  packer.use 'wbthomason/packer.nvim'
  packer.use 'neovim/nvim-lspconfig'
  packer.use 'tami5/lspsaga.nvim'
  packer.use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      {
        'lewis6991/gitsigns.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
      },
    },
  }
  packer.use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
    },
  }
  packer.use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      {'nvim-treesitter/nvim-treesitter-textobjects'},
    },
  }
  packer.use {
    'numToStr/Comment.nvim',
  }
  packer.use {'navarasu/onedark.nvim'}
  packer.use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons', opt = true},
    },
  }
  packer.use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-file-browser.nvim'},
    }
  }
end

packer.startup(packer_startup_fn)

require('plugins/onedark')
require('plugins/lualine')
require('plugins/comment')
require('plugins/treesitter')
require('plugins/git')
require('plugins/telescope')
require('plugins/lsp')
