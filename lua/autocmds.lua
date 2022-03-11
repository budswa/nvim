vim.api.nvim_create_augroup('user', {})

local function autocmd(event, opts)
	vim.api.nvim_create_autocmd(event, opts)
end

autocmd('BufWritePost', {
	pattern = 'plugins.lua',
	group = 'user',
	command = 'PackerCompile',
})

autocmd('FocusGained', {
	pattern = '*',
	group = 'user',
	command = 'checktime',
})

autocmd('TextYankPost', {
	pattern = '*',
	group = 'user',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
	end,
})

autocmd('FileType', {
	pattern = { 'help', 'qf', 'lspinfo', 'startuptime' },
	group = 'user',
	callback = function()
		vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = true, silent = true, noremap = true })
	end,
})
