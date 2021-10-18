local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd('packadd packer.nvim')

require('packer').init({
	compile_path = vim.fn.stdpath('config') .. '/lua/.packer_compiled.lua',
	display = {
		title = 'Packer',
		prompt_border = 'single'
	},
	git = {
		clone_timeout = 300,
	},
	log = {level = 'info'},
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
			-- event = "BufRead",
			run = ':TSUpdate',
			config = function()
				require('ext/treesitter')
			end,
			requires = {
				'nvim-treesitter/nvim-treesitter-textobjects',
				'nvim-treesitter/playground',
				'p00f/nvim-ts-rainbow',
			},
		})

		-- LSP
		use({
			'neovim/nvim-lspconfig',
			-- event = "InsertCharPre",
			config = function()
				require('ext/lsp')
			end,
			requires = {
			'jose-elias-alvarez/null-ls.nvim',
				--'kabouzeid/nvim-lspinstall',
				'williamboman/nvim-lsp-installer',
				'folke/lua-dev.nvim',
				{
					'weilbith/nvim-code-action-menu',
					cmd = 'CodeActionMenu',
				}
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
				'quangnguyen30192/cmp-nvim-tags',
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
			},
		})

		-- Statusline
		use({
			'famiu/feline.nvim',
			branch = 'develop',
			requires = {
				'windwp/floatline.nvim',
				'kyazdani42/nvim-web-devicons',
				'SmiteshP/nvim-gps',
			},
			config = function()
				require('ext/statusline')
			end,
		})

		-- Tabline
		use({
			'akinsho/bufferline.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			-- event = "ColorScheme",
			config = function()
				require('ext/tabline')
			end,
		})

		-- File explorer
		use({
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			--[[ cmd = {
				'NvimTreeToggle',
				'NvimTreeRefresh'
			}, ]]
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
			-- cmd = { "ToggleTerm", "TermExec" },
		})

		-- Project and session management
		use({
			'folke/persistence.nvim',
			-- event = 'BufReadPre',
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
			requires = {
				'nvim-lua/plenary.nvim',
			},
			config = function()
				require('ext/gitsigns')
			end,
			-- event = "BufRead",
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
				require('ext/whichkey')
			end,
		})
		use({
			'tjdevries/astronauta.nvim'
		})

		-- Marks
		--use({
		--	'chentau/marks.nvim',
		--	config = function()
		--		require('marks').setup()
		--	end
		--})

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
			'winston0410/commented.nvim',
		})

		-- Search
		use({
			'kevinhwang91/nvim-hlslens',
			config = function()
				require('hlslens').setup()

			end,
		})
		use({
			'rktjmp/highlight-current-n.nvim',
		})

		-- Cursor word
		use({
			'xiyaowong/nvim-cursorword',
		})

		-- Colorizer
		use({
			'norcalli/nvim-colorizer.lua',
			config = function()
				require('ext/colorizer')
			end
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
			-- event = 'InsertEnter',
		})
		use({
			'Darazaki/indent-o-matic'
		})
		end,
})
