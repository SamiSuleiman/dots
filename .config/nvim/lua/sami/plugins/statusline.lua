return {
  { 'bluz71/nvim-linefly', enabled = false },
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    opts = {

      options = {
        options = { fmt = string.lower },
        icons_enabled = true,
        -- theme = 'auto',
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:lower()
            end,
          },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          'filename',
          {
            'lsps',
            fmt = function()
              local running_lsps = vim.lsp.get_active_clients()
              if vim.tbl_isempty(running_lsps) then
                return ''
              end

              return table.concat(
                vim.tbl_map(function(client)
                  return client.name
                end, running_lsps),
                ', '
              )
            end,
            icon = '|',
          },
        },
        lualine_x = {
          {
            'recording',
            fmt = function()
              local recording = vim.fn.reg_recording()
              return recording ~= '' and recording or nil
            end,
            icon = '@',
          },
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location', 'searchcount' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'oil', 'mason' },
    },
  },
}
