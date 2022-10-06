-- https://github.com/ii14/lsp-command
local function command_callback() end
local function completion() end

local function buf_create_commands(bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Lsp', command_callback, { nargs = '*', completion = completion })
end

return buf_create_commands