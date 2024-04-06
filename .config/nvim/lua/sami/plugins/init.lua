local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/folke/lazy.nvim.git',
    '--filter=blob:none',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  {
    require('sami.plugins.based'),
  },
}, {})

require('sami.plugins.telescope')
require('sami.plugins.lsp')
require('sami.plugins.treesitter')

vim.cmd("colorscheme rose-pine")
-- vim.cmd('highlight Normal guibg=#0E0A00')
