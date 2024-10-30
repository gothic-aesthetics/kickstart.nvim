return {
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1000,
    config = function()
      local plugin = require 'no-clown-fiesta'
      plugin.setup()
      vim.cmd [[colorscheme no-clown-fiesta]]
      return plugin.load()
    end,
    lazy = false,
  },
}
