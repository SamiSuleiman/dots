return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        palette = {
          -- Override the builtin palette per variant
          main = {
            base = '#0d0d0d',
            surface = '#0d0d0d',
          },
          moon = {
            base = '#0d0d0d',
            surface = '#0d0d0d',
          },
        },
        -- this is useless now since we have a custom palette :)))) LETS GOOOOO
        highlight_groups = {
          SnacksInputPrompt = { bg = 'overlay' },
          SnacksInputNormal = { bg = 'overlay' },
          -- Normal = { bg = '#0d0d0d' },
          -- SignColumn = { bg = '#0d0d0d' },
          -- VertSplit = { bg = '#0d0d0d' },
          -- StatusLine = { bg = '#0d0d0d' },
          -- StatusLineNC = { bg = '#0d0d0d' },
          -- CurSearch = { fg = 'base', bg = 'rose', inherit = false },
          -- Search = { fg = 'text', bg = 'rose', blend = 20, inherit = false },
          -- TelescopeBorder = { fg = 'surface', bg = '#0d0d0d' },
          -- TelescopeNormal = { fg = 'subtle', bg = '#0d0d0d' },
          -- -- TelescopeSelection = { fg = 'text', bg = 'highlight_med' },
          -- -- TelescopeSelectionCaret = { fg = 'love', bg = 'highlight_med' },
          -- -- TelescopeMultiSelection = { fg = 'text', bg = 'highlight_high' },
          -- TelescopeTitle = { fg = 'base', bg = 'love' },
          -- TelescopePromptTitle = { fg = 'base', bg = 'pine' },
          -- TelescopePreviewTitle = { fg = 'base', bg = 'iris' },
          -- TelescopePromptNormal = { fg = 'text', bg = '#0d0d0d' },
          -- TelescopePromptBorder = { fg = 'surface', bg = '#0d0d0d' },
        },
      }
      vim.cmd 'colorscheme rose-pine-moon'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    enabled = false,
    config = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = true,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = 'hard', -- can be "hard", "soft" or empty string
        palette_overrides = {
          -- bright_green = '#990000',
        },
        overrides = {
          -- SignColumn = { bg = '#282828' },
          ['@punctuation.bracket'] = { fg = '#E4D4AD' },
          ['@punctuation.special'] = { fg = '#E5D4AD' },
          ['@punctuation'] = { fg = '#E4D4AD' },
          ['@symbol'] = { fg = '#E4D4AD' },
          ['@operator'] = { fg = '#E5D4AD' },
        },
        dim_inactive = false,
        transparent_mode = true,
      }
      vim.cmd 'colorscheme gruvbox'
      local highlight = vim.api.nvim_set_hl

      --change statlus line background color
      highlight(0, 'StatusLine', { bg = '#151718' })
      highlight(0, 'StatusLineNC', { bg = '#151718' })

      -- change all background to black
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE'})

      -- vim.api.nvim_set_hl(0, '@variable', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, '@property', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, '@parameter', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, '@variable.parameter', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'Comment', { bg = 'NONE', fg = '#6c6c6c' })
      -- vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = 'NONE' })
      -- vim.api.nvim_set_hl(0, 'String', { bg = 'NONE' })
      -- vim.cmd 'highlight clear SignColumn'
    end,
  },
  {
    'maxmx03/solarized.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'
    end,
  },
}
