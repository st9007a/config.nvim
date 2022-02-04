vim.g.nvim_tree_icons = {
  folder = {
    arrow_open = '-',
    arrow_closed = '+',
  },
}
vim.o.termguicolors = true

vim.api.nvim_set_keymap('n', '`', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>a', ':ToggleTermToggleAll<CR>', {noremap = true})

require('nvim-web-devicons').setup {}
require('lualine').setup({
  options = {
    theme = 'onedark'
  }
})

require("bufferline").setup({
  options = {
    numbers = "buffer_id",
    separator_style = "slant",
    show_buffer_icons = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = '',
        highlight = "Directory",
        text_align = "left"
      },
    },
  },
})

require('nvim-tree').setup({
  view = {
    mappings = {
      list = {
        { key = 'v', action = 'vsplit' },
        { key = 's', action = 'split' },
        { key = 'rm', action = 'remove' },
        { key = 'dd', action = 'cut' },
        { key = 'yy', action = 'copy' },
      },
    },
  },
})

require('toggleterm').setup({
  open_mapping = [[<space>t]],
  insert_mappings = false,
})
