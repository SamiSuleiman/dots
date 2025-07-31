return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      markdown = {},
      typescript = { 'eslint_d' },
    }
    local eslint = require('lint').linters.eslint

    eslint.args = {
      '--no-warn-ignored',
      '--format',
      'json',
      '--stdin',
      '--stdin-filename',
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint(nil, {
          ignore_errors = true,
        })
      end,
    })
  end,
}
