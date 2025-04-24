return {
  'mistweaverco/discord.nvim',
  event = 'VeryLazy',
  config = function()
    require('discord').setup {
      auto_connect = true,
    }
  end,
}
