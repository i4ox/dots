require("custom.statusline.components.mode")
require("custom.statusline.components.branch")
require("custom.statusline.components.diagnostics")
require("custom.statusline.components.saved")
require("custom.statusline.components.file")

require("custom.statusline.utils")
require("custom.statusline.colors")

function status_line()
    local mode = get_mode_component()
    local branch = get_branch_component()
    local file = get_file_component()
    local errors = get_errors_component()
    local warnings = get_warnings_component()
    local infos = get_infos_component()
    local saved = get_saved_component()

    return table.concat({
        get_component("StatusMode", mode),
        get_component("StatusBranch", branch),
        get_component("StatusFile", file),
        get_component_separator(),
        get_component("StatusSaved", saved),
        get_component("StatusErrors", errors),
        get_component("StatusWarnings", warnings),
        get_component("StatusInfos", infos),
    })
end

vim.cmd([[
    augroup Statusline
        au!
        au WinEnter,BufEnter * setlocal statusline=%!v:lua.status_line()
        au WinLeave,BufLeave * setlocal statusline=%!v:lua.status_line()
        au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.status_line()
    augroup END
]])