return {
  'github/copilot.vim',
  enabled = true,
  config = function()
    vim.g.copilot_filetypes = {
      markdown = false,
    }
  end,
}
