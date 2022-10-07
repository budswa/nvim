_G.art = {
    config = {
        colorscheme = "cleareye",
        font = "Dank Mono",
        transparent = false,
        dashboard = true,
        border = "rounded",
        log_level = "warn", -- trace, debug, info, warn, error, fatal
    },
    colors = {},
    --headless = (#vim.api.nvim_list_uis() == 0),
    --os = vim.loop.os_uname().sysname,
}

require("impatient")

vim.opt.loadplugins = false

vim.api.nvim_command("syntax off")
vim.api.nvim_command("filetype off")
vim.api.nvim_command("filetype plugin indent off")
vim.opt.shadafile = "NONE"

--[[if vim.fn.exists('g:neovide') then
    vim.opt.guifont = string.format('%s:h16', art.config.font)
    vim.g.neovide_transparency = art.config.transparent and 0.9 or 1
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_no_idle = true
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_underline_automatic_scaling = true
    vim.g.neovide_hide_mouse_when_typing = true
end]]

vim.schedule(function()
    -- Manually load Neovim runtime
    -- WARNING: enable only if using 'vim.g.loadplugins'
    vim.api.nvim_command("runtime! plugin/**/*.vim")
    vim.api.nvim_command("runtime! plugin/**/*.lua")

    vim.api.nvim_command("syntax on")
    vim.api.nvim_command("filetype on")
    vim.api.nvim_command("filetype plugin indent on")
    vim.opt.shadafile = ""
    vim.api.nvim_command("rshada!")

    local loaded_art, art_err = xpcall(require, debug.traceback, "art")
    if not loaded_art then
        vim.notify(string.format("There was an error requiring 'core'. Traceback:\n%s", art_err), vim.log.levels.ERROR)
    end

    vim.api.nvim_exec_autocmds("BufEnter", {})
end)
