local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd 'packadd packer.nvim'

require('packer').init({
	compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',
	display = {
		title = 'Packer',
	},
	git ={
		clone_timeout = 300,
	},
	profile = {
		enable = true,
	},
})

local use = require('packer').use
require('packer').startup({function()
	use( 'wbthomason/packer.nvim' )

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('ext/treesitter')
		end,
		requires = {
			'p00f/nvim-ts-rainbow',
		}
	})

	-- LSP
	use({
		'neovim/nvim-lspconfig',
		config = function()
			require('ext/lsp')
		end,
		requires = {
			'kabouzeid/nvim-lspinstall',
			'folke/lua-dev.nvim'
		}
	})
	use({
		'folke/trouble.nvim',
		config = function()
			require('ext/trouble')
		end
	})

	-- Completion
	use({
		'hrsh7th/nvim-cmp',
			config = function()
				require('ext/completion')
			end,
			requires = {
				'onsails/lspkind-nvim',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				{
					'L3MON4D3/LuaSnip',
					requires = {
						'rafamadriz/friendly-snippets',
						'saadparwaiz1/cmp_luasnip'
					},
				},
			},
	})
	use({
		'windwp/nvim-autopairs',
	})
	use({
		'nvim-telescope/telescope.nvim',
		config = function()
			require('ext/telescope')
		end,
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-symbols.nvim',
			'sudormrfbin/cheatsheet.nvim'
		}
  })

	-- Statusline
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('ext/statusline')
		end
	}

	-- Treesitter
	use {
		'SmiteshP/nvim-gps',
		requires = {
			'nvim-treesitter/nvim-treesitter'
		}
	}

	-- File explorer
	use({
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('ext/nvimtree')
		end,
	})

	-- Terminal
	use({
		'akinsho/toggleterm.nvim',
		config = function()
			require('ext/toggleterm')
		end
	})

	-- Project and session management
	use({
		'folke/persistence.nvim',
		event = 'BufReadPre',
		module = 'persistence',
		config = function()
			require('persistence').setup()
		end,
	})
	use({
		'ahmedkhalf/project.nvim'
	})

	-- Git & VCS
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('ext/gitsigns')
		end,
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
	use({
		'sindrets/diffview.nvim',
		config = function()
			require('ext/diffview')
		end
	})

	-- Quickfix
	use ({
		'kevinhwang91/nvim-bqf'
	})

	-- Symbol outline
	use({
		'simrat39/symbols-outline.nvim'
	})

	-- Whichkey
	use({
		'folke/which-key.nvim',
		config = function()
		  require('keybindings')
		end
	})

	-- Surround
	use({
		'blackCauldron7/surround.nvim',
		config = function()
			require('ext/surround')
		end
	})

	-- Commenting
	use ({
		'b3nj5m1n/kommentary'
	})

	-- Indentlines
	use({
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('ext/indentline')
		end,
	})

	-- Colorscheme
	use({ 'NTBBloodbath/doom-one.nvim' })
	vim.cmd('colorscheme doom-one')
end})
