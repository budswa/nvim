--# selene: allow(global_usage)
_G.reload = function(mod)
    return require('plenary.reload').reload_module(mod)
end

_G.r = function(mod)
    _G.reload(mod)
    return require(mod)
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
