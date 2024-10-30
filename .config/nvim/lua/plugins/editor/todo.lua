return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")

        todo_comments.setup({
            highlight = {
                pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
            },
            search = {
                pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
            },
        })
    end,
}
