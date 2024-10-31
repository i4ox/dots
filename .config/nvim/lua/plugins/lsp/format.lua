return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "golines", "gofumpt", "goimports-reviser" },
        },
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
