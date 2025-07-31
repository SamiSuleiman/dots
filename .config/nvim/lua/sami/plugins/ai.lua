return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        disable_inline_completion = false,
        disable_keymaps = false,
        log_level = 'off',
        ignore_filetypes = { markdown = true },
      }
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
