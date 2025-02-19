return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
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
