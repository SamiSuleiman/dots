return {
    {
        'tpope/vim-repeat',
        'onsails/lspkind.nvim',
        'windwp/nvim-ts-autotag',
        'nvim-lua/plenary.nvim',
        'mbbill/undotree',
        'nvim-lualine/lualine.nvim',
        'kdheepak/lazygit.nvim',
        'tpope/vim-surround',
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
        'tpope/vim-sleuth',
        'mattn/emmet-vim',
        'chrisbra/colorizer',
        'sbdchd/neoformat',
        'mfussenegger/nvim-lint',
        'github/copilot.vim',
        'windwp/nvim-ts-autotag',
        {
            "folke/zen-mode.nvim",
            opts = {}
        },
        {
            'nvimdev/dashboard-nvim',
            event = 'VimEnter',
            config = function()
                require('dashboard').setup {}
            end,
            dependencies = { { 'nvim-tree/nvim-web-devicons' } }
        },
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {
                signs = true,      -- show icons in the signs column
                sign_priority = 8, -- sign priority
                -- keywords recognized as todo comments
                keywords = {
                    fix = {
                        icon = " ", -- icon used for the sign, and in search results
                        color = "error", -- can be a hex color, or a named color (see below)
                        alt = { "fixme", "bug", "fixit", "issue" }, -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    todo = { icon = " ", color = "info" },
                    hack = { icon = " ", color = "warning" },
                    warn = { icon = " ", color = "warning", alt = { "warning", "xxx" } },
                    perf = { icon = " ", alt = { "optim", "performance", "optimize" } },
                    note = { icon = " ", color = "hint", alt = { "info" } },
                    test = { icon = "⏲ ", color = "test", alt = { "testing", "passed", "failed" } },
                },
                gui_style = {
                    fg = "NONE",       -- The gui style to use for the fg highlight group.
                    bg = "BOLD",       -- The gui style to use for the bg highlight group.
                },
                merge_keywords = true, -- when true, custom keywords will be merged with the defaults
                -- highlighting of the line containing the todo comment
                -- * before: highlights before the keyword (typically comment characters)
                -- * keyword: highlights of the keyword
                -- * after: highlights after the keyword (todo text)
                highlight = {
                    multiline = true,                -- enable multine todo comments
                    multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
                    multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
                    before = "",                     -- "fg" or "bg" or empty
                    keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                    after = "fg",                    -- "fg" or "bg" or empty
                    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                    comments_only = true,            -- uses treesitter to match keywords in comments only
                    max_line_len = 400,              -- ignore lines longer than this
                    exclude = {},                    -- list of file types to exclude highlighting
                },
                -- list of named colors where we try to extract the guifg from the
                -- list of highlight groups or use the hex color if hl not found as a fallback
                colors = {
                    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                    info = { "DiagnosticInfo", "#2563EB" },
                    hint = { "DiagnosticHint", "#10B981" },
                    default = { "Identifier", "#7C3AED" },
                    test = { "Identifier", "#FF00FF" }
                },
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                    },
                    -- regex that will be used to match keywords.
                    -- don't replace the (KEYWORDS) placeholder
                    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
                },
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        },
        {
            'ThePrimeagen/harpoon',
            opts = {
                menu = {
                    height = vim.o.lines,  -- maximally available lines
                    width = vim.o.columns, -- maximally available columns
                }
            }
        },
        {
            "Tsuzat/NeoSolarized.nvim",
            lazy = false,
            priority = 1000,
            enabled = false,
            opts = {
                style = "dark",         -- "dark" or "light"
                transparent = true,     -- true/false; Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                enable_italics = true,  -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
                styles = {
                    -- Style to be applied to different syntax groups
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { bold = false },
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

        },
        {
            "rose-pine/neovim",
            name = "rose-pine",
            opts = {
                variant = "auto",      -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true,        -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            }
        },
        {
            'stevearc/oil.nvim',
            opts = {
                default_file_explorer = true,
                columns = { "icon" },
                experimental_watch_for_changes = true,
                delete_to_trash = true,
                keymaps_help = {
                    border = "rounded",
                },
                use_default_keymaps = true,
                view_options = {
                    show_hidden = true,
                    is_hidden_file = function(name, bufnr)
                        return vim.startswith(name, ".")
                    end,
                    is_always_hidden = function(name, bufnr)
                        return false
                    end,
                },
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = "actions.select_vsplit",
                    ["<C-h>"] = "actions.select_split",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
            }
        },
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason-lspconfig.nvim", opts = {} },
            { "j-hui/fidget.nvim",                 tag = "legacy" },
            { "folke/neodev.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "rafamadriz/friendly-snippets" },
            { "L3MON4D3/LuaSnip" },
        },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim',       opts = {} },
            'folke/neodev.nvim',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets
                    -- This step is not supported in many windows environments
                    -- Remove the below condition to re-enable on windows
                    if vim.fn.has 'win32' == 1 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    { 'folke/which-key.nvim', opts = {} },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                "bash",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "html",
                "javascript",
                "json",
                "lua",
                "rust",
                "css",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    }
}
