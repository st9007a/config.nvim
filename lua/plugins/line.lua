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
    end
  },
})
