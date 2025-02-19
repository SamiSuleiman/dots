vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- basics
require 'sammy.keymaps.misc'
require 'sammy.keymaps.buffer'
require 'sammy.keymaps.resize'
require 'sammy.keymaps.split'
require 'sammy.keymaps.yank'
require 'sammy.keymaps.window'

-- plugins
require 'sammy.keymaps.telescope'
require 'sammy.keymaps.diagnostics'
require 'sammy.keymaps.undotree'
require 'sammy.keymaps.harpoon'
require 'sammy.keymaps.zen'
require 'sammy.keymaps.git'
require 'sammy.keymaps.files'
require 'sammy.keymaps.nx'
require 'sammy.keymaps.plenary'
-- require 'sammy.keymaps.noice'
