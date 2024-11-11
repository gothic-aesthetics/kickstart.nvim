-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },

  {
    'mistricky/codesnap.nvim',
    build = 'make',
    keys = {
      { '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code into clipboard' },
      { '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code in ~/Pictures' },
    },
    opts = {
      save_path = '~/Pictures',
      has_breadcrumbs = true,
      -- bg_color = '#ffffff',
      bg_theme = 'grape',
      bg_padding = 20,
      watermark = '',
      mac_window_bar = false,
    },
  },

  {
    'natecraddock/workspaces.nvim',
    lazy = false,
    config = function()
      require('workspaces').setup {
        hooks = {
          open = { 'Neotree', 'Telescope find_files' },
        },
      }
    end,
  },

  {
    'https://gitlab.com/pandark/42header-vim',
    lazy = false,
    priority = 100,
    cmd = {
      'FortyTwoHeader',
    },
    keys = {
      { '<leader>tf', '<cmd>FortyTwoHeader<cr>', mode = 'n', desc = '42 header' },
    },
  },

  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  {
    'hardyrafael17/norminette42.nvim',
    config = function()
      local norminette = require 'norminette'
      norminette.setup {
        runOnSave = true,
        maxErrorsToShow = 10,
        active = true,
      }
    end,
  },

  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    ft = 'markdown',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      workspaces = {
        {
          name = 'main workspace',
          path = '~/Documents/obsidian-workspace/',
        },
      },
    },
    mappings = {
      ['fo'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
  },

  {
    'chaimleib/vim-renpy',
    lazy = false,
    priority = 100,
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000,

    config = function()
      require('kanagawa').setup {
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
      }
    end,

    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'kanagawa-dragon'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'xero/evangelion.nvim',
    lazy = false,
    priority = 100,
  },
}
