require('plugins/lsp/fallback')

local lspsaga = require('lspsaga')
local lspconfig = require('lspconfig')
local completion = require('plugins/lsp/completion')

local table_copy = function(obj)
  local obj_copy = {}
  for k,v in pairs(obj) do
    obj_copy[k] = v
  end
  return obj_copy
end

local table_merge = function (t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

local on_attach = function(client, bufnr)

  local opts = { noremap=true, silent=true }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>Lspsaga lsp_finder<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>r', '<cmd>Lspsaga rename<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>Lspsaga code_action<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>s', '<cmd>Lspsaga signature_help<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>Lspsaga hover_doc<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'fmt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'v', 'fmt', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

  vim.api.nvim_command('autocmd BufWritePost * lua vim.lsp.buf.formatting()')
  vim.api.nvim_command('autocmd CursorHoldI * Lspsaga signature_help')
end

lspsaga.init_lsp_saga({
  code_action_icon = '',
})

local capabilities = completion.get_capabilities()

local servers = {
  'pyright',
  'sumneko_lua',
  'rust_analyzer',
}

local default_setup = {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
}


for _, server in ipairs(servers) do
  local setup = table_copy(default_setup)
  setup = table_merge(setup, require('plugins.lsp.' .. server))
  lspconfig[server].setup(setup)
end
