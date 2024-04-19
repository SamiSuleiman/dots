return {
  'windwp/nvim-ts-autotag',
  'nvim-lua/plenary.nvim',
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  'chrisbra/colorizer',
  'christoomey/vim-tmux-navigator',
  'nvim-tree/nvim-web-devicons',
  {
    'letieu/btw.nvim',
    config = function()
      require('btw').setup()
    end,
  },
  {
    'm4xshen/autoclose.nvim',
    opts = {},
  },
  {
    'folke/zen-mode.nvim',
    opts = {},
  },
  {
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn['firenvim#install'](0)
    end,
  },
  {
    'github/copilot.vim',
    enabled = true,
  },
  {
    'ThePrimeagen/harpoon',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
    config = function() end,
  },
  {
    'folke/which-key.nvim',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
}
