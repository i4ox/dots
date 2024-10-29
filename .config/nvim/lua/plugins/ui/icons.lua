return {
    'echasnovski/mini.icons',
    lazy = true,
    opts = {
        file = {
            ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
            ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
            ['go.mod'] = { glyph = "", hl = "MiniIconsAzure" },
            ['go.sum'] = { glyph = "", hl = "MiniIconsAzure" },
        },
        filetype = {
            go = { glyph = "", hl = "MiniIconsAzure" },
            dotenv = { glyph = '', hl = 'MiniIconsYellow' },
        },
    },
    init = function()
        package.preload['nvim-web-devicons'] = function()
            require('mini.icons').mock_nvim_web_devicons()
            return package.loaded['nvim-web-devicons']
        end
    end,
}
