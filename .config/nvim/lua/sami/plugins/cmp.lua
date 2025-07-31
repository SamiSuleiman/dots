return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'huijiro/blink-cmp-supermaven',
    },
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        'rafamadriz/friendly-snippets',
      },
      config = function()
        local luasnip = require 'luasnip'
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}
      end,
    },
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'enter',
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
