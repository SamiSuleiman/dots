return {
  {
    'tpope/vim-repeat',
    'onsails/lspkind.nvim',
    'windwp/nvim-ts-autotag',
    'nvim-lua/plenary.nvim',
    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',
    'chrisbra/colorizer',
    'windwp/nvim-ts-autotag',
    'christoomey/vim-tmux-navigator',
    'nvim-tree/nvim-web-devicons',
    {
      'folke/zen-mode.nvim',
      opts = {},
    },
    {
      'nvimtools/none-ls.nvim',
      opts = {},
      config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting
        null_ls.setup {
          sources = {
            formatting.stylua,
            formatting.gofmt,
            formatting.prettierd.with {
              filetypes = { 'javascript', 'typescript', 'json', 'css', 'scss', 'html', 'markdown', 'svelte', 'yaml' },
            },
          },
        }
      end,
    },
    {
      'akinsho/bufferline.nvim',
      enabled = true,
      version = '*',
      opts = {},
    },
    {
      'echasnovski/mini.move',
      version = '*',
      opts = {
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<A-h>',
          right = '<A-l>',
          down = '<A-j>',
          up = '<A-k>',

          -- Aove current line in Normal mode
          line_left = '<A-h>',
          line_right = '<A-l>',
          line_down = '<A-j>',
          line_up = '<A-k>',
        },
      },
    },
    {
      'microsoft/vscode-js-debug',
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    },
    {
      'mxsdev/nvim-dap-vscode-js',
      requires = { 'mfussenegger/nvim-dap' },
      opts = {
        debugger_path = '/home/sami/.local/share/nvim/lazy/vscode-js-debug',
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      },
    },
    {
      'tpope/vim-dadbod',
      enabled = false,
    },
    {
      'github/copilot.vim',
      enabled = true,
    },
    {
      'ThePrimeagen/harpoon',
      opts = {
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      },
    },
    {
      'stevearc/oil.nvim',
      opts = {
        default_file_explorer = true,
        columns = { 'icon' },
        experimental_watch_for_changes = true,
        delete_to_trash = true,
        keymaps_help = {
          border = 'rounded',
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, '.')
          end,
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<C-c>'] = 'actions.close',
          ['<C-l>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
      },
    },
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason-lspconfig.nvim', opts = {} },
      { 'j-hui/fidget.nvim', tag = 'legacy' },
      { 'folke/neodev.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
    },
    config = function()
      local format_is_enabled = true
      vim.api.nvim_create_user_command('FormatToggle', function()
        format_is_enabled = not format_is_enabled
        print('Setting autoformatting to: ' .. tostring(format_is_enabled))
      end, {})

      local _augroups = {}
      local get_augroup = function(client)
        if not _augroups[client.id] then
          local group_name = 'lsp-format-' .. client.name
          local id = vim.api.nvim_create_augroup(group_name, { clear = true })
          _augroups[client.id] = id
        end

        return _augroups[client.id]
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach-format', { clear = true }),
        callback = function(args)
          local client_id = args.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)
          local bufnr = args.buf

          if not client.server_capabilities.documentFormattingProvider then
            return
          end

          if client.name == 'tsserver' then
            return
          end

          vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              if not format_is_enabled then
                return
              end

              vim.lsp.buf.format {
                async = false,
                bufnr = bufnr,
                filter = function(c)
                  return c.name == 'null-ls'
                end,
              }
              -- vim.lsp.buf.format {
              --     async = false,
              --     filter = function(c)
              --         return c.id == client.id
              --     end,
              -- }
            end,
          })
        end,
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
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
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},

          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  { 'folke/which-key.nvim', opts = {} },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
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
        'bash',
        'go',
        'gomod',
        'gowork',
        'gosum',
        'html',
        'javascript',
        'json',
        'lua',
        'rust',
        'css',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
    },
  },
  {
    'NeogitOrg/neogit',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',

      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
    },
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'nxls',
        'stylua',
        'prettierd',
      },
    },
  },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mlde
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          { 'nvim-neotest/nvim-nio' },
        },
      },

      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        automatic_setup = true,
        handlers = {},
        ensure_installed = {
          'delve',
        },
      }

      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<F6>', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<F7>', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })

      dapui.setup {
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        mappings = {
          expand = '<CR>',
          open = 'o',
          remove = 'd',
          edit = 'e',
          repl = 'r',
        },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
      }

      vim.keymap.set('n', '<F8>', dapui.toggle, { desc = 'Debug: See last session result.' })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      require('dap-go').setup()

      for _, language in ipairs { 'typescript', 'javascript' } do
        require('dap').configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Start Chrome with "localhost"',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
          },
        }
      end
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = {},
        typescript = { 'eslint_d' },
      }
      local eslint = require('lint').linters.eslint_d

      eslint.args = {
        '--no-warn-ignored',
        '--format',
        'json',
        '--stdin',
        '--stdin-filename',
        function()
          return vim.api.nvim_buf_get_name(0)
        end,
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
  {
    'bluz71/nvim-linefly',
    config = function()
      vim.g.linefly_options = {
        separator_symbol = '⎪',
        progress_symbol = '↓',
        active_tab_symbol = '▪',
        git_branch_symbol = '',
        error_symbol = 'E',
        warning_symbol = 'W',
        information_symbol = 'I',
        ellipsis_symbol = '…',
        tabline = false,
        winbar = false,
        with_file_icon = true,
        with_git_branch = true,
        with_git_status = true,
        with_diagnostic_status = true,
        with_session_status = true,
        with_attached_clients = true,
        with_macro_status = true,
        with_search_count = true,
        with_spell_status = false,
        with_indent_status = false,
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    enabled = false,
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
        lualine_c = { 'filename' },
        lualine_x = {
          {
            'recording',
            fmt = function()
              local recording = vim.fn.reg_recording()
              return recording ~= '' and recording or nil
            end,
            icon = '',
            -- color = { fg = '#BAC2DE', bg = '#191724' },
            color = { fg = '#BAC2DE', bg = '#191724' },
            padding = { left = 1, right = 1 },
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
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      },
    },
  },
}
