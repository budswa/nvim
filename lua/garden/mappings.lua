local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Navigate between windows
map('n', '<A-j>', '<C-w><C-j>')
map('n', '<A-k>', '<C-w><C-k>')
map('n', '<A-l>', '<C-w><C-l>')
map('n', '<A-h>', '<C-w><C-h>')
