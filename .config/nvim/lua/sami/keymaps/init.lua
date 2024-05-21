vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- basics
require 'sami.keymaps.misc'
require 'sami.keymaps.buffer'
require 'sami.keymaps.resize'
require 'sami.keymaps.split'
require 'sami.keymaps.yank'
require 'sami.keymaps.window'

-- plugins
require 'sami.keymaps.telescope'
require 'sami.keymaps.diagnostics'
require 'sami.keymaps.undotree'
require 'sami.keymaps.harpoon'
require 'sami.keymaps.tmux'
require 'sami.keymaps.zen'
require 'sami.keymaps.git'
require 'sami.keymaps.oil'
require 'sami.keymaps.nx'
require 'sami.keymaps.plenary'
