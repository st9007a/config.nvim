local version = vim.version()

if (version.minor > 6) then
  vim.g.do_filetype_lua = 1
  vim.g.did_load_filetypes = 0
end


require('plugins')
require('options')
require('mappings')
require('filetype')
require('highlight')

-- vim.cmd [[set rtp+=/Users/st9007a/.config/nvim/docstring_generator]]
