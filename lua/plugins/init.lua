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

local packer_startup_fn = function ()
  packer.use 'wbthomason/packer.nvim'
  packer.use 'neovim/nvim-lspconfig'
  packer.use 'tami5/lspsaga.nvim'
  packer.use 'onsails/lspkind-nvim'
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
      'saadparwaiz1/cmp_luasnip',
    },
  }
  packer.use {
    'folke/trouble.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
  }
  packer.use {'L3MON4D3/LuaSnip'}
  packer.use {'rafamadriz/friendly-snippets'}
  packer.use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      {'nvim-treesitter/nvim-treesitter-textobjects'},
      {'nvim-treesitter/playground'},
    },
  }
  packer.use {
    'numToStr/Comment.nvim',
  }
  packer.use({
    "catppuccin/nvim",
    as = "catppuccin",
  })
  packer.use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
  }
  packer.use {
    'akinsho/bufferline.nvim',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    },
  }
  packer.use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        { 'kyazdani42/nvim-web-devicons' },
      },
  }
  packer.use { "akinsho/toggleterm.nvim" }
  packer.use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    }
  }
  packer.use {'windwp/nvim-autopairs'}
  packer.use {'lukas-reineke/indent-blankline.nvim'}
end

packer.startup(packer_startup_fn)


require('plugins/colorscheme')
require('plugins/ui')
require('plugins/comment')
require('plugins/treesitter')
require('plugins/git')
require('plugins/telescope')
require('plugins/lsp')
require('plugins/autopairs')
require('plugins/indent_blankline')
