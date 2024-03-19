return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        enabled = false,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            filesystem = {
                filtered_items = {
                    hide_dotfiles = true,
                    hide_gitignored = false,
                },
            },
            window = {
                width = 40,
                position = "right",
                mapping_options = {
                    noremap = true,
                    nowait = true
                },
                mappings = {
                    -- i think this is a default one, too lazy to try now maybe later
                    ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                    -- Read `# Preview Mode` for more information
                },
            },

        },
    }
}
