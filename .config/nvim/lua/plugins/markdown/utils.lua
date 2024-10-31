return {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {},
    config = function(_, opts)
        require("markdown").setup(opts)
    end
}
