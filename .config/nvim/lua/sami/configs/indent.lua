local highlight = {
    "Gray"
}

local normal = {
    "Blue"
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Gray", { fg = "#122226" })
    vim.api.nvim_set_hl(0, "Blue", { fg = "#002B36" })
end)

return {
    require("ibl").setup {
        indent = { highlight = normal },
        scope = { highlight = highlight }
    }
}
