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
    'epwalsh/obsidian.nvim',
    lazy = true,
    -- ft = 'markdown',
    vim.api.nvim_set_keymap('v', '<Leader>ox', ':ObsidianExtractNote<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('v', '<Leader>oc', ':ObsidianLinkNew<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>og', ':ObsidianFollowLink<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>on', ':ObsidianNew<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>ot', ':ObsidianDailies<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>os', ':ObsidianSearch<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>oi', ':ObsidianPasteImage<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>ol', ':ObsidianLinks<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>ox', ':ObsidianExtractNote<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>ob', ':ObsidianBacklinks<CR>', { noremap = true, silent = true }),
    vim.api.nvim_set_keymap('n', '<Leader>or', ':ObsidianRename<CR>', { noremap = true, silent = true }),

    event = {
      'BufReadPre /home/shnk/Documents/obsVault/*.md',
      'BufReadPre /home/shnk/Documents/obsVault/*.md',
      'BufNewFile /home/shnk/Documents/obsVault/*/*.md',
      'BufNewFile /home/shnk/Documents/obsVault/*/*.md',
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      workspaces = {
        {
          name = 'main workspace',
          path = '~/Documents/obsVault',
        },
      },
      mappings = {
        ['<leader>nn'] = {
          action = function()
            return '<cmd>ObsidianNew<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>ot'] = {
          action = function()
            return '<cmd>ObsidianDailies<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>of'] = {
          action = function()
            return '<cmd>ObsidianSearch<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>op'] = {
          action = function()
            return '<cmd>ObsidianPasteImg<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>ol'] = {
          action = function()
            return '<cmd>ObsidianLinks<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>oc'] = {
          action = function()
            return '<cmd>ObsidianLinkNew<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>ox'] = {
          action = function()
            return '<cmd>ObsidianExtractNote<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>ob'] = {
          action = function()
            return '<cmd>ObsidianBacklinks<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>os'] = {
          action = function()
            return '<cmd>ObsidianSearch<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>or'] = {
          action = function()
            return '<cmd>ObsidianRename<CR>'
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },
    },

    ---@param title string|?
    ---@return.string
    note_id_func = function(title)
      local suffix = ''
      if title ~= nil then
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    callbacks = {
      -- Runs right before writing the buffer for a note.
      ---@param client obsidian.Client
      ---@param note obsidian.Note
      ---@diagnostic disable-next-line: unused-local
      pre_write_note = function(client, note)
        local util = require 'obsidian.util'

        if not note.title then
          local title = util.input 'Enter title: '
          if not title or string.len(title) == 0 then
            return
          end

          note.title = title
          local insert_at = 0
          if note.frontmatter_end_line ~= nil then
            insert_at = note.frontmatter_end_line + 1
          end
          vim.api.nvim_buf_set_lines(0, insert_at, insert_at, false, { '# ' .. title })
        end
      end,
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
      -- vim.cmd.colorscheme 'kanagawa-dragon'

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    config = function()
      -- Lua initialization file
      vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋' }
      vim.g.moonflyWinSeparator = 2
      vim.o.termguicolors = true
      vim.cmd 'colorscheme moonfly'
    end,
  },

  {
    'xero/evangelion.nvim',
    lazy = false,
    priority = 100,
  },
}
