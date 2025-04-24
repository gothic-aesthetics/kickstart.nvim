return {
  'folke/zen-mode.nvim',
  vim.api.nvim_set_keymap('n', '<Leader>zz', ':ZenMode<CR>', { noremap = true, silent = true }),
  opts = {
    plugins = {
      alacritty = {
        enabled = true,
      },
      tmux = {
        enabled = true,
      },
    },
  },

  on_open = function(win) end,

  on_close = function() end,
}
