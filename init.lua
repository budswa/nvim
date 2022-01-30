vim.g.start_time = vim.fn.reltime()

vim.opt.termguicolors = true

local modules = {
	'globals',
	'plugins',
	'compiled',
	'options',
	'modules',
	'autocmds',
	'keymaps',
}

local impatient_ok, impatient = pcall(require, 'impatient')
if impatient_ok and vim.fn.exists(vim.fn.stdpath('cache') .. '/luacache') then
	impatient.enable_profile()
end

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(('Error loading %s...\n\n%s'):format(mod, err))
	end
end

vim.defer_fn(function()
	vim.cmd([[ silent! bufdo e ]])
end, 1)

