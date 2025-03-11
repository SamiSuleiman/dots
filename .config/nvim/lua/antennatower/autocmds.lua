local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.api.nvim_create_autocmd('LspProgress', {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(vim.lsp.status(), 'info', {
      id = 'lsp_progress',
      title = 'LSP Progress',
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == 'end' and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- vim.api.nvim_create_autocmd('RecordingEnter', {
--   callback = function()
--     local reg_recording = vim.fn.reg_recording()
--     local msg = '  Started recording ' .. '"' .. reg_recording .. '"'
--     vim.notify(msg, 'info', { title = 'Recording' })
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('RecordingLeave', {
--   callback = function()
--     local reg_recording = vim.fn.reg_recording()
--     local msg = '  Stopped recording ' .. '"' .. reg_recording .. '"'
--     vim.notify(msg, 'info', { title = 'Recording' })
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('ModeChanged', {
--   callback = function()
--     local mode = vim.api.nvim_get_mode()
--     if mode.mode ~= nil then
--       vim.opt.statusline = string.format('[%s] ', mode.mode) .. vim.g.default_statusline
--     end
--   end,
-- })
