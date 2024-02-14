local highlight = {
    "DarkBlue",
}

local scope = {
    "Yellow",
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "DarkBlue", { fg = "#1f3e4c" })
    vim.api.nvim_set_hl(0, "Yellow", { fg = "#b58900" })
end)

return {
    require("ibl").setup {
        scope = { highlight = scope },
        indent = { highlight = highlight }
    }
}
