local use = require('packer').use

require('packer').startup({
	function()
		use({
			'wbthomason/packer.nvim',
			opt = true,
			event = 'vimenter',
		})

		-- Treesitter
		use({
			'nvim-treesitter/nvim-treesitter',
			opt = true,
			event = 'BufRead',
			run = ':TSUpdate',
			config = function()
				require('garden/ext/treesitter')
			end,
			requires = {
				'nvim-treesitter/nvim-treesitter-textobjects',
				'nvim-treesitter/playground',
				'JoosepAlviste/nvim-ts-context-commentstring',
				'p00f/nvim-ts-rainbow',
			},
		})

		-- LSP
		use({
			'neovim/nvim-lspconfig',
			opt = true,
			event = 'BufReadPre',
			config = function()
				require('garden/ext/lsp')
			end,
		})
		use({ 'jose-elias-alvarez/null-ls.nvim' })
		use({ 'williamboman/nvim-lsp-installer' })
		use({ 'folke/lua-dev.nvim' })
		use({ 'ii14/lsp-command', opt = true, after = 'nvim-lspconfig' })

		-- Completion
		use({
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			config = function()
				require('garden/ext/completion')
			end,
			requires = {
				{ 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
				{ 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter' },
				{ 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
				{ 'hrsh7th/cmp-path', event = 'InsertEnter' },
				{ 'hrsh7th/cmp-calc', event = 'InsertEnter' },
				{ 'ray-x/cmp-treesitter', event = 'InsertEnter' },
				{ 'lukas-reineke/cmp-rg', event = 'InsertEnter' },
				{ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
				{ 'hrsh7th/cmp-copilot', event = 'InsertEnter' },
			},
		})
		use({
			'L3MON4D3/LuaSnip',
			event = 'InsertEnter',
			requires = { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
		})
		use({ 'windwp/nvim-autopairs' })
		use({ 'ray-x/lsp_signature.nvim' })
		use({ 'onsails/lspkind-nvim' })

		-- Telescope
		use({
			'nvim-telescope/telescope.nvim',
			cmd = 'Telescope',
			config = function()
				require('garden/ext/telescope')
			end,
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-symbols.nvim',
			},
		})

		-- Statusline
		--use({
		--	'famiu/feline.nvim',
		--	branch = 'develop',
		--	requires = {
		--		'windwp/floatline.nvim',
		--		'kyazdani42/nvim-web-devicons',
		--	},
		--  config = function() require('garden/ext/statusline') end,
		--})

		-- File explorer
		use({
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			cmd = {
				'NvimTreeToggle',
				'NvimTreeRefresh',
			},
			config = function()
				require('garden/ext/nvimtree')
			end,
		})

		-- Terminal
		use({
			'akinsho/toggleterm.nvim',
			config = function()
				require('garden/ext/toggleterm')
			end,
			cmd = { 'ToggleTerm', 'TermExec', 'ToggleTermOpenAll', 'ToggleTermCloseAll' },
		})

		-- Code Actions
		use({
			'weilbith/nvim-code-action-menu',
			cmd = 'CodeActionMenu',
		})

		-- Renamer
		use({
			'filipdutescu/renamer.nvim',
			branch = 'master',
			event = 'BufRead',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('garden/ext/renamer')
			end,
		})

		-- Project and session management
		use({
			'folke/persistence.nvim',
			config = function()
				require('garden/ext/persistence')
			end,
		})
		use({ 'gpanders/editorconfig.nvim' })

		-- Git & VCS
		use({
			'lewis6991/gitsigns.nvim',
			event = 'BufRead',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('garden/ext/gitsigns')
			end,
		})
		use({
			'sindrets/diffview.nvim',
			cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewRefresh' },
			config = function()
				require('diffview').setup()
			end,
		})
		use({
			'ruifm/gitlinker.nvim',
			event = 'BufRead',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('gitlinker').setup()
			end,
		})

		-- Debug
		use({
			'mfussenegger/nvim-dap',
			requires = 'rcarriga/nvim-dap-ui',
			event = 'BufReadPre',
			config = function()
				require('garden/ext/dap')
			end,
		})
		use({
			'Pocco81/DAPInstall.nvim',
			event = 'BufReadPre',
		})
		use({ 'jbyuki/one-small-step-for-vimkind' })

		-- Refactoring
		use({
			'ThePrimeagen/refactoring.nvim',
			requires = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
			event = 'BufRead',
			config = function()
				require('refactoring').setup({})
			end,
		})

		-- Trouble
		use({
			'folke/trouble.nvim',
			cmd = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
			config = function()
				require('garden/ext/trouble')
			end,
		})

		-- Quickfix
		use({ 'kevinhwang91/nvim-bqf' })

		-- Keymap
		use({
			'folke/which-key.nvim',
			event = 'BufWinEnter',
			config = function()
				require('garden/ext/whichkey')
			end,
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
			event = 'BufRead',
			config = function()
				require('garden/ext/lightspeed')
			end,
		})
		use({
			'abecodes/tabout.nvim',
			event = 'BufRead',
			config = function()
				require('garden/ext/tabout')
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
				require('surround').setup({})
			end,
		})

		-- Comments
		use({
			'numToStr/Comment.nvim',
			event = 'BufRead',
			config = function()
				require('garden/ext/comment')
			end,
		})
		use({
			'folke/todo-comments.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('todo-comments').setup({})
			end,
		})

		-- Search
		use({
			'kevinhwang91/nvim-hlslens',
			config = function()
				require('hlslens').setup()
			end,
		})

		-- Colorizer
		use({
			'norcalli/nvim-colorizer.lua',
			event = { 'BufRead', 'BufNewFile' },
			config = function()
				require('colorizer').setup()
			end,
		})

		-- Undotree
		use({
			'mbbill/undotree',
			cmd = 'UndotreeToggle',
		})

		-- Copilot
		use({
			'github/copilot.vim',
			cmd = 'Copilot',
		})

		-- Zen
		use({
			'folke/zen-mode.nvim',
			config = function()
				require('garden.ext.zenmode')
			end,
			cmd = 'ZenMode',
		})
		use({
			'folke/twilight.nvim',
			config = function()
				require('garden.ext.twilight')
			end,
		})

		-- Lastplace
		use({
			'ethanholz/nvim-lastplace',
			event = 'BufRead',
			config = function()
				require('garden/ext/lastplace')
			end,
		})

		-- Pastebin
		use({ 'rktjmp/paperplanes.nvim' })

		-- Indentlines
		use({
			'lukas-reineke/indent-blankline.nvim',
			event = 'BufRead',
			config = function()
				require('garden/ext/indentline')
			end,
		})

		-- Stabalize
		use({
			'luukvbaal/stabilize.nvim',
			config = function()
				require('garden/ext/stabilize')
			end,
		})

		-- UI replacements
		use({
			'stevearc/dressing.nvim',
			config = function()
				require('garden/ext/dressing')
			end,
		})
		--use({
		--	'rcarriga/nvim-notify',
		--	config = function()
		--		require('garden/ext/notify')
		--	end,
		--})

		-- Greeter
		use({
			'startup-nvim/startup.nvim',
			requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
			config = function()
				require('startup').setup()
			end,
		})

		-- Colorscheme
		use({
			'projekt0n/github-nvim-theme',
			event = 'VimEnter',
			config = function()
				require('github-theme').setup()
			end,
		})

		-- Misc
		use({ 'lewis6991/impatient.nvim' })
		use({
			'lewis6991/spaceless.nvim',
			config = function()
				require('spaceless').setup()
			end,
		})
		use({
			'nathom/filetype.nvim',
			config = function()
				vim.g.did_load_filetypes = 1
			end,
		})
		use({
			'andweeb/presence.nvim',
			event = 'BufRead',
			config = function()
				require('presence'):setup()
			end,
		})
		use({
			'max397574/better-escape.nvim',
			event = 'InsertEnter',
		})
		use({
			'dstein64/vim-startuptime',
			cmd = 'StartupTime',
		})

		use({ 'tami5/sqlite.lua' })

		-- Language specific
		use({ 'tjdevries/nlua.nvim' })
	end,
})
