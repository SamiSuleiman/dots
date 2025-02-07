return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  -- {
  --   'olimorris/codecompanion.nvim',
  --   opts = {
  --     sources = {
  --       per_filetype = {
  --         codecompanion = { 'codecompanion' },
  --       },
  --     },
  --   },
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  -- },
  {
    'github/copilot.vim',
    enabled = false,
    config = function()
      vim.g.copilot_filetypes = {
        markdown = false,
      }
    end,
  },
}
