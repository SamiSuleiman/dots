vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.default_statusline = '__MODE__ %<%f __MACRO__ %h%m%r%=%-14.(%l/%L,%c%V%) %{v:lua.searchcount()}'

local function setup_statusline(macro, mode)
  local statusline = vim.g.default_statusline
  if macro == nil or macro == '' then
    statusline = string.gsub(statusline, '__MACRO__', '')
  else
    statusline = string.gsub(statusline, '__MACRO__', '[ recording: ' .. macro .. ']')
  end
  vim.opt.statusline = string.gsub(statusline, '__MODE__', '[' .. mode .. ']')
end

vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function()
    local reg_recording = vim.fn.reg_recording()
    local mode = vim.api.nvim_get_mode().mode
    setup_statusline(reg_recording, mode)
  end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    setup_statusline(nil, mode)
  end,
})

vim.api.nvim_create_autocmd('ModeChanged', {
  callback = function()
    local mode = vim.api.nvim_get_mode()
    local reg_recording = vim.fn.reg_recording()
    setup_statusline(reg_recording, mode.mode)
  end,
})

function _G.searchcount()
  local sc = vim.fn.searchcount { maxcount = 9999 } -- Get search count
  if sc.total > 0 then
    return string.format('[%d/%d]', sc.current, sc.total)
  end
  return 'No Search'
end

local symbols = { Error = '', Info = '', Hint = '󰋗', Warn = '' }

for name, icon in pairs(symbols) do
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.opt.guicursor = ''
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.colorcolumn = '120'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.cpoptions:append '>'
vim.opt.undofile = true
vim.opt.ruler = true
vim.opt.foldmethod = 'manual'
vim.opt.foldnestmax = 3
vim.opt.autoread = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.confirm = true
vim.opt.shell = '/bin/zsh'
vim.opt.wildmenu = true
vim.opt.timeoutlen = 250
vim.opt.showmatch = true
vim.opt.shortmess:remove 'S'
vim.opt.synmaxcol = 300 -- stop syntax highlighting for performance
vim.opt.laststatus = 2 -- always show statusline
vim.opt.foldenable = false
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.numberwidth = 2
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.showbreak = '↪'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', extends = '❯', precedes = '❮', nbsp = '␣', eol = '↲' }
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in searcher
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#92C2CB' })
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.treesitter.language.register('markdown', 'mdx')
vim.treesitter.language.register('vue', 'analog')
vim.treesitter.language.register('json', '.all-contributorsrc')
vim.g.copilot_assume_mapped = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cedit = '<Esc>'

vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 50

local float = { focusable = true, style = 'minimal', border = 'single' }
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, float)

vim.filetype.add {
  extension = {
    mdx = 'mdx',
    analog = 'analog',
  },
}
vim.filetype.add {
  extension = {
    ['.all-contributorsrc'] = '.all-contributorsrc',
  },
}

vim.cmd 'command Exec set splitright | vnew | set filetype=sh | read !sh #'
