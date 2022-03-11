vim.g.start_time = vim.fn.reltime()

vim.cmd([[ syntax off | filetype off | filetype plugin indent off ]])
vim.opt.termguicolors = true

require('impatient').enable_profile()
require('before')
require('globals')
require('compiled')

local modules = {
	'plugins.packer',
	'plugins',
	'options',
	'modules',
	'autocmds',
	'keymaps',
	'highlights',
	'commands',
}

vim.defer_fn(function()
	vim.cmd([[ syntax on | filetype on | filetype plugin indent on ]])

	for _, mod in ipairs(modules) do
		local ok, err = pcall(require, mod)
		if not ok then
			error(('Error loading %s\n%s'):format(mod, err))
		end
	end

	vim.api.nvim_do_autocmd('BufEnter', {})
	vim.cmd([[ silent! bufdo e ]])
end, 0)
