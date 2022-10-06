local log = {
    logs = {
        all = {},
    },
}

log.defaults = {
    source = 'Neovim',
    dir = vim.api.nvim_call_function('stdpath', { 'cache' } .. '/log/'),
}

-- levels: trace, debug, info, warn, error, fatal
local log_level = art.config.log_level or 'info'
local log_level_notify = art.config.log_level_notify or 'warn'

local outfile = string.format('%s/%s.log', vim.api.nvim_call_function('stdpath', { 'cache' }), config.plugin)

local levels = {
    trace = 0,
    debug = 1,
    info = 2,
    warn = 3,
    error = 4,
}

for key, value in ipairs(levels) do
end

function log.log(message, level, source)
    local entry = string.format('[%s][%s %-6s]: %s', source or 'Neovim', level, os.date('%H:%M:%S'), message)
    log.logs.all:append(entry)
    vim.notify(message, vim)
    return entry
end

function log.notify(key, message)
    return function() notify.new(key, message) end
end

return log
