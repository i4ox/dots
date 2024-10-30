return {
    "terrortylor/nvim-comment",
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            opts = {
                enable_autocmd = false,
                languages = {
                    arduino = "/*%s*/",
                    html = "<!---%s--->",
                },
            },
        },
    },
    config = function()
        local nvim_comment = require("nvim_comment")
        local ts_context_commentstring = require("ts_context_commentstring")

        require("keymaps").comment()

        nvim_comment.setup({
            comment_empty = false,
            create_mappings = false,
            hook = ts_context_commentstring.update_commentstring,
        })
    end,
}
