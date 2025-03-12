return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      { 'j-hui/fidget.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      'neovim/nvim-lspconfig',
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

          -- vim.api.nvim_create_autocmd('BufWritePre', {
          -- group = get_augroup(client),
          -- buffer = bufnr,
          -- callback = function()
          --   if not format_is_enabled then
          --     return
          --   end

          -- vim.lsp.buf.format {
          --   async = false,
          --   bufnr = bufnr,
          --   filter = function(c)
          --     return c.name == 'null-ls'
          --   end,
          -- }
          -- vim.lsp.buf.format {
          --     async = false,
          --     filter = function(c)
          --         return c.id == client.id
          --     end,
          -- }
          -- end,
          -- })
        end,
      })

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        local imap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<F2>', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<C-.>', function()
          vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
        end, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        nmap('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')
        imap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
      end

      require('mason').setup()
      require('mason-lspconfig').setup()

      local servers = {
        eslint = {},
        ts_ls = {},
        omnisharp = {},
        tailwindcss = {},
        angularls = {},
        cssls = {},
        svelte = {},
        clangd = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      local function organize_imports()
        local params = {
          command = '_typescript.organizeImports',
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = '',
        }
        vim.lsp.buf.execute_command(params)
      end

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
            commands = {
              OrganizeImports = {
                organize_imports,
                description = 'Organize Imports',
              },
            },
          }
        end,
      }

      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
          spacing = 5,
          min = 'Warning',
        },
        update_in_insert = true,
      })

      local nvim_lsp = require 'lspconfig'
      nvim_lsp.angularls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        -- cmd = { 'angularls', '--stdio' },
        cmd = { 'ngserver', '--stdio', '--tsProbeLocations', '', '--ngProbeLocations', '' },
        filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx' },
        root_dir = nvim_lsp.util.root_pattern('angular.json', 'nx.json'),
      }

      nvim_lsp.svelte.setup {
        on_attach = function(client)
          on_attach()
          vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.ts', '*.js' },
            callback = function(ctx)
              client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
            end,
          })
        end,
        capabilities = capabilities,
        cmd = { 'svelteserver', '--stdio' },
        filetypes = { 'svelte' },
        root_dir = nvim_lsp.util.root_pattern('svelte.config.js', 'svelte.config.cjs'),
      }
    end,
  },
}
