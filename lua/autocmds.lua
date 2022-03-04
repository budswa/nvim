--telescope = {
--    {
--        'User',
--        'TelescopeFindPre',
--        [[
--lua vim.o.laststatus=0; vim.cmd'autocmd BufWinLeave * ++once lua vim.o.laststatus=2'
--        ]],
--    },
--},

vim.api.nvim_create_augroup('user', {})

vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = 'plugins.lua',
	group = 'user',
	command = 'PackerCompile',
})

vim.api.nvim_create_autocmd('FocusGained', {
	pattern = '*',
	group = 'user',
	command = 'checktime',
})

vim.api.nvim_create_autocmd('TextYankPost', {
	pattern = '*',
	group = 'user',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
	end,
})

vim.api.nvim_create_autocmd('WinEnter', {
	pattern = '*',
	group = 'user',
	command = 'setlocal cursorline',
})

vim.api.nvim_create_autocmd('WinLeave', {
	pattern = '*',
	group = 'user',
	command = 'setlocal nocursorline',
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'help', 'qf', 'lspinfo', 'startuptime' },
	group = 'user',
	callback = function()
		vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = true, silent = true, noremap = true })
	end,
})
