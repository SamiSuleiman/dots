return {
  { 'windwp/nvim-ts-autotag', enabled = true },
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require('autoclose').setup {}
    end,
  },
}
