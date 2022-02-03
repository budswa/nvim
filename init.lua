vim.g.start_time = vim.fn.reltime()

vim.opt.termguicolors = true

local modules = {
	'globals',
	'packer',
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
	vim.cmd([[ silent! bufdo e ]])
end, 1)
