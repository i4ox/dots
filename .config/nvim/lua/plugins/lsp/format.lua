return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatter_by_ft = {
            options = {
                lua = { "stylua" },
            },
        },
        format_on_save = {
            pattern = ".lua",
            timeout_ms = 500,
            async = false,
            lsp_fallback = true,
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
