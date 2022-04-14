--# selene: allow(global_usage)
_G.reload = function(...)
    return require('plenary.reload').reload_module(...)
end

_G.r = function(name)
    _G.reload(name)
    return require(name)
end

_G.dump = function(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
    return ...
end

local M = {}

function M.termcode(key)
    return vim.api.nvim_replace_termcodes(key, true, true, true)
end

return M
