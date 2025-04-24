return {
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      -- Toggle autoformat
      local fmt_enabled = true
      vim.api.nvim_create_user_command('FormatToggle', function()
        fmt_enabled = not fmt_enabled
        print('Autoformat: ' .. tostring(fmt_enabled))
      end, {})

      -- Create per-client augroups
      local augroups = {}
      local function get_augroup(client)
        if not augroups[client.id] then
          augroups[client.id] = vim.api.nvim_create_augroup('lsp_fmt_' .. client.name, { clear = true })
        end
        return augroups[client.id]
      end

      -- on_attach with keymaps
      local on_attach = function(client, bufnr)
        local function nmap(keys, fn, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, fn, { buffer = bufnr, desc = desc })
        end
        local function imap(keys, fn, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('i', keys, fn, { buffer = bufnr, desc = desc })
        end

        -- formatting on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              if fmt_enabled then
                vim.lsp.buf.format { bufnr = bufnr, async = false }
              end
            end,
          })
        end

        -- common LSP keymaps
        nmap('<leader>er', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ea', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mpl')
        nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]ef')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]oc Symbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace Syms')
        nmap('<C-k>', vim.lsp.buf.hover, 'Hover')
        imap('<C-k>', vim.lsp.buf.signature_help, 'Signature')
        nmap('gD', vim.lsp.buf.declaration, '[G]oto Decl')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace +Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace -Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace List')
      end

      -- core setups
      require('mason').setup()
      require('mason-lspconfig').setup {
        automatic_installation = true,
        ensure_installed = {
          'eslint',
          'ts_ls',
          'omnisharp',
          'tailwindcss',
          'angularls',
          'cssls',
          'svelte',
          'clangd',
          'html',
          'lua_ls',
        },
      }
      require('neodev').setup()

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- per-server settings
      local servers = {
        html = { filetypes = { 'html', 'twig', 'hbs' } },
        lua_ls = {
          Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false } },
        },
      }

      require('mason-lspconfig').setup_handlers {
        function(server)
          require('lspconfig')[server].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = servers[server],
            filetypes = servers[server] and servers[server].filetypes,
            commands = {
              OrganizeImports = {
                function()
                  vim.lsp.buf.execute_command {
                    command = '_typescript.organizeImports',
                    arguments = { vim.api.nvim_buf_get_name(0) },
                  }
                end,
                description = 'Organize Imports',
              },
            },
          }
        end,
      }

      -- angular override
      local lsp = require 'lspconfig'
      lsp.angularls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'ngserver', '--stdio' },
        filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx' },
        root_dir = lsp.util.root_pattern('angular.json', 'nx.json'),
      }

      -- svelte override
      lsp.svelte.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { 'svelteserver', '--stdio' },
        filetypes = { 'svelte' },
        root_dir = lsp.util.root_pattern('svelte.config.js', 'svelte.config.cjs'),
      }
    end,
  },
}
