local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local luasnip = require('luasnip')
local M = {}

cmp.setup({
  snippets = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources(
  {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  {
    { name = 'path' },
  },
  {
    { name = 'buffer' },
  }),
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.select_next_item(),
  },
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  },
  {
    { name = 'cmdline' },
  })
})

function M.get_capabilities()
  return cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

return M
