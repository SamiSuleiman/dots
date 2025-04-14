return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = true,
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
            -- base = '#0d0d0d',
            -- surface = '#0d0d0d',
            base = 'NONE',
            surface = 'NONE',
          },
        },
        -- this is useless now since we have a custom palette :)))) LETS GOOOOO
        highlight_groups = {
          -- ['@keyword.import'] = { bold = true },
          -- ['@keyword.export'] = { bold = true },
          -- ['@keyword.return'] = { bold = true },

          -- Normal = { bg = '#0d0d0d' },
          -- SignColumn = { bg = '#0d0d0d' },
          -- VertSplit = { bg = '#0d0d0d' },
          StatusLine = { bg = '#000000' },
          StatusLineNC = { bg = '#000000' },
          -- CurSearch = { fg = 'base', bg = 'love', inherit = false },
          Visual = { bg = 'highlight_med', inherit = false },
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
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
