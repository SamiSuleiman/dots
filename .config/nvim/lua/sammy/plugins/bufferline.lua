return {
  {
    'akinsho/bufferline.nvim',
    enabled = true,
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end,
  },
  {
    'echasnovski/mini.tabline',
    version = '*',
    config = function()
      require('mini.tabline').setup {}
    end,
    enabled = false,
  },
}
