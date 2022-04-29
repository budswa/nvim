vim.api.nvim_create_augroup('user', {})

local autocmd = vim.api.nvim_create_autocmd

local ft_aucmd = function(pattern, ft)
    autocmd({ 'BufRead', 'BufEnter', 'BufNewFile' }, {
        pattern = pattern,
        command = [[set ft=]] .. ft,
        once = false,
    })
end

ft_aucmd('COMMIT_EDITMSG', 'gitcommit')

autocmd('BufWritePost', {
    pattern = 'plugins.lua',
    command = 'PackerCompile',
    group = 'user',
})

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 600 })
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
        vim.keymap.set('n', 'q', vim.cmd([[close]]), { noremap = true, silent = true, buffer = true })
    end,
    group = 'user',
})

autocmd('FileType', {
    pattern = 'man',
    callback = function()
        vim.keymap.set('n', 'q', vim.cmd([[quit]]), { noremap = true, silent = true, buffer = true })
    end,
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
