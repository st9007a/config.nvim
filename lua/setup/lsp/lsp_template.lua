require('setup/lsp/fallback')

local lspsaga = require('lspsaga')
local lspconfig = require('lspconfig')
local completion = require('setup/lsp/completion')

local on_attach = function(client, bufnr)

  local opts = { noremap=true, silent=true }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>Lspsaga rename<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>Lspsaga code_action<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>Lspsaga signature_help<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  vim.api.nvim_command('autocmd BufWritePost * lua vim.lsp.buf.formatting()')
  vim.api.nvim_command('autocmd CursorHoldI,CursorMovedI * Lspsaga signature_help')
end

lspsaga.init_lsp_saga()

vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Lspsaga open_floaterm<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<esc>', '<cmd>Lspsaga close_floaterm<CR>', {noremap=true})

local capabilities = completion.get_capabilities()

lspconfig.pyright.setup {
  on_attach = on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeshedPaths = {
          'HOME/.config/nvim/lib/python/typeshed',
        },
        stubPath = 'HOME/.config/nvim/lib/python/python-type-stubs',
      },
    },
  },
}
