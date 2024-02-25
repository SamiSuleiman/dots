return {
    {
        'github/copilot.vim',
        'windwp/nvim-ts-autotag',
        'stevearc/oil.nvim',
        'onsails/lspkind.nvim',
        'windwp/nvim-ts-autotag',
        'nvim-lua/plenary.nvim',
        'ThePrimeagen/harpoon',
        'mbbill/undotree',
        'nvim-lualine/lualine.nvim',
        'kdheepak/lazygit.nvim',
        'tpope/vim-surround',
        'tpope/vim-fugitive',
        'tpope/vim-rhubarb',
        'tpope/vim-sleuth',
        'mattn/emmet-vim',
        'chrisbra/colorizer',
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason-lspconfig.nvim" },
            { "j-hui/fidget.nvim",                tag = "legacy" },
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
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "MunifTanjim/eslint.nvim",
            "MunifTanjim/prettier.nvim",
        },
    },
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
