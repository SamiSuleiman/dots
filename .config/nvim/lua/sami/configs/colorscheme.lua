local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

if not ok_status then
    return
end

return {
    NeoSolarized.setup {
        style = "dark",         -- "dark" or "light"
        transparent = true,     -- true/false; Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        enable_italics = false, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
        styles = {
            -- Style to be applied to different syntax groups
            comments = { italic = false },
            keywords = { italic = false },
            functions = { bold = false },
            variables = {},
            string = { italic = false },
            underline = true, -- true/false; for global underline
            undercurl = true, -- true/false; for global undercurl
        },
        -- Add specific hightlight groups
        on_highlights = function(highlights, colors)
            -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
        end,
    },

    vim.cmd [[ colorscheme NeoSolarized ]]
}
