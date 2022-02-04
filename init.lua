vim.g.start_time = vim.fn.reltime()

vim.cmd([[ syntax off | filetype off | filetype plugin indent off ]])
vim.opt.shadafile = ''

local modules = {
	'globals',
	'plugins.packer',
	'plugins',
	'compiled',
	'options',
	'modules',
	'autocmds',
	'keymaps',
}

require('impatient').enable_profile()

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(('Error loading %s...\n%s'):format(mod, err))
	end
end

vim.defer_fn(function()
	vim.cmd([[
		doautocmd BufRead
		syntax on
		filetype on
		filetype plugin indent on
	]])

	vim.cmd([[ silent! bufdo e ]])
end, 0)
