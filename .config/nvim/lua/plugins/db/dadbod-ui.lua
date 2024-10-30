return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "plsql" }, lazy = true },
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
