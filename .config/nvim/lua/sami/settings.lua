vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.timeoutlen = 250
vim.opt.showmatch = true
vim.opt.synmaxcol = 300 -- stop syntax highlighting for performance
vim.opt.laststatus = 2  -- always show statusline

-- vim.opt.cursorline = true
-- vim.cmd('highlight CursorLine ctermbg=darkblue guibg=darkblue')

-- Sidebar
vim.opt.numberwidth = 1
vim.opt.showcmd = true
vim.opt.cmdheight = 0

-- Search
vim.o.incsearch = true  -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true  -- case insentive unless capitals used in searcher

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "120"

local float = { focusable = true, style = "minimal", border = "rounded" }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#d8bd92" })

vim.filetype.add({
  extension = {
    mdx = "mdx",
    analog = "analog",
  },
})

vim.filetype.add({
  extension = {
    [".all-contributorsrc"] = ".all-contributorsrc",
  },
})

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("vue", "analog")
vim.treesitter.language.register("json", ".all-contributorsrc")
vim.o.clipboard = true
vim.g.copilot_assume_mapped = true
