local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'live grep in open files',
  }
end

vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = 'search in open files' })
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
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').spell_suggest, { desc = 'search registers' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer' })
