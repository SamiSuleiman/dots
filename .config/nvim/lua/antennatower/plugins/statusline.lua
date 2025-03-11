return {
  'bluz71/nvim-linefly',
  config = function()
    vim.g.linefly_options = {
      separator_symbol = '⎪',
      progress_symbol = '↓',
      active_tab_symbol = '▪',
      git_branch_symbol = '',
      error_symbol = '',
      warning_symbol = '',
      information_symbol = '',
      ellipsis_symbol = '…',
      tabline = false,
      winbar = false,
      with_file_icon = true,
      with_git_branch = true,
      with_git_status = true,
      with_diagnostic_status = true,
      with_session_status = true,
      with_attached_clients = true,
      with_lsp_status = true,
      with_macro_status = true,
      with_search_count = true,
      with_spell_status = true,
      with_indent_status = false,
    }
  end,
}
