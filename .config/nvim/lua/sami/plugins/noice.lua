return {
  'folke/noice.nvim',
  enabled = false,
  event = 'VeryLazy',
  opts = {
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },
    },
    views = {
      cmdline_popup = {
        border = {
          style = 'none',
          padding = { 1, 2 },
        },
        filter_options = {},
        win_options = {
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
        },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
