return {
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

    local s = luasnip.snippet
    local t = luasnip.text_node
    local i = luasnip.insert_node

    -- vim.keymap.set({ 'i', 's' }, '<Tab>', function()
    --   if luasnip.choice_active() then
    --     luasnip.change_choice(1)
    --   end
    -- end)
    --
    -- vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
    --   if luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   end
    -- end, { silent = true })

    luasnip.add_snippets('typescript', {
      s('ngeffect', {
        t 'effect(',
        t '() => ',
        t '{',
        i(1),
        t '}',
        t ')',
      }),
      s('ngeffectf', {
        t 'private readonly _ = effect(',
        t '() => ',
        t '{',
        i(1),
        t '}',
        t ')',
      }),
      s('ngcomputed', {
        t 'computed(',
        t '() => ',
        t '{',
        i(1),
        t '}',
        t ')',
      }),
    })

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
}
