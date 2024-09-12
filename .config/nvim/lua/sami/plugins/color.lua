return {
  {
    'rose-pine/neovim',
    enabled = false,
    name = 'rose-pine',
    opts = {},
    config = function()
      require('rose-pine').setup {
        -- variant = 'moon', -- auto, main, moon, or dawn
        -- dark_variant = 'moon', -- main, moon, or dawn
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
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
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
      highlight(0, 'StatusLine', { bg = '#1D2021' })
      highlight(0, 'StatusLineNC', { bg = '#1D2021' })

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
