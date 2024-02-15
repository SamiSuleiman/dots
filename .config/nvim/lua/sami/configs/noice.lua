return {
    require("noice").setup({
        cmdline = {
            enabled = true,         -- enables the Noice cmdline UI
            view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
            opts = {},              -- global options for the cmdline. See section on views
            ---@type table<string, CmdlineFormat>
            format = {
                -- cmdline = { pattern = "^:", icon = "", lang = "vim" },
                search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                -- filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                -- lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                -- help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                -- input = {}, -- Used by input()
                -- lua = false, -- to disable a format, set to `false`
            },
        },
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
            signature = {
                enabled = false
            }
        },
        -- you can enable a preset for easier configuration
        -- presets = {
        --     bottom_search = true,
        --     command_palette = true,
        --     long_message_to_split = true,
        --     inc_rename = false,
        --     lsp_doc_border = false,
        -- },
    })
}
