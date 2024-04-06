local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'live grep in open files',
  }
end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = 'search in open files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = 'search select telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'search git files' })
vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches, { desc = 'search git branches' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_commits, { desc = 'search git commits' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'search files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'search help' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').grep_string, { desc = 'search current word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'search by grep' })
vim.keymap.set('n', '<leader>sm', ':Telescope harpoon marks<cr>')
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = 'search by grep on git root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>sa', require('telescope.builtin').resume, { desc = 'search amend' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = 'search registers' })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer' })

-- LazyGit
-- vim.keymap.set('n', "<leader>gg", vim.cmd.LazyGit, { desc = 'Open LazyGit' })
-- vim.keymap.set('n', "<leader>gg", vim.cmd.Neogit, { desc = 'open neogit' })

-- vim.keymap.set('n', "<leader>ee", vim.cmd.Neotree, { desc = 'Open Neotree' })

-- Diagnostics
vim.keymap.set('n', '<space>ed', vim.diagnostic.open_float, { desc = "show floating diagnostics window" })
vim.keymap.set('n', '<space>ep', vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
vim.keymap.set('n', '<space>en', vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "set diagnostics window location" })

-- Resizing
vim.api.nvim_set_keymap('n', '<C-Up>', ':lua vim.api.nvim_win_set_height(0, vim.api.nvim_win_get_height(0) + 1)<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>',
  ':lua vim.api.nvim_win_set_height(0, math.max(vim.api.nvim_win_get_height(0) - 1, 1))<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>',
  ':lua vim.api.nvim_win_set_width(0, math.max(vim.api.nvim_win_get_width(0) - 1, 1))<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':lua vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) + 1)<CR>',
  { noremap = true, silent = true })

-- Splitting
vim.api.nvim_set_keymap('n', '<c-w>%', ':vsplit<cr>', { desc = 'split current window vertically' })
vim.api.nvim_set_keymap('n', '<c-w>"', ':split<cr>', { desc = 'split current window horizontally' })

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hp", mark.clear_all, { desc = 'harpoon purge' })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = 'harpoon' })
vim.keymap.set("n", "<leader>ht", mark.toggle_file, { desc = 'toggle harpoon curr file' })
vim.keymap.set("n", "<leader>hk", function()
  ui.nav_next()
end, { desc = 'Next Harpoon' })
vim.keymap.set("n", "<leader>hj", function()
  ui.nav_prev()
end, { desc = 'Prev Harpoon' })

-- Commentary
-- vim.api.nvim_set_keymap('n', '<leader>cc', ':Commentary<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<leader>cc', ':Commentary<CR>', { noremap = true })

vim.keymap.set('n', '<leader>nd', function()
    require('notify').dismiss({ silent = true, pending = true })
  end,
  { desc = 'dismiss notifications' })

vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>y', '"+yy', { noremap = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open parent directory" })
vim.g.user_emmet_mode = [[n]]
vim.g.user_emmet_leader_key = [[,]]
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext <cr>", { noremap = true })       -- Tab goes to next buffer
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious <cr>", { noremap = true }) -- Shift+Tab goes to previous buffer
vim.api.nvim_set_keymap("n", "<leader>q", ":bd <cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = true })
vim.keymap.set('n', '<c-h>', ':TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<c-j>', ':TmuxNavigateDown<cr>')
vim.keymap.set('n', '<c-k>', ':TmuxNavigateUp<cr>')
vim.keymap.set('n', '<c-l>', ':TmuxNavigateRight<cr>')
vim.keymap.set("n", "<Esc>", ":nohl<CR>:echo<CR>")
