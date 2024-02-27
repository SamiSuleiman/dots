local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
    border = nil,
    cmd = { "nvim" },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostic_config = {},
    diagnostics_format = "#{m}",
    fallback_severity = vim.diagnostic.severity.ERROR,
    log_level = "warn",
    notify_format = "[null-ls] %s",
    on_attach = nil,
    on_init = nil,
    on_exit = nil,
    root_dir = require("null-ls.utils").root_pattern("tsconfig.json", ".null-ls-root", "Makefile", ".git"),
    should_attach = nil,
    temp_dir = nil,
    update_in_insert = false,
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[estit] #{m}\n(#{c})'
        }),
        null_ls.builtins.diagnostics.fish
    }
})
