local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.isort.with({
      filetypes = {"python"},
    }),
    null_ls.builtins.diagnostics.flake8.with({
      filetypes = {"python"},
    }),
    null_ls.builtins.code_actions.gitsigns,
  }
}
