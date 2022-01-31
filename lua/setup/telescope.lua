local telescope = require('telescope')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  file_browser = {
    theme = "ivy",
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local keymap_options = { noremap = true }

vim.api.nvim_set_keymap('n', '`', '<cmd>Telescope file_browser<CR>', keymap_options)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>Telescope find_files<CR>', keymap_options)
vim.api.nvim_set_keymap('n', '<space>b', '<cmd>Telescope buffers<CR>', keymap_options)
