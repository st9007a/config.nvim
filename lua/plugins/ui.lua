vim.api.nvim_set_keymap('n', '`', ':NvimTreeToggle<CR>', {noremap = true})

require('nvim-web-devicons').setup {}
require('lualine').setup({
  options = {
    theme = 'catppuccin',
  }
})

require("bufferline").setup({
  options = {
    numbers = "none",
    separator_style = "slant",
    show_buffer_icons = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
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
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_open = '-',
          arrow_closed = '+',
        },
      },
    },
  },
})

require('toggleterm').setup({
  open_mapping = [[<C-\>]],
  insert_mappings = false,
  direction = 'tab',
})
