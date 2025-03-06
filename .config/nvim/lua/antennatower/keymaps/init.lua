vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- basics
require 'antennatower.keymaps.misc'
require 'antennatower.keymaps.buffer'
require 'antennatower.keymaps.resize'
require 'antennatower.keymaps.split'
require 'antennatower.keymaps.yank'
require 'antennatower.keymaps.window'

-- plugins
require 'antennatower.keymaps.telescope'
require 'antennatower.keymaps.diagnostics'
require 'antennatower.keymaps.undotree'
require 'antennatower.keymaps.harpoon'
require 'antennatower.keymaps.git'
require 'antennatower.keymaps.files'
require 'antennatower.keymaps.nx'
require 'antennatower.keymaps.plenary'
require 'antennatower.keymaps.markdown'
require 'antennatower.keymaps.snacks'
