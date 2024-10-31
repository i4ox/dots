return {
    "stevearc/oil.nvim",
    opts = {
        default_file_explorer = true,
        delete_to_trash = true, -- instead permanently delete
        columns = {
            "icon",
            "permissions",
            "size",
        },
        win_options = {
            wrap = false,
            signcolumn = "no",
            spell = false,
            list = false,
        },
        keymaps = {
            ["-"] = "actions.parent",
            ["+"] = "actions.select",
            ["<CR>"] = "actions.select",
            ["g?"] = "actions.show_help",
            ["<C-h>"] = "actions.toggle_hidden",
        },
    },
    config = function(_, opts)
        require("oil").setup(opts)
        require("keymaps").file_manager()
    end,
}
