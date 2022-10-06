local augroup, autocmd = vim.api.nvim_create_augroup, vim.api.nvim_create_autocmd

augroup('user', {})

--[[autocmd('BufWritePost', {
    pattern = '*.lua',
    callback = function()
        if vim.fn.expand('%:p'):match(vim.fn.stdpath('config')) then
            require('packer').compile()
            require('compiled')
        end
    end,
    group = 'user',
})]]

--[[autocmd("BufWritePost", {
	pattern = "plugins.lua",
	callback = function()
		for p, _ in pairs(package.loaded) do
			if p:find("^art.plugins") then
				package.loaded[p] = nil
			end
		end
		require("packer").compile()
		require("compiled")
	end,
	group = "user",
})]]

autocmd('BufWritePre', { command = '%s/\\s\\+$//e' })

autocmd('User', {
    pattern = 'PackerCompileDone',
    callback = function() vim.notify('Compile complete!', vim.log.levels.INFO, { title = 'Packer' }) end,
    group = 'user',
})

autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 600 }) end,
    group = 'user',
})

autocmd('VimResized', {
    command = 'tabdo wincmd =',
    group = 'user',
})

autocmd('FocusGained', {
    command = 'checktime',
    group = 'user',
})

autocmd('BufWritePre', {
    pattern = { '/tmp/*', '*.tmp', '*.bak', 'COMMIT_EDITMSD' },
    callback = function() vim.opt_local.undofile = false end,
    group = 'user',
})

autocmd('FileType', {
    pattern = { 'help', 'qf', 'lspinfo', 'startuptime' },
    callback = function() vim.keymap.set('n', 'q', '<cmd>close<cr>', { noremap = true, silent = true, buffer = true }) end,
    group = 'user',
})

autocmd('FileType', {
    pattern = 'man',
    callback = function() vim.keymap.set('n', 'q', '<cmd>quit<cr>', { noremap = true, silent = true, buffer = true }) end,
    group = 'user',
})

-- lastplace
augroup('lastplace', {})
autocmd('BufReadPost', {
    callback = function()
        local line = vim.fn.line
        if
            vim.tbl_contains(vim.api.nvim_list_bufs(), vim.api.nvim_get_current_buf())
            and not vim.tbl_contains({ 'qf', 'help', 'gitcommit', 'packer', 'toggleterm', 'neo-tree' }, vim.bo.ft)
        then
            if line([['"]]) > 1 and line([['"]]) <= line('$') then vim.cmd('normal! g`"') end
        end
    end,
    group = 'lastplace',
})

-- mkdir
--augroup('mkdir', {})
--autocmd('BufWritePre', {
--    pattern = '*',
--    group = 'mkdir',
--    callback = function()
--        require('art.custom.mkdir').mkdir()
--    end,
--})

if vim.env.TERM == 'xterm-kitty' then
    augroup('kitty', {})
    autocmd('UIEnter', {
        callback = function()
            if vim.api.nvim_eval('v:event.chan') == 0 then
                vim.fn['chansend'](vim.api.nvim_eval('v:stderr'), '\x1b[>1u')
            end
        end,
        group = 'kitty',
    })
    autocmd('UIEnter', {
        callback = function()
            if vim.api.nvim_eval('v:event.chan') == 0 then
                vim.fn['chansend'](vim.api.nvim_eval('v:stderr'), '\x1b[<1u')
            end
        end,
        group = 'kitty',
    })
end
