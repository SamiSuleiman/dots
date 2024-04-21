return {
  'glacambre/firenvim',
  enabled = function()
    -- return vim.fn.executable 'firenvim' == 1
    return false
  end,
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn['firenvim#install'](0)
  end,
}
