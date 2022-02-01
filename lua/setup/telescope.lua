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
    },
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          ["<C-c>"] = fb_actions.create,
          ["<C-r>"] = fb_actions.rename,
          ["<C-d>"] = fb_actions.remove,
          ["<C-m>"] = fb_actions.move,
          ["<C-y>"] = fb_actions.copy,
          ["<C-h>"] = fb_actions.toggle_hidden,
        },
        ["n"] = {
          ["c"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["d"] = fb_actions.remove,
          ["m"] = fb_actions.move,
          ["y"] = fb_actions.copy,
          ["h"] = fb_actions.toggle_hidden,
        },
      },
    },
  },
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

local keymap_options = { noremap = true }

vim.api.nvim_set_keymap(
  'n',
  '<space>f',
  '<cmd>Telescope file_browser<CR>',
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
  '<bs>',
  [[<cmd>lua require'telescope.builtin'.treesitter()<CR>]],
  keymap_options
)
