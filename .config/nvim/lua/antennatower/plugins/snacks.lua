return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
    },
    input = {
      win = {
        position = 'float',
        border = false,
        title_pos = 'center',
        height = 1,
        width = 60,
        relative = 'cursor',
        noautocmd = true,
        -- row = 2,
        -- relative = "cursor",
        row = -3,
        col = 0,
      },
    },
    indent = {},
    dashboard = {
      sections = {
        {
          section = 'terminal',
          cmd = 'chafa ~/.config/nvim/assets/wall.jpeg --format symbols --symbols vhalf; sleep .1',
          height = 17,
          padding = 1,
        },
        {
          pane = 2,
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
        },
      },
    },
  },
}
