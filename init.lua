vim.g.start_time = vim.fn.reltime()

vim.cmd([[ syntax off | filetype off | filetype plugin indent off ]])

local rtp = vim.opt.runtimepath:get()

vim.g.loaded_remote_plugins = 1
vim.g.do_filetype_lua = 1

vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_ruby_provider = 1
vim.g.loaded_perl_provider = 1

vim.g.loaded_2html_plugin = 1
vim.g.loaded_fzf = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_logipat = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spec = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_sql_completion = 1
vim.g.loaded_syntax_completion = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

require('impatient')

vim.opt.shadafile = ''
vim.opt.runtimepath = rtp

vim.cmd([[
    runtime! plugin/**/*.vim
    runtime! plugin/**/*.lua
]])

require('options')
require('keymaps')
require('plugins')
require('compiled')
require('globals')

vim.cmd([[ rshada! ]])
vim.api.nvim_do_autocmd('BufEnter', {})
vim.cmd([[ syntax on | filetype on | filetype plugin indent on ]])
vim.cmd([[PackerLoad nvim-treesitter]])

local modules = {
	'plugins.packer',
	'modules',
	'autocmds',
	'highlights',
	'commands',
}

vim.defer_fn(function()
	for _, mod in ipairs(modules) do
		local ok, err = pcall(require, mod)
		if not ok then
			error(('Error loading %s\n%s'):format(mod, err))
		end
	end

	vim.cmd([[ silent! bufdo e ]])
end, 1)
