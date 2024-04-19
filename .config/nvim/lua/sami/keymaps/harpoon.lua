local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', '<leader>hp', mark.clear_all, { desc = 'harpoon purge' })
vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = 'harpoon' })
vim.keymap.set('n', '<leader>ht', mark.toggle_file, { desc = 'toggle harpoon curr file' })
vim.keymap.set('n', '<leader>hk', function()
  ui.nav_next()
end, { desc = 'Next Harpoon' })
vim.keymap.set('n', '<leader>hj', function()
  ui.nav_prev()
end, { desc = 'Prev Harpoon' })
