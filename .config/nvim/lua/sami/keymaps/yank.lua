vim.api.nvim_set_keymap('v', '<Leader>yy', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>yy', '"+yy', { noremap = true })

local function copy_curr_path_to_clipboard()
  local curr_path = vim.fn.expand '%'
  vim.fn.setreg('+', curr_path)
end
vim.api.nvim_create_user_command('CopyCurrPathToClipboard', copy_curr_path_to_clipboard, { nargs = 0 })

vim.api.nvim_set_keymap('n', '<Leader>yp', ':CopyCurrPathToClipboard<CR>', { noremap = true })
