local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'
local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'live grep in open files',
  }
end

-- telescope --
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = 'search in open files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'search files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'search help' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').grep_string, { desc = 'search current word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'search by grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>sa', require('telescope.builtin').resume, { desc = 'search amend' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = 'search registers' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').spell_suggest, { desc = 'search registers' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer' })
----

-- undotree --
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'toggle undotree', noremap = true })
----

-- yank --
vim.api.nvim_set_keymap('v', 'Y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', '"+yy', { noremap = true })

local function copy_curr_path_to_clipboard()
  local curr_path = vim.fn.expand '%'
  vim.fn.setreg('+', curr_path)
end
vim.api.nvim_create_user_command('CopyCurrPathToClipboard', copy_curr_path_to_clipboard, { nargs = 0 })

vim.api.nvim_set_keymap('n', '<Leader>yp', ':CopyCurrPathToClipboard<CR>', { noremap = true })
----

-- snacks --
vim.keymap.set('n', '<leader>nh', function()
  Snacks.notifier.show_history()
end, { desc = 'show snacks history' })
----

-- terminal --
vim.keymap.set('n', '<C-w>a', function()
  local curr_buf_path = vim.fn.expand '%:p:h]'
  vim.cmd('silent !tmux display-popup -d "' .. curr_buf_path .. '"')
end, { noremap = true, silent = true, desc = 'Open floating terminal in current directory' })
----

-- window --
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
----

-- test --
vim.keymap.set('n', '<leader>xt', '<Plug>PlenaryTestFile', { desc = 'test current lua file' })
----

-- nx --
vim.keymap.set('n', '<leader>na', '<cmd>Telescope nx actions<CR>', { desc = 'nx actions' })
vim.keymap.set('n', '<leader>ng', '<cmd>Telescope nx generators<CR>', { desc = 'nx generators' })
----

-- markdown --
vim.api.nvim_set_keymap('n', '<leader>mm', ':Markview <cr>', { desc = 'toggle markdown preview' })
----
-- diagnostics --
vim.keymap.set('n', '<c-q>', vim.diagnostic.open_float, { desc = 'show floating diagnostics window' })
vim.keymap.set('n', '<space>ep', vim.diagnostic.goto_prev, { desc = 'previous diagnostic' })
vim.keymap.set('n', '<space>en', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
vim.keymap.set('n', '<space>ee', vim.diagnostic.setqflist, { desc = 'next diagnostic' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'set diagnostics window location' })
----

-- files --
-- vim.keymap.set('n', '-', '<CMD>Explore<CR>', { desc = 'open parent directory' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })
----

-- buffer --
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext <cr>', { noremap = true }) -- Tab goes to next buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious <cr>', { noremap = true }) -- Shift+Tab goes to previous buffer
vim.api.nvim_set_keymap('n', '<leader>q', ':bd <cr>', { noremap = true })
----

-- git --
vim.keymap.set('n', '<leader>gg', vim.cmd.Neogit, { desc = 'open neogit' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'search git files' })
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'search git branches' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'search git commits' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'search by grep on git root' })
----

-- misc --
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
----

-- harpoon --
vim.keymap.set('n', '<leader>sm', ':Telescope harpoon marks<cr>')
vim.keymap.set('n', '<leader>hp', mark.clear_all, { desc = 'harpoon purge' })
vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = 'harpoon' })
vim.keymap.set('n', '<leader>ht', mark.toggle_file, { desc = 'toggle harpoon curr file' })
vim.keymap.set('n', '<leader>hk', function()
  ui.nav_next()
end, { desc = 'Next Harpoon' })
vim.keymap.set('n', '<leader>hj', function()
  ui.nav_prev()
end, { desc = 'Prev Harpoon' })
-----
