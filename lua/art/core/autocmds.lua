vim.api.nvim_create_augroup('user', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
    pattern = 'plugins.lua',
    command = 'PackerCompile',
    group = 'user',
})

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
    end,
    group = 'user',
})

autocmd('VimResized', {
    pattern = '*',
    command = 'tabdo wincmd =',
    group = 'user',
})

autocmd('FocusGained', {
    pattern = '*',
    command = 'checktime',
    group = 'user',
})

autocmd('BufWritePre', {
    pattern = { '/tmp/*', '*.tmp', '*.bak', 'COMMIT_EDITMSD' },
    callback = function()
        vim.opt_local.undofile = false
    end,
    group = 'user',
})

autocmd('FileType', {
    pattern = { 'help', 'qf', 'lspinfo', 'startuptime' },
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = true, silent = true, noremap = true })
    end,
    group = 'user',
})

if vim.env.TERM == 'xterm-kitty' then
    vim.api.nvim_create_augroup('kitty', {})
    autocmd('UIEnter', {
        pattern = '*',
        callback = function()
            if vim.api.nvim_eval('v:event.chan') == 0 then
                vim.fn['chansend'](vim.api.nvim_eval('v:stderr'), '\x1b[>1u')
            end
        end,
        group = 'kitty',
    })
    autocmd('UIEnter', {
        pattern = '*',
        callback = function()
            if vim.api.nvim_eval('v:event.chan') == 0 then
                vim.fn['chansend'](vim.api.nvim_eval('v:stderr'), '\x1b[<1u')
            end
        end,
        group = 'kitty',
    })
end
