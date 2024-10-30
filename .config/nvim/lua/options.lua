local options = {
	-- [[ Columns ]]
	-- Display line numbers
	number = true,
	-- Use relative numbers
	relativenumber = true,
	-- Keep signcolumt on by default
	signcolumn = "yes",
	-- Disable cursor line highlighting
	cursorline = false,
	-- Disable cursor column highlighting
	cursorcolumn = false,

	-- [[ Indenting ]]
	-- Enable break indent
	breakindent = true,
	-- Autoindent when going on a new line
	smartindent = true,
	-- Use spaces instead of tabs
	expandtab = true,
	-- Use 4 spaces for indent
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,

	-- [[ Undofile ]]
	undofile = true,
	undodir = os.getenv("HOME") .."/.vim/undodir/",

	-- [[ Backup ]]
	backup = false,

	-- [[ Swapfile ]]
	swapfile = false,

    -- [[ Searching ]]
    -- Case-sensitive searching
    ignorecase = true,
    smartcase = true,
    -- Show the searched pattern in real-time
    incsearch = true,

    -- [[ Navigation ]]
    scrolloff = 8,

    -- [[ Autocomplete ]]
    -- Better completion experience
    completeopt = "menuone,noselect",

    -- [[ Folds ]]
    foldcolumn = "1",
    foldlevel = 99,
    foldlevelstart = 99,
    foldenable = true,
    fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]],

    -- [[ Misc. ]]
    -- Decrease update time
    updatetime = 50,
    -- Enable mouse mode
    mouse = "a",
    -- Enable 24bit RGB color
    termguicolors = true,
    -- Clipboard
    clipboard = "unnamedplus",
    -- Disable wrap
    wrap = false
}

local globals = {
    mapleader = ' ',
    maplocalleader = ' ',
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

for k, v in pairs(globals) do
    vim.g[k] = v
end
