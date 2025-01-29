return {
  'github/copilot.vim',
  enabled = false,
  config = function()
    vim.g.copilot_filetypes = {
      markdown = false,
    }
  end,
}
