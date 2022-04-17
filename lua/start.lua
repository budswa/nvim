vim.opt.shadafile = ''
vim.opt.runtimepath = _G.rtp

vim.cmd([[
    runtime! plugin/**/*.lua
    runtime! plugin/**/*.vim
]])

require('options')
require('globals')
require('plugins')
require('compiled')
require('keymaps')
require('modules')
require('autocmds')
require('commands')

vim.cmd([[ rshada! ]])
vim.api.nvim_do_autocmd('BufEnter', {})
vim.cmd([[
	syntax on
	filetype on
	filetype plugin indent on
	PackerLoad nvim-treesitter
]])

vim.schedule(function()
	vim.cmd([[
	    silent! bufdo e
	    PackerLoad colorscheme
	]])
	require('highlights')
	require('options')
end)
