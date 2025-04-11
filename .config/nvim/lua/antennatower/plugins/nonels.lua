return {
  'nvimtools/none-ls.nvim',
  opts = {},
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    null_ls.setup {
      debug = false,
      sources = {
        formatting.stylua,
        formatting.gofmt,
        formatting.prettierd,
        formatting.csharpier,
      },
    }
  end,
}
