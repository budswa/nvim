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
	--[[ profile = {
		enable = true,
	}, ]]
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
				'ray-x/lsp_signature.nvim',
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

		-- Statusline
		use({
			'glepnir/galaxyline.nvim',
			requires = {
				'kyazdani42/nvim-web-devicons',
				'SmiteshP/nvim-gps'
			},
			config = function()
				require('ext/galaxyline')
			end,
		})

		-- Tabline
		use({
			'akinsho/bufferline.nvim',
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
			config = function()
				require('ext/project')
			end
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
		use({
			'ruifm/gitlinker.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('gitlinker').setup()
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
				'Pocco81/DAPInstall.nvim',
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

		-- Keymap
		use({
			'folke/which-key.nvim',
			config = function()
				require('keybindings')
			end,
		})
		use({
			'tjdevries/astronauta.nvim'
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

		-- Template manager
		use({
			'vigoux/templar.nvim',
		})

		-- Lastplace
		use({
			'ethanholz/nvim-lastplace',
			config = function()
				require('ext/lastplace')
			end,
		})

		-- Pastebin
		use({
			'rktjmp/paperplanes.nvim',
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
		--[[ use({
			'NTBBloodbath/doom-one.nvim',
		})
		-- vim.cmd('colorscheme doom-one' ]]
		use({
			'projekt0n/github-nvim-theme',
		})
		require('github-theme').setup()

		-- Misc
		use({
			'lewis6991/impatient.nvim',
		})
		use({
			'nathom/filetype.nvim',
			config = function()
				vim.g.did_load_filetypes = 1
			end
		})
		use({
			'andweeb/presence.nvim',
			config = function()
				require('ext/presence')
			end,
		})
		use({
			'max397574/better-escape.nvim',
			event = 'InsertEnter',
		})
		use({
			'Darazaki/indent-o-matic'
		})
		end,
})
