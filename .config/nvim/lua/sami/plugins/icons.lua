return {
  'echasnovski/mini.icons',
  opts = {},
  config = function()
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()
  end,
}
