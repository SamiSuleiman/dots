return {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require('nordic').load()
    end,
  },
  'nordtheme/vim',
  {
    'Tsuzat/NeoSolarized.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    'jesseleite/nvim-noirbuddy',
    enabled = false,
    dependencies = {
      { 'tjdevries/colorbuddy.nvim' },
    },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd 'colorscheme noirbuddy'
      require('noirbuddy').setup {
        preset = 'crt-amber',
        colors = {
          background = '#000000',
        },
      }
    end,
  },
  'comfysage/gruvboxed',
  'comfysage/twilight-moon',
  {
    'comfysage/evergarden',
    opts = {
      transparent_background = true,
      contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
      overrides = {}, -- add custom overrides
    },
  },
  'Biscuit-Colorscheme/nvim',
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {}
    end,

    init = function()
      vim.cmd 'colorscheme poimandres'
    end,
  },
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
  { 'sainnhe/gruvbox-material' },
  {
    'xero/miasma.nvim',
    lazy = false,
    priority = 1000,
  },
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false, priority = 1000 },
  { 'Mofiqul/dracula.nvim' },
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
    'sainnhe/everforest',
    config = function()
      vim.api.nvim_set_var('everforest_background', 'hard')
    end,
  },
  {
    'sainnhe/sonokai',
    config = function()
      vim.api.nvim_set_var('sonokai_style', 'espresso')
      vim.api.nvim_set_var('sonokai_better_performance', 1)
    end,
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
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      },
    },
  },
}
