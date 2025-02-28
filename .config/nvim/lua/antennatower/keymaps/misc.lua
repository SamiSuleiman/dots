vim.keymap.set('n', '<Esc>', ':nohl<CR>:echo<CR>')
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-x>', '<C-6>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xx', ':w <cr> :source % <cr>', { noremap = true })
vim.keymap.set('n', '<leader>f', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.buf.format {
    async = false,
    bufnr = bufnr,
    filter = function(c)
      return c.name == 'null-ls'
    end,
  }
end, { desc = 'format' })
