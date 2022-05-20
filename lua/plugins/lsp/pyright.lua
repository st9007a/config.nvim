local home = os.getenv('HOME')


local M = {
  settings = {
    python = {
      analysis = {
        typeshedPaths = {
          home .. '/.config/nvim/lib/python/typeshed',
        },
        stubPath = home .. '/.config/nvim/lib/python/python-type-stubs',
      },
    },
  },
}

return M
