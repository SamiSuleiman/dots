return {
  'nvimtools/none-ls.nvim',
  opts = {},
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    null_ls.setup {
      sources = {
        formatting.stylua.with {
          filetypes = { 'lua' },
        },
        formatting.gofmt,
        formatting.prettierd.with {
          filetypes = { 'javascript', 'typescript', 'json', 'css', 'scss', 'html', 'markdown', 'svelte', 'yaml' },
        },
        formatting.csharpier,
      },
    }
  end,
}
