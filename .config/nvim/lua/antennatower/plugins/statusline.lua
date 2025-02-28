return {
  {
    'bluz71/nvim-linefly',
    config = function()
      vim.g.linefly_options = {
        separator_symbol = '⎪',
        progress_symbol = '↓',
        active_tab_symbol = '▪',
        git_branch_symbol = '',
        error_symbol = 'E',
        warning_symbol = 'W',
        information_symbol = 'I',
        ellipsis_symbol = '…',
        tabline = false,
        winbar = true,
        with_file_icon = true,
        with_git_branch = true,
        with_git_status = true,
        with_diagnostic_status = true,
        with_session_status = true,
        with_attached_clients = true,
        with_lsp_status = true,
        with_macro_status = true,
        with_search_count = true,
        with_spell_status = false,
        with_indent_status = true,
      }
    end,
  },
  {

    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = false,
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- component_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree' },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
      }
    end,
  },
}
