return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true, -- show icons in the signs column
    keywords = {
      FIX = {
        icon = '', -- icon used for the sign, and in search results
        color = 'error', -- can be a hex color, or a named color (see below)
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
      },
      TODO = { icon = '', color = 'info' },
      HACK = { icon = '', color = 'warning' },
      PERF = { icon = '', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      TEST = { icon = '', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      WARN = { icon = '', color = 'warning', alt = { 'WARNING', 'XXX' } },
      NOTE = { icon = '', color = 'hint', alt = { 'INFO' } },
    },
    gui_style = {
      fg = 'NONE', -- The gui style to use for the fg highlight group.
      bg = 'BOLD', -- The gui style to use for the bg highlight group.
    },
  },
}
