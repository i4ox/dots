return {
    "MeanderingProgrammer/render-markdown.nvim",
    main = "render-markdown",
    name = "render-markdown",
    opts = {},
    config = function(_, opts)
        require('render-markdown').setup(opts)
    end
}
