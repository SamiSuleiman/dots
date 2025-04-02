return {
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
          -- StatusLine = { bg = '#0d0d0d' },
          -- StatusLineNC = { bg = '#0d0d0d' },
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
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    enabled = true,
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
          -- ['@punctuation.bracket'] = { fg = '#E4D4AD' },
          -- ['@punctuation.special'] = { fg = '#E5D4AD' },
          -- ['@punctuation'] = { fg = '#E4D4AD' },
          -- ['@symbol'] = { fg = '#E4D4AD' },
          -- ['@operator'] = { fg = '#E5D4AD' },
        },
        dim_inactive = false,
        transparent_mode = true,
      }
      vim.cmd 'colorscheme gruvbox'
      local highlight = vim.api.nvim_set_hl

      --change statlus line background color
      highlight(0, 'StatusLine', { bg = '#111111' })
      highlight(0, 'StatusLineNC', { bg = '#111111' })

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
}
