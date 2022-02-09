local telescope = require('telescope')

telescope.setup {
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
  [[<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<CR>]],
  keymap_options
)
vim.api.nvim_set_keymap(
  'n',
  '<space>s',
  [[<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<CR>]],
  keymap_options
)
vim.api.nvim_set_keymap(
  'n',
  '<space>b',
  [[<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<CR>]],
  keymap_options
)
vim.api.nvim_set_keymap(
  'n',
  '<space>r',
  [[<cmd>lua require'telescope.builtin'.treesitter()<CR>]],
  keymap_options
)
