local themes = {
    gruvbox = {
        {
            "ellisonleao/gruvbox.nvim",
            priority = 1000,
            config = function()
                require('gruvbox').setup {
                    terminal_colors = true, -- add neovim terminal colors
                    undercurl = true,
                    underline = true,
                    bold = true,
                    italic = {
                        strings = true,
                        emphasis = true,
                        comments = true,
                        operators = false,
                        folds = true,
                    },
                    strikethrough = true,
                    invert_selection = false,
                    invert_signs = false,
                    invert_tabline = false,
                    invert_intend_guides = false,
                    inverse = true, -- invert background for search, diffs, statuslines and errors
                    contrast = "",  -- can be "hard", "soft" or empty string
                    palette_overrides = {},
                    overrides = {},
                    dim_inactive = false,
                    transparent_mode = false,
                }
                vim.cmd('colorscheme gruvbox')
            end
        }
    },
    solarized = {
        {
            "Tsuzat/NeoSolarized.nvim",
            lazy = false,    -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                vim.cmd [[ colorscheme NeoSolarized ]]
            end
        }
    },
    rose = {
        {
            'rose-pine/neovim',
            name = "rose-pine",
            priority = 1000,
            lazy = false,
            config = function()
                require('rose-pine').setup {
                    styles = {
                        italic = false
                    }
                }
                vim.cmd("colorscheme rose-pine")
            end
        },

    },
    solarized2 = {
        {
            'maxmx03/solarized.nvim',
            lazy = false,
            priority = 1000,
            config = function()
                vim.o.background = 'dark' -- or 'light'
                vim.cmd.colorscheme 'solarized'
            end,
        },
    },
    forest = {
        'sainnhe/everforest',
        config = function()
            vim.cmd "let g:everforest_background = 'hard'"
            vim.cmd "let g:everforest_current_word = 'italic'"
            vim.cmd "let g:everforest_enable_italic = 1"
            vim.cmd "let g:everforest_disable_italic_comment = 0"
            vim.cmd [[ colorscheme everforest ]]
        end
    }
}

return themes.solarized
