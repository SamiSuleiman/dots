-- ############## --
-- ## undotree ## --
-- ############## --
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'toggle undotree', noremap = true })

-- ########### --
-- ## pick ## --
-- ########## --
vim.keymap.set('n', '<leader>sf', ':Pick files<CR>', { desc = 'Pick files', noremap = true })
vim.keymap.set('n', '<leader>sg', ':Pick grep_live<CR>', { desc = 'Grep files', noremap = true })
vim.keymap.set('n', '<leader>sh', ':Pick help<CR>', { desc = 'Help', noremap = true })

-- ########## --
-- ## yank ## --
-- ########## --
vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', '"+yy', { noremap = true })

local function copy_curr_path_to_clipboard()
  local curr_path = vim.fn.expand '%'
  vim.fn.setreg('+', curr_path)
end
vim.api.nvim_create_user_command('CopyCurrPathToClipboard', copy_curr_path_to_clipboard, { nargs = 0 })

vim.api.nvim_set_keymap('n', '<Leader>yp', ':CopyCurrPathToClipboard<CR>', { noremap = true })

-- ############## --
-- ## terminal ## --
-- ############## --
vim.keymap.set('n', '<C-w>a', function()
  local curr_buf_path = vim.fn.expand '%:p:h]'
  vim.cmd('silent !tmux display-popup -d "' .. curr_buf_path .. '"')
end, { noremap = true, silent = true, desc = 'Open floating terminal in current directory' })

-- ############ --
-- ## window ## --
-- ############ --
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = true })
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = true })
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = true })
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<c-w>%', ':vsplit<cr>', { desc = 'split current window vertically' })
vim.api.nvim_set_keymap('n', '<c-w>"', ':split<cr>', { desc = 'split current window horizontally' })
vim.api.nvim_set_keymap('n', '<C-Up>', ':lua vim.api.nvim_win_set_height(0, vim.api.nvim_win_get_height(0) + 1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<C-Down>',
  ':lua vim.api.nvim_win_set_height(0, math.max(vim.api.nvim_win_get_height(0) - 1, 1))<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<C-Left>',
  ':lua vim.api.nvim_win_set_width(0, math.max(vim.api.nvim_win_get_width(0) - 1, 1))<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', '<C-Right>', ':lua vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) + 1)<CR>', { noremap = true, silent = true })

-- ################# --
-- ## diagnostics ## --
-- ################# --
vim.keymap.set('n', '<c-q>', vim.diagnostic.open_float, { desc = 'show floating diagnostics window' })
vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev, { desc = 'previous diagnostic' })
vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
vim.keymap.set('n', '<space>dq', vim.diagnostic.setqflist, { desc = 'next diagnostic' })
vim.keymap.set('n', '<space>dd', vim.diagnostic.setloclist, { desc = 'set diagnostics window location' })

-- ########### --
-- ## files ## --
-- ########### --
-- vim.keymap.set('n', '-', '<CMD>Explore<CR>', { desc = 'open parent directory' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })

-- ############ --
-- ## buffer ## --
-- ############ --
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext <cr>', { noremap = true }) -- Tab goes to next buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious <cr>', { noremap = true }) -- Shift+Tab goes to previous buffer
vim.api.nvim_set_keymap('n', '<leader>q', ':bd <cr>', { noremap = true })

--########## --
-- ## git ## --
--########## --
vim.keymap.set('n', '<leader>gg', ':Neogit<cr>', { desc = 'search by grep on git root' })
----

-- ########## --
-- ## misc ## --
-- ########## --
vim.keymap.set('n', '<Esc>', ':nohl<CR>:echo<CR>')
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xx', ':w <cr> :source % <cr>', { noremap = true })
-- vim.keymap.set('n', '<c-s>', function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.lsp.buf.format {
--     async = false,
--     bufnr = bufnr,
--     filter = function(c)
--       return c.name == 'null-ls'
--     end,
--   }
--   vim.cmd [[:w]]
-- end, { desc = 'format' })
----

-- ########## --
-- ## rest ## --
-- ########## --
vim.api.nvim_set_keymap('n', '<leader>rr', ':Rest run<CR>', { desc = 'Rest run' })
vim.api.nvim_set_keymap('n', '<leader>ro', ':Rest open<CR>', { desc = 'Rest open' })
