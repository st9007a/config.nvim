local comment = require('Comment')

comment.setup({
  toggler = {
    line = 'gcc',
    block = 'gc',
  },
})

require('todo').setup({
  keywords = {
    NOTE = { icon = " ", color = "hint", alt = { "INFO", "XXX" } }
  }
})

vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>TODOQuickfixList<CR>', { noremap = true, silent = true })
