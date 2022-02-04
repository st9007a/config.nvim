local onedark = require('onedark')

onedark.setup {
  style = 'darker',
  transparent = false,
  diagnostics = {
    background = false,  -- disable default background
  },
}
onedark.load()
