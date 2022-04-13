vim.o.number = true
vim.o.wrap = false
vim.o.backspace = 'indent,eol,start'
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.inccommand = 'nosplit'
vim.o.wildignorecase = true
vim.o.updatetime = 1000
vim.o.termguicolors = true

if vim.fn.executable('rg') ~= 0 then
  vim.o.grepprg = 'rg --no-heading --vimgrep --smart-case'
  vim.o.grepformat = '%f:%l:%c:%m'
end
