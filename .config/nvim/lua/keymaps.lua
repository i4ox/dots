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

function M.telescope()
    key('n', '<Leader>sf', '<Cmd>Telescope find_files<CR>') -- Search the Files
    key('n', '<Leader>sw', '<Cmd>Telescope grep_string<CR>') -- Search the Word
    key('n', '<Leader>sg', '<Cmd>Telescope live_grep<CR>') -- Search by Grep
    key('n', '<Leader>sb', '<Cmd>Telescope buffers<CR>') -- Search the Buffers
    key('n', '<Leader>so', '<Cmd>Telescope oldfiles<CR>') -- Search the Oldfiles
    key('n', '<Leader>sh', '<Cmd>Telescope help_tags<CR>') -- Search the Help
    key("n", "<Leader>st", vim.cmd.TodoTelescope) -- Search the Todos
end

function M.comment()
    vim.keymap.set("n", "gcc", vim.cmd.CommentToggle, { silent = true })
    vim.keymap.set("v", "gcc", ":'<,'>CommentToggle<Cr>", { silent = true })
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
