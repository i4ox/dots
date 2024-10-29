return {
    "EdenEast/nightfox.nvim",
    dependencies = {
        "xiyaowong/transparent.nvim",
        opts = {
            groups = { -- table: default groups
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
            },
            extra_groups = {
                "NvimTreeNormal",
                "NormalFloat",
                "NvimTreeEndOfBuffer",
                "StatusLine",
                "StatusLineNC",
                "CmpItemMenu",
                "NoiceScrollbar",
            }, -- table: additional groups that should be cleared
            exclude_groups = {
                "CursorLine",
                "CursorLineNr",
                "CursorColumn",
                "InclineNormalFloat",
                "InclineNormalFloatNC",
            }, -- table: groups you don't want to clear,
        },
    },
    lazy = false,
    priority = 1000,
    opts = {
        options = {
            transparent = true,
	    terminal_colors = true,
        },
    },
    config = function(_, opts)
        require("nightfox").setup(opts)
        vim.cmd [[colorscheme carbonfox]]
    end,
}
