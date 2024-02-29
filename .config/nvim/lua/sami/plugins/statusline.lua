local function lsp_comp()
    local msg = '-'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

local function is_recording()
    local recording = vim.fn.reg_recording()
    return recording ~= '' and recording or nil
end

require('lualine').setup {
    options = {
        options = { fmt = string.lower },
        icons_enabled = true,
        -- theme = 'auto',
        theme = 'NeoSolarized',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
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
            { 'mode', fmt = function(str) return str:lower() end }
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location', 'searchcount' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {
        lualine_a = {
            { 'lsp', fmt = lsp_comp, icon = '', color = { fg = '#67787B', bg = '#002B36' } },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            { 'recording', fmt = is_recording, icon = '', color = { fg = '#67787B', bg = '#002B36' }, padding = { left = 1, right = 1 } }
        }
    },
    inactive_winbar = {},
    extensions = { 'oil', 'mason' }
}
