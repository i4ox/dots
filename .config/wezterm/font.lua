local wezterm = require("wezterm")

local M = {}

function M.update_config(config)
    config.line_height = 1.5
    config.cell_width = 1.0
    config.font = wezterm.font_with_fallback({
        { family = "CaskaydiaCove NF", weight = "Bold" },
    })
    config.font_size = 17.0
end

return M
