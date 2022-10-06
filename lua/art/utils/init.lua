function art.dump(...)
    vim.pretty_print(...)
end

function art.reload(module)
    module = module or ''
    local ok, plenary = pcall(require, 'plenary')
    if ok then
        for _, dir in ipairs(vim.fn.glob('./lua/*', 0, 1)) do
            plenary.reload.reload_modul(dir:gsub('./lua/', ''))
            require('plenary.reload').reload_module(dir:gsub('./lua/', ''))
        end
    end

    local luacache = (_G.__luacache or {}).cache
    for pack, _ in pairs(package.loaded) do
        if matcher(pack) then
            package.loaded[pack] = nil
            if luacache then luacache[pack] = nil end
        end
    end
end

--https://github.com/folke/dot/blob/b82b90b14da12b43a00f22d557fc5913ce776fe3/config/nvim/lua/util/init.lua#L20
function art.profile(cmd, times)
    times = times or 20
    local args = {}
    if type(cmd) == 'string' then
        args = { cmd }
        cmd = vim.cmd
    end
    local start = vim.loop.hrtime()
    for _ = 1, times, 1 do
        local ok = pcall(cmd, unpack(args))
        if not ok then error('Command failed: ' .. tostring(ok) .. ' ' .. vim.inspect({ cmd = cmd, args = args })) end
    end
    print(((vim.loop.hrtime() - start) / 1000000 / times) .. 'ms')
end

local M = {}

function M.try(fn, ...)
    local args = { ... }

    return xpcall(function() return fn(unpack(args)) end, function(err)
        local lines = {}
        table.insert(lines, err)
        table.insert(lines, debug.traceback('', 3))

        M.error(table.concat(lines, '\n'))
        return err
    end)
end

function M.info(msg, name) vim.notify(msg, vim.log.levels.INFO, { title = name or 'Neovim configuration error!' }) end

function M.warn(msg, name) vim.notify(msg, vim.log.levels.WARN, { title = name or 'Neovim configuration error!' }) end

function M.error(msg, name) vim.notify(msg, vim.log.levels.ERROR, { title = name or 'Neovim configuration error!' }) end

function M.toggle(option, silent)
    local info = vim.api.nvim_get_option_info(option)
    local scopes = { buf = 'bo', win = 'wo', global = 'o' }
    local scope = scopes[info.scope]
    local options = vim[scope]
    options[option] = not options[option]
    if silent ~= true then
        if options[option] then
            M.info('enabled vim.' .. scope .. '.' .. option, 'Toggle')
        else
            M.warn('disabled vim.' .. scope .. '.' .. option, 'Toggle')
        end
    end
end

function M.termcode(key) return vim.api.nvim_replace_termcodes(key, true, true, true) end

function M.border(style, hl)
    style = style or art.config.border
    hl = hl or false
    local characters = {}

    if style == 'rounded' then
        characters = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
    elseif style == 'single' then
        characters = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
    elseif style == 'solid' then
        characters = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' }
    end

    if hl == true then
        for i, v in ipairs(characters) do
            characters[i] = { v, 'FloatBoarder' }
        end
    elseif type(hl) == 'string' then
        for i, v in ipairs(characters) do
            characters[i] = { v, hl }
        end
    end
    return characters
end

function M.exists()
    local stat = vim.loop.fs_stat(fname)
    return (stat and stat.type) or false
end

function M.mkdir()
    local dir = vim.fn.expand('%:p:h')
    if not vim.loop.fs_stat(dir) == 0 then vim.fn.mkdir(dir, 'p') end
end

return M
