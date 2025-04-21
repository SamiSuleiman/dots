return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = true,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        no_italic = true,
        term_colors = true,
        transparent_background = true,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        -- color_overrides = {
        -- mocha = {
        -- base = '#000000',
        -- mantle = '#000000',
        -- crust = '#000000',
        -- },
        -- },
        integrations = {
          telescope = {
            enabled = true,
            style = 'nvchad',
          },
          dropbar = {
            enabled = true,
            color_mode = true,
          },
        },
      }
      vim.cmd 'colorscheme catppuccin-mocha'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    config = function()
      require('rose-pine').setup {
        dim_inactive_windows = false,
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
        palette = {
          -- Override the builtin palette per variant
          main = {
            base = 'NONE',
            surface = 'NONE',
          },
          moon = {
            -- base = '#000000',
            -- surface = '#000000',
            base = 'NONE',
            surface = 'NONE',
          },
        },
        -- this is useless now since we have a custom palette :)))) LETS GOOOOO
        highlight_groups = {
          -- ['@keyword.import'] = { bold = true },
          -- ['@keyword.export'] = { bold = true },
          -- ['@keyword.return'] = { bold = true },

          -- Normal = { bg = '#000000' },
          -- SignColumn = { bg = '#000000' },
          -- VertSplit = { bg = '#000000' },
          StatusLine = { bg = '#000000' },
          StatusLineNC = { bg = '#000000' },
          -- CurSearch = { fg = 'base', bg = 'love', inherit = false },
          Visual = { bg = 'highlight_med', inherit = false },
          -- Search = { fg = 'text', bg = 'rose', blend = 20, inherit = false },
          -- TelescopeBorder = { fg = 'surface', bg = '#000000' },
          -- TelescopeNormal = { fg = 'subtle', bg = '#000000' },
          -- -- TelescopeSelection = { fg = 'text', bg = 'highlight_med' },
          -- -- TelescopeSelectionCaret = { fg = 'love', bg = 'highlight_med' },
          -- -- TelescopeMultiSelection = { fg = 'text', bg = 'highlight_high' },
          -- TelescopeTitle = { fg = 'base', bg = 'love' },
          -- TelescopePromptTitle = { fg = 'base', bg = 'pine' },
          -- TelescopePreviewTitle = { fg = 'base', bg = 'iris' },
          -- TelescopePromptNormal = { fg = 'text', bg = '#000000' },
          -- TelescopePromptBorder = { fg = 'surface', bg = '#000000' },
        },
      }
      vim.cmd 'colorscheme rose-pine-moon'
    end,
  },
}
