_G.art = {
    config = {
        colorscheme = 'cleareye',
        font = 'Dank Mono',
        transparent = true,
        dashboard = true,
        border = 'rounded',
        log_level = 'warn', -- trace, debug, info, warn, error, fatal
    },
    colors = {},
    headless = (#vim.api.nvim_list_uis() == 0),
    os = vim.loop.os_uname().sysname,
}

require('impatient')
if pcall(require, 'compiled') then require('compiled') end
require('art.options')
vim.schedule(function()
    vim.cmd.highlight('clear')
    require('art.colors').set('builtin')
    require('art.plugins')
    require('art.filetypes')
    require('art.autocommands')
    require('art.commands')
    require('art.keymaps')
    require('art.utils')
end)
