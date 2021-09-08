local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd('packadd packer.nvim')

require('packer').init({
	compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',
	display = {
		title = 'Packer',
	},
	git = {
		clone_timeout = 300,
	},
	profile = {
		enable = true,
	},
})

local use = require('packer').use
require('packer').startup({
	function()
		use('wbthomason/packer.nvim')

		-- Treesitter
		use({
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function()
				require('ext/treesitter')
			end,
			requires = {
				'p00f/nvim-ts-rainbow',
			},
		})

		-- LSP
		use({
			'neovim/nvim-lspconfig',
			config = function()
				require('ext/lsp')
			end,
			requires = {
				'jose-elias-alvarez/null-ls.nvim',
				'kabouzeid/nvim-lspinstall',
				'folke/lua-dev.nvim',
			},
		})

		-- Completion
		use({
			'hrsh7th/nvim-cmp',
			config = function()
				require('ext/completion')
			end,
			requires = {
				'onsails/lspkind-nvim',
				'ray-x/cmp-treesitter',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-calc',
				{
					'L3MON4D3/LuaSnip',
					requires = {
						'rafamadriz/friendly-snippets',
						'saadparwaiz1/cmp_luasnip',
					},
				},
			},
		})
		use({
			'windwp/nvim-autopairs',
		})

		-- Telescope
		use({
			'nvim-telescope/telescope.nvim',
			config = function()
				require('ext/telescope')
			end,
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-symbols.nvim',
				'sudormrfbin/cheatsheet.nvim',
				{
					'nvim-telescope/telescope-frecency.nvim',
					requires = 'tami5/sql.nvim',
				},
			},
		})
		use({
			'SmiteshP/nvim-gps',
			requires = {
				'nvim-treesitter/nvim-treesitter',
			},
		})

		-- Statusline
		--[[ use({
			'famiu/feline.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('ext/statusline')
			end,
		}) ]]
		use({
			'glepnir/galaxyline.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('ext/galaxyline')
			end,
		})

		-- Tabline
		use({
			'romgrk/barbar.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('ext/tabline')
			end,
		})

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
			end,
		})

		-- Project and session management
		use({
			'folke/persistence.nvim',
			event = 'BufReadPre',
			module = 'persistence',
			config = function()
				require('ext/persistence')
			end,
		})
		use({
			'ahmedkhalf/project.nvim',
		})
		use({
			'gpanders/editorconfig.nvim',
		})

		-- Git & VCS
		use({
			'lewis6991/gitsigns.nvim',
			config = function()
				require('ext/gitsigns')
			end,
			requires = {
				'nvim-lua/plenary.nvim',
			},
		})
		use({
			'sindrets/diffview.nvim',
			config = function()
				require('ext/diffview')
			end,
		})

		-- Debug
		use({
			'mfussenegger/nvim-dap',
			config = function()
				require('ext/dap')
			end,
			requires = {
				'rcarriga/nvim-dap-ui',
				'jbyuki/one-small-step-for-vimkind',
			},
		})

		-- Refactoring
		use({
			'ThePrimeagen/refactoring.nvim',
			config = function()
				require('ext/refactoring')
			end,
		})

		-- Trouble
		use({
			'folke/trouble.nvim',
			config = function()
				require('ext/trouble')
			end,
		})

		-- Quickfix
		use({
			'kevinhwang91/nvim-bqf',
		})

		-- Symbol outline
		use({
			'simrat39/symbols-outline.nvim',
		})

		-- Whichkey
		use({
			'folke/which-key.nvim',
			config = function()
				require('keybindings')
			end,
		})

		-- Motions
		use({
			'ggandor/lightspeed.nvim',
			config = function()
				require('ext/lightspeed')
			end,
			after = 'nvim-cmp',
		})
		use({
			'abecodes/tabout.nvim',
			config = function()
				require('ext/tabout')
			end,
		})
		use({
			'nacro90/numb.nvim',
			config = function()
				require('numb').setup()
			end,
		})

		-- Surround
		use({
			'blackCauldron7/surround.nvim',
			config = function()
				require('ext/surround')
			end,
		})

		-- Commenting
		use({
			'b3nj5m1n/kommentary',
		})

		-- Increment/ decrement
		use({
			'monaqa/dial.nvim',
			config = function()
				require('ext/dial')
			end,
		})

		-- Search
		use({
			'kevinhwang91/nvim-hlslens',
			config = function()
				require('ext/hlslens')
			end,
		})
		use({
			'rktjmp/highlight-current-n.nvim',
		})

		-- Cursor word
		use({
			'xiyaowong/nvim-cursorword',
		})

		-- Lastplace
		use({
			'ethanholz/nvim-lastplace',
			config = function()
				require('nvim-lastplace').setup()
			end,
		})

		-- Indentlines
		use({
			'lukas-reineke/indent-blankline.nvim',
			config = function()
				require('ext/indentline')
			end,
		})

		-- Greeter
		use({
			'goolord/alpha-nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('ext/alpha')
			end,
		})

		-- Colorscheme
		use({
			'NTBBloodbath/doom-one.nvim',
		})
		use({
		  'projekt0n/github-nvim-theme'
		})
		vim.cmd('colorscheme doom-one')

		-- Misc
		use({
			'andweeb/presence.nvim',
			config = function()
				require('ext/presence')
			end,
		})
		use({
			'jdhao/better-escape.vim',
			event = 'InsertEnter',
		})
		use({
			'rktjmp/paperplanes.nvim',
		})
	end,
})
