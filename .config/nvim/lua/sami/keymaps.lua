local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- markdown
vim.keymap.set("v", "<leader>mb", "di****<esc>hhp", { desc = "Auto bold" })
vim.keymap.set("v", "<leader>mi", "di**<esc>hp", { desc = "Auto italic" })
vim.keymap.set("v", "<leader>ml", "di[]()<esc>hhhpllli", { desc = "Auto link" })
vim.keymap.set("v", "<leader>mc", "di``<esc>hp", { desc = "Auto backtick" })

-- LazyGit
-- vim.keymap.set('n', "<leader>gg", vim.cmd.LazyGit, { desc = 'Open LazyGit' })
vim.keymap.set('n', "<leader>gg", vim.cmd.Neogit, { desc = 'Open Neogit' })


-- Diagnostics
vim.keymap.set('n', '<space>ed', vim.diagnostic.open_float, { desc = "Show Floating Diagnostics Window" })
vim.keymap.set('n', '<space>ep', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set('n', '<space>en', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Set Diagnostics Window Location" })

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
vim.api.nvim_set_keymap('n', '<leader>kv', ':vsplit<cr>', { desc = 'Split Current Window Vertically' })
vim.api.nvim_set_keymap('n', '<leader>kh', ':split<cr>', { desc = 'Split Current Window Horizontally' })

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hp", mark.clear_all, { desc = 'Harpoon purge' })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = 'Harpoon' })
vim.keymap.set("n", "<leader>ht", mark.toggle_file, { desc = 'Toggle Harpoon Curr File' })
vim.keymap.set("n", "<leader>hk", function()
  ui.nav_next()
end, { desc = 'Next Harpoon' })
vim.keymap.set("n", "<leader>hj", function()
  ui.nav_prev()
end, { desc = 'Prev Harpoon' })

-- copy to clipboard
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>y', '"+yy', { noremap = true })
-- nx
-- vim.keymap.set("n", "<leader>ng", require("nx.generators").generators, { desc = "[N]x [G]enerators" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_set_var("user_emmet_mode", "n")
vim.api.nvim_set_var("user_emmet_leader_key", ",")
