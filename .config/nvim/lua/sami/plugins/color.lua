return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'comfysage/gruvboxed',
  { 'aktersnurra/no-clown-fiesta.nvim' },
  {
    'ramojus/mellifluous.nvim',
    opts = {
      dim_inactive = true,
      -- color_set = 'alduin',
      transparent_background = {
        enabled = true,
        floating_windows = true,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = true,
      },
    },
  },
  {
    'rebelot/kanagawa.nvim',
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'savq/melange-nvim' },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = false,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = 'hard', -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {
        SignColumn = { bg = '#282828' },
        ['@punctuation.bracket'] = { fg = '#E4D4AD' },
        ['@punctuation.special'] = { fg = '#E5D4AD' },
        ['@punctuation'] = { fg = '#E4D4AD' },
        ['@symbol'] = { fg = '#E4D4AD' },
        ['@operator'] = { fg = '#E4D4AD' },
      },
      dim_inactive = false,
      transparent_mode = true,
    },
  },
  {
    'projekt0n/github-nvim-theme',
    enabled = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}

      vim.cmd 'colorscheme github_dark_default'
    end,
  },
  {
    'rose-pine/neovim',
    enabled = true,
    name = 'rose-pine',
    opts = {},
    config = function()
      require('rose-pine').setup {
        variant = 'main', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = true,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      }
      vim.cmd 'colorscheme rose-pine'

      vim.api.nvim_set_hl(0, '@variable', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, '@property', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, '@parameter', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, '@variable.parameter', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'Comment', { bg = 'NONE', fg = '#6c6c6c' })
      vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = 'NONE' })
      -- vim.cmd 'highlight clear SignColumn'
    end,
  },
}
