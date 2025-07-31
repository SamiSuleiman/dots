require 'sami.settings'

vim.g.have_nerd_font = true

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

require('lazy').setup 'sami.plugins'

require 'sami.keymaps'
require 'sami.cmds'
