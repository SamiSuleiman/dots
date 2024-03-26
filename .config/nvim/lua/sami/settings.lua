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

local symbols = { Error = "", Info = "", Hint = "", Warn = "" }

for name, icon in pairs(symbols) do
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
-- vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- vim.opt.textwidth = 120
-- vim.opt.wrapmargin =
vim.opt.colorcolumn = "120"
-- vim.opt.cursorline = true
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
vim.opt.ruler = true
vim.opt.foldmethod = "manual"
vim.opt.foldnestmax = 3
vim.opt.autoread = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.confirm = true
vim.opt.shell = "/bin/zsh"
vim.opt.wildmenu = true
vim.opt.timeoutlen = 250
vim.opt.showmatch = true
vim.opt.synmaxcol = 300 -- stop syntax highlighting for performance
vim.opt.laststatus = 2  -- always show statusline
vim.opt.foldenable = false

-- vim.opt.cursorline = true
-- vim.cmd('highlight CursorLine ctermbg=darkblue guibg=darkblue')

-- Sidebar
vim.opt.numberwidth = 1
vim.opt.showcmd = true
vim.opt.cmdheight = 0


vim.opt.showbreak = "↪"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", extends = "❯", precedes = "❮", nbsp = "␣", eol = "↲" }

-- Search
vim.o.incsearch = true  -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true  -- case insentive unless capitals used in searcher

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

local float = { focusable = true, style = "minimal", border = "single" }

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#92C2CB" })

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

-- default split from bottom-right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- this is for using `Exec` for seeing shell file output in a new split window
vim.cmd("command Exec set splitright | vnew | set filetype=sh | read !sh #")
