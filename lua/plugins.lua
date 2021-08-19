-- Packer & plugins
vim.cmd 'packadd cfilter'

local packer_path = vim.fn.stdpath('data')
	.. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		packer_path,
	})
end

vim.cmd 'packadd packer.nvim'
require('packer').sync()

require('packer').init({
	--compile_path = vim.fn.stdpath('cache') .. '/packer/packer_compiled.lua',
	git ={
		clone_timeout = 300,
	},
	profile = {
		enable = true,
	},
})

return require('packer').startup(function(use)
	-- Packer - Plugin manager
	use({
		'wbthomason/packer.nvim',
		opt = true,
	})

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		opt = true,
		run = ':TSUpdate',
		config = require('ext/treesitter'),
	})
	use({
		'p00f/nvim-ts-rainbow',
		after = 'nvim-treesitter'
	})
	use({ 
		'nvim-treesitter/playground',
		after = 'nvim-treesitter'
	})

	-- LSP
	use({
		'neovim/nvim-lspconfig',
		opt = true,
		config = require('ext/lsp'),
		event = 'ColorScheme',
	})
	use({
		'kabouzeid/nvim-lspinstall',
		--config = require(''),
		after = 'nvim-lspconfig',
	})

	-- Completion
	use({
		'hrsh7th/nvim-compe',
		requires = {
			
		},
		config = require('ext/completion'),
		opt = true,
		after = 'nvim-lspconfig',
	})
	use({
		'L3MON4D3/LuaSnip',
		--config = require(''),
		requires = { 'rafamadriz/friendly-snippets' },
		event = 'BufWinEnter',
	})
	use({
		'ray-x/lsp_signature.nvim',
		after = 'nvim-compe'
	})
	use({
		'onsails/lspkind-nvim',
		after = 'nvim-lspconfig',
	})
end)
