vim.keymap.set('n', '<leader>nh', function()
  Snacks.notifier.show_history()
end, { desc = 'show snacks history' })
