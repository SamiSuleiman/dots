return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = {
    {
      'echasnovski/mini.icons',
      opts = {},
      config = function()
        require('mini.icons').setup()
        MiniIcons.mock_nvim_web_devicons()
      end,
    },
  },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
