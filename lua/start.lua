vim.opt.shadafile = ''
vim.opt.runtimepath = _G.rtp

vim.cmd([[
    runtime! plugin/**/*.lua
    runtime! plugin/**/*.vim
]])

require('options')
require('utils')
require('plugins')
--require('compiled')
local ok, compiled = pcall(require, 'compiled')
if ok then
    require('compiled')
end
require('keymaps')
require('modules')
require('autocmds')
require('commands')

vim.cmd([[
    rshada!
    doautocmd BufRead
	syntax on
	filetype on
	filetype plugin indent on
	PackerLoad nvim-treesitter
]])

vim.schedule(function()
    vim.cmd([[
	    silent! bufdo e
	    PackerLoad colorscheme
	]]  )
    require('highlights')
    require('options')
end)
