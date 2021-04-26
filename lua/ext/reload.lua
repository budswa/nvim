local reload = require('nvim-reload')

local plugin_dirs = vim.fn.stdpath('data') .. '/site/pack/*/start/*'

-- reload.vim_reload_dirs = {
--     vim.fn.stdpath('config'),
--     plugin_dirs
-- }

reload.lua_reload_dirs = {
    vim.fn.stdpath('config'),
    plugin_dirs
}

-- reload.files_reload_external = {
--     vim.fn.stdpath('config') .. '/myfile.vim'
-- }

reload.modules_reload_external = { 'packer' }
