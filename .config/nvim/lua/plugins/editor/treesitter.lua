return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    opts_extend = { "ensure_installed" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            -- linux stuff
            "bash",
            -- markdown
            "markdown",
            "markdown_inline",
            -- configs
            "toml",
            "yaml",
            "xml",
            "json",
            "jsonc",
            -- go stuff
            "go",
            "gosum",
            "gomod",
            "gowork",
            "gotmpl",
            "sql",
            "regex",
            "query",
            "templ",
            "proto",
            -- devops stuff
            "terraform",
            "nginx",
            -- front hell stuff
            "html",
            "css",
            "javascript",
            "tsx",
            "typescript",
            -- vim stuff
            "lua",
            "luadoc",
            "luap",
            "vim",
            "vimdoc",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        textobjects = {
            move = {
                enable = true,
                goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[a"] = "@parameter.inner",
                },
                goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
