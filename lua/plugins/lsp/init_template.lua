require('plugins/lsp/fallback')

local lspsaga = require('lspsaga')
local lspconfig = require('lspconfig')
local completion = require('plugins/lsp/completion')

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

  vim.api.nvim_command('autocmd BufWritePre * lua vim.lsp.buf.formatting()')
  vim.api.nvim_command('autocmd CursorHoldI,CursorMovedI * Lspsaga signature_help')
end

lspsaga.init_lsp_saga()

vim.api.nvim_set_keymap('n', '<space>t', '<cmd>Lspsaga open_floaterm<CR>', {noremap=true})
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

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {
    "HOME/.config/nvim/lib/lua/lua-language-server/bin/lua-language-server"
  },
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
