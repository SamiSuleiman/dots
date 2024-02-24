require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    experimental_watch_for_changes = true,
    delete_to_trash = true,
    keymaps_help = {
        border = "rounded",
    },
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
            return false
        end,
        -- sort = {
        --     -- sort order can be "asc" or "desc"
        --     -- see :help oil-columns to see which columns are sortable
        --     { "type", "asc" },
        --     { "name", "asc" },
        -- },
    },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
})
