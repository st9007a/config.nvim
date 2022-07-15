local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
}


-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

local keymap_options = { noremap = true }

vim.api.nvim_set_keymap(
  'n',
  '<space>g',
  [[<cmd>Telescope live_grep<CR>]],
  keymap_options
)
vim.api.nvim_set_keymap(
  'n',
  '<space>s',
  [[<cmd>Telescope find_files<CR>]],
  keymap_options
)
vim.api.nvim_set_keymap(
  'n',
  '<space>b',
  [[<cmd>Telescope buffers<CR>]],
  keymap_options
)
vim.api.nvim_set_keymap(
  'n',
  '<space>r',
  [[<cmd>Telescope treesitter<CR>]],
  keymap_options
)
