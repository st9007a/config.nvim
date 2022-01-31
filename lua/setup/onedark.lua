local onedark = require('onedark')

onedark.setup {
  style = 'darker',
  transparent = true,
  diagnostics = {
    background = false,  -- disable default background
  },
}
onedark.load()
