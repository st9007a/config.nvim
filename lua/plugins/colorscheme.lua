local catppuccin = require("catppuccin")

catppuccin.setup({
  styles = {
    comments = "italic",
    functions = "bold",
    keywords = "italic",
    strings = "NONE",
    variables = "NONE",
  },
  integration = {
    lsp_trouble = true,
    lsp_saga = true,
  },
})

vim.g.catppuccin_flavour = "mocha"

vim.cmd[[colorscheme catppuccin]]
