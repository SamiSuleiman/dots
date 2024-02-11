local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'https://github.com/folke/lazy.nvim.git',
		'--filter=blob:none',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end

vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
	{
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {},
			config = function()
				require('lsp_signature').setup {
					bind = true, -- This is mandatory, otherwise border config won't get registered.
					padding = '|',
					hint_prefix = '',
					handler_opts = {
						border = "single"
					}
				}
			end
		},
		{ 'tpope/vim-surround' },
		{
			-- Highlight, edit, and navigate code
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
	},
	-- {
	--   "Equilibris/nx.nvim",

	--   dependencies = {
	--     "nvim-telescope/telescope.nvim",
	--   },

	--   opts         = {
	--     -- See below for config options
	--     nx_cmd_root = "npx nx",
	--   },

	--   -- Plugin will load when you use these keys
	--   keys         = {
	--     { "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "nx actions" }
	--   },
	-- },
}, {})

vim.defer_fn(function()
	require('nvim-treesitter.configs').setup {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = { 'c',
			'angular',
			'python',
			'regex',
			'cpp',
			'go',
			'lua',
			'python',
			'rust',
			'tsx',
			'javascript',
			'typescript',
			'vimdoc',
			'vim',
			'bash',
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim"
		},

		autotag = {
			enable = true,
		},
		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		auto_install = true,
		-- Install languages synchronously (only applied to `ensure_installed`)
		sync_install = false,
		-- List of parsers to ignore installing
		ignore_install = {},
		-- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
		modules = {},
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = '<c-space>',
				node_incremental = '<c-space>',
				scope_incremental = '<c-s>',
				node_decremental = '<M-space>',
			},
		},
		languages = {
			typescript = {
				-- Enable HTML and CSS highlighting within TypeScript files
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			html = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			css = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['aa'] = '@parameter.outer',
					['ia'] = '@parameter.inner',
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					[']m'] = '@function.outer',
					[']]'] = '@class.outer',
				},
				goto_next_end = {
					[']M'] = '@function.outer',
					[']['] = '@class.outer',
				},
				goto_previous_start = {
					['[m'] = '@function.outer',
					['[['] = '@class.outer',
				},
				goto_previous_end = {
					['[M'] = '@function.outer',
					['[]'] = '@class.outer',
				},
			},
			swap = {
				enable = true,
				swap_next = {
					['<leader>a'] = '@parameter.inner',
				},
				swap_previous = {
					['<leader>A'] = '@parameter.inner',
				},
			},
		},
	}
end, 0)
