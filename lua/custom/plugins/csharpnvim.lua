return {
  'iabdelkareem/csharp.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'mfussenegger/nvim-dap',
    'Tastyep/structlog.nvim', -- for debuggin..?
  },
  config = function()
    require('mason').setup()
    require('csharp').setup()
  end,
  opts = {
    lsp = {
      roslyn = {
        enable = true,
        cmd_path = '$XDG_DATA_HOME/csharp/roslyn-lsp/',
      },
    },
  },
}
