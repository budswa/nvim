local api = vim.api

local M = {}

function M.InsertEnter()
    local curline = api.nvim_win_get_cursor(0)[1]
    vim.b.insert_top = curline
    vim.b.insert_bottom = curline
    vim.b.whitespace_lastline = curline
end

local function atTipOfUndo()
    local tree = vim.fn.undotree()
    return tree.seq_last == tree.seq_cur
end

local function stripWhitespace(top, bottom)
    -- Only do if the buffer is modifiable
    -- and modified and we are at the tip of an undo tree
    if not (vim.bo.modifiable and vim.bo.modified and atTipOfUndo()) then
        return
    end

    if not top then
        return
    end

    -- All conditions passed, go ahead and strip
    -- Handle the user deleting lines at the bottom
    local file_bottom = vim.fn.line('$')

    if top > file_bottom then
        -- The user deleted all the lines; there is nothing to do
        return
    end

    vim.b.bottom = math.min(file_bottom, bottom)

    -- Keep the cursor position and these marks:
    local original_cursor = vim.fn.getcurpos()
    local first_changed = vim.fn.getpos("'[")
    local last_changed = vim.fn.getpos("']")

    vim.cmd('silent exe ' .. top .. " ',' " .. vim.b.bottom .. " 's/\\v\\s+$//e'")

    vim.fn.setpos("']", last_changed)
    vim.fn.setpos("'[", first_changed)
    vim.fn.setpos('.', original_cursor)
end

function M.TextChanged()
    -- Text was modified in non-Insert mode.  Use the '[ and '] marks to find
    -- what was edited and remove its whitespace.
    stripWhitespace(vim.fn.line("'["), vim.fn.line("']"))
end

function M.TextChangedI()
    -- Handle motion this way (rather than checking if
    -- b:insert_bottom < curline) to catch the case where the user presses
    -- Enter, types whitespace, moves up, and presses Enter again.
    local curline = api.nvim_win_get_cursor(0)[1]

    if vim.b.whitespace_lastline < curline then
        -- User inserted lines below whitespace_lastline
        vim.b.insert_bottom = vim.b.insert_bottom + (curline - vim.b.whitespace_lastline)
    elseif vim.b.whitespace_lastline > curline then
        -- User inserted lines above whitespace_lastline
        vim.b.insert_top = math.max(1, vim.b.insert_top - (vim.b.whitespace_lastline - curline))
    end

    vim.b.whitespace_lastline = curline
end

function M.InsertLeave()
    stripWhitespace(vim.b.insert_top, vim.b.insert_bottom)
end

function M.BufLeave()
    if api.nvim_get_mode().mode == 'i' then
        stripWhitespace(vim.b.insert_top, vim.b.insert_bottom)
    end
end

function M.BufEnter()
    if api.nvim_get_mode().mode == 'i' then
        M.InsertEnter()
    end
end

function M.setup()
    vim.api.nvim_create_augroup('whitespace', {})
    vim.api.nvim_create_autocmd('InsertEnter', {
        pattern = '*',
        group = 'whitespace',
        callback = function()
            M.InsertEnter()
        end,
    })
    vim.api.nvim_create_autocmd('InsertLeave', {
        pattern = '*',
        group = 'whitespace',
        callback = function()
            M.InsertLeave()
        end,
    })
    vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*',
        group = 'whitespace',
        callback = function()
            M.BufEnter()
        end,
    })
    vim.api.nvim_create_autocmd('BufLeave', {
        pattern = '*',
        group = 'whitespace',
        callback = function()
            M.BufLeave()
        end,
    })
    vim.api.nvim_create_autocmd('TextChanged', {
        pattern = '*',
        group = 'whitespace',
        callback = function()
            M.TextChanged()
        end,
    })
    vim.api.nvim_create_autocmd('TextChangedI', {
        pattern = '*',
        group = 'whitespace',
        callback = function()
            M.TextChangedI()
        end,
    })
end

return M
