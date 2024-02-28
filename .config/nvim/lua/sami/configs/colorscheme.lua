-- return {
--     require("rose-pine").setup({
--         variant = "auto",      -- auto, main, moon, or dawn
--         dark_variant = "main", -- main, moon, or dawn
--         dim_inactive_windows = false,
--         extend_background_behind_borders = true,
--
--         enable = {
--             terminal = true,
--             legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--             migrations = true,        -- Handle deprecated options automatically
--         },
--
--         styles = {
--             bold = false,
--             italic = false,
--             transparency = false,
--         },
--
--         groups = {
--             border = "muted",
--             link = "iris",
--             panel = "surface",
--
--             error = "love",
--             hint = "iris",
--             info = "foam",
--             note = "pine",
--             todo = "rose",
--             warn = "gold",
--
--             git_add = "foam",
--             git_change = "rose",
--             git_delete = "love",
--             git_dirty = "rose",
--             git_ignore = "muted",
--             git_merge = "iris",
--             git_rename = "pine",
--             git_stage = "iris",
--             git_text = "rose",
--             git_untracked = "subtle",
--
--             h1 = "iris",
--             h2 = "foam",
--             h3 = "rose",
--             h4 = "gold",
--             h5 = "pine",
--             h6 = "foam",
--         },
--
--         highlight_groups = {
--             -- Comment = { fg = "foam" },
--             -- VertSplit = { fg = "muted", bg = "muted" },
--         },
--
--         before_highlight = function(group, highlight, palette)
--             -- Disable all undercurls
--             -- if highlight.undercurl then
--             --     highlight.undercurl = false
--             -- end
--             --
--             -- Change palette colour
--             -- if highlight.fg == palette.pine then
--             --     highlight.fg = palette.foam
--             -- end
--         end,
--     }),
--
--     vim.cmd("colorscheme rose-pine")
-- }
-- local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

-- if not ok_status then
--     return
-- end

local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

if not ok_status then
    return
end

NeoSolarized.setup {
    style = "dark",         -- "dark" or "light"
    transparent = true,     -- true/false; Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    enable_italics = true,  -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
    styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        string = { italic = true },
        underline = true, -- true/false; for global underline
        undercurl = true, -- true/false; for global undercurl
    },
    -- Add specific hightlight groups
    on_highlights = function(highlights, colors)
        -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
    end,
}
-- Set colorscheme to NeoSolarized
vim.cmd [[ colorscheme NeoSolarized ]]
