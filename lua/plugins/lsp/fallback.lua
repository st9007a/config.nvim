local null_ls = require('null-ls')
local u = require("null-ls.utils")

null_ls.setup {
  root_dir = u.root_pattern(
     ".null-ls-root",
     "Makefile",
     ".git",
     "pyproject.toml",
     "setup.py",
     "setup.cfg",
     "Cargo.toml"
   ),
  sources = {
    null_ls.builtins.formatting.trim_whitespace.with({
      disabled_filetypes = { "rust" },
    }),
    null_ls.builtins.formatting.trim_newlines.with({
      disabled_filetypes = { "rust" },
    }),
    null_ls.builtins.formatting.isort.with({
      filetypes = { "python" },
    }),
    null_ls.builtins.diagnostics.flake8.with({
      filetypes = { "python" },
    }),
    null_ls.builtins.code_actions.gitsigns,
  }
}
