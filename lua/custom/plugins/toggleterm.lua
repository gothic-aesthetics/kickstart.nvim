return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    float_opts = {
      border = 'double',
      title_pos = 'center',
    },
    persist_mode = true,
    close_on_exit = true,
    autochdir = false,
    open_mapping = [[<c-\>]],
    direction = 'float',
  },
}
