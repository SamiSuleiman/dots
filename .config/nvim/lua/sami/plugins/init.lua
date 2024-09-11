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
    require 'sami.plugins.noice',
    require 'sami.plugins.harpoon',
    require 'sami.plugins.copilot',
    require 'sami.plugins.autopairs',
    require 'sami.plugins.whichkey',
    require 'sami.plugins.comment',
    require 'sami.plugins.color',
    require 'sami.plugins.statusline',
    require 'sami.plugins.lint',
    require 'sami.plugins.debug',
    require 'sami.plugins.autotag',
    require 'sami.plugins.surround',
    require 'sami.plugins.sleuth',
    require 'sami.plugins.colorizer',
    require 'sami.plugins.git',
    require 'sami.plugins.telescope',
    require 'sami.plugins.lsp',
    require 'sami.plugins.treesitter',
    require 'sami.plugins.nonels',
    require 'sami.plugins.bufferline',
    require 'sami.plugins.cmp',
    require 'sami.plugins.blankline',
    require 'sami.plugins.move',
    require 'sami.plugins.oil',
    require 'sami.plugins.md',
    require 'sami.plugins.nx',
    require 'sami.plugins.todo',
  },
}, {})
