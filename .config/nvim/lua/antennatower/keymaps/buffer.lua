vim.api.nvim_set_keymap('n', '<Tab>', ':bnext <cr>', { noremap = true }) -- Tab goes to next buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious <cr>', { noremap = true }) -- Shift+Tab goes to previous buffer
vim.api.nvim_set_keymap('n', '<leader>q', ':bd <cr>', { noremap = true })
