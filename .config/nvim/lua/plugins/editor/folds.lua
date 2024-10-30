return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
        local ufo = require("ufo")

        vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "[Z][R] Open all folds" })
        vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "[Z][M] Close all folds" })

        ufo.setup({
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
        })
    end,
}
