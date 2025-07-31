return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require('conform').setup {
      notify_on_error = true,
      format_on_save = function(bufnr)
        return {
          bufnr = bufnr,
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd', stop_after_first = true },
        typescript = { 'prettierd', stop_after_first = true },
        json = { 'prettierd', stop_after_first = true },
        -- csharpier is not working, this falls back to lsp formatter :)
        cs = {},
        css = { 'prettierd', stop_after_first = true },
        scss = { 'prettierd', stop_after_first = true },
        html = { 'prettierd', stop_after_first = true },
        svelte = { 'prettierd', stop_after_first = true },
        sh = { 'shfmt' },
      },
    }
  end,
}
