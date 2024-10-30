local M = {}
local key = vim.keymap.set

function M.general()
    -- Select all
    key('n', '<C-a>', 'gg<S-v>G')

    -- Moving lines up/down
    key("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
    key("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

    key("n", "<C-c>", "<Cmd>bdelete!<Cr>", { desc = "Close the buffer" })
end

function M.file_manager()
    key("n", "-", "<Cmd>Oil<Cr>", { desc = "Open parent directory" })
end

function M.git_client()
    key("n", "g-", "<Cmd>Neogit<Cr>", { desc = "Open git client" })
end

function M.git_signs(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        key(mode, l, r, opts)
    end

    -- [[ Navigation ]]
    map({ "n", "v" }, "]c", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to next hunk" })

    map({ "n", "v" }, "[c", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to previous hunk" })
end

return M
