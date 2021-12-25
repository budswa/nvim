local ok, packer = pcall(require, 'packer')
if not ok then
	print('Packer is not installed')
end

local use = packer.use

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
				require('garden.ext.treesitter')
			end,
			requires = {
				{ 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' },
				'nvim-treesitter/playground',
				'JoosepAlviste/nvim-ts-context-commentstring',
				'p00f/nvim-ts-rainbow',
			},
		})

		-- LSP
		use({
			'neovim/nvim-lspconfig',
			requires = 'williamboman/nvim-lsp-installer',
			event = 'BufReadPre',
			config = function()
				require('garden.ext.lsp')
			end,
		})
		use({ 'jose-elias-alvarez/null-ls.nvim' })
		use({ 'folke/lua-dev.nvim' })
		use({ 'ii14/lsp-command', opt = true, after = 'nvim-lspconfig' })

		-- Completiond
		use({
			'hrsh7th/nvim-cmp',
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
			event = 'InsertEnter',
			config = function()
				require('garden.ext.completion')
			end,
		})
		use({
			'L3MON4D3/LuaSnip',
			event = 'InsertEnter',
			requires = 'rafamadriz/friendly-snippets',
		})
		use({ 'windwp/nvim-autopairs' })
		use({ 'ray-x/lsp_signature.nvim' })
		use({ 'onsails/lspkind-nvim' })

		-- Telescope
		use({
			'nvim-telescope/telescope.nvim',
			requires = 'nvim-lua/plenary.nvim',
			cmd = 'Telescope',
			config = function()
				require('garden.ext.telescope')
			end,
		})

		-- File explorer
		use({
			'kyazdani42/nvim-tree.lua',
			requires = 'kyazdani42/nvim-web-devicons',
			cmd = {
				'NvimTreeToggle',
				'NvimTreeRefresh',
			},
			config = function()
				require('garden.ext.nvimtree')
			end,
		})

		-- Terminal
		use({
			'akinsho/toggleterm.nvim',
			config = function()
				require('garden.ext.toggleterm')
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
				require('garden.ext.renamer')
			end,
		})

		-- Project and session management
		use({
			'folke/persistence.nvim',
			config = function()
				require('garden.ext.persistence')
			end,
		})
		use({ 'gpanders/editorconfig.nvim' })

		-- Git & VCS
		use({
			'lewis6991/gitsigns.nvim',
			event = 'BufRead',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('garden.ext.gitsigns')
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
				require('garden.ext.dap')
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
				require('garden.ext.trouble')
			end,
		})

		-- Quickfix
		use({ 'kevinhwang91/nvim-bqf' })

		-- Keymap
		use({
			'folke/which-key.nvim',
			event = 'BufWinEnter',
			config = function()
				require('garden.ext.whichkey')
			end,
		})

		-- spellsitter
		--use({
		--	'lewis6991/spellsitter.nvim',
		--config = function()
		--	require('spellsitter').setup()
		--end
		--})

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
				require('garden.ext.lightspeed')
			end,
		})
		use({
			'abecodes/tabout.nvim',
			event = 'BufRead',
			config = function()
				require('garden.ext.tabout')
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
			event = 'BufRead',
			config = function()
				require('surround').setup({})
			end,
		})

		-- Comments
		use({
			'numToStr/Comment.nvim',
			event = 'BufRead',
			config = function()
				require('garden.ext.comment')
			end,
		})
		use({
			'folke/todo-comments.nvim',
			requires = 'nvim-lua/plenary.nvim',
			event = 'BufRead',
			config = function()
				require('todo-comments').setup({})
			end,
		})

		-- Search
		use({
			'kevinhwang91/nvim-hlslens',
			event = 'BufRead',
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
			cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
			config = function()
				require('garden.ext.twilight')
			end,
		})

		-- Lastplace
		use({
			'ethanholz/nvim-lastplace',
			event = 'BufRead',
			config = function()
				require('garden.ext.lastplace')
			end,
		})

		-- Pastebin
		use({ 'rktjmp/paperplanes.nvim' })

		-- Indentlines
		use({
			'lukas-reineke/indent-blankline.nvim',
			event = 'BufRead',
			config = function()
				require('garden.ext.indentline')
			end,
		})

		-- UI replacements
		use({
			'stevearc/dressing.nvim',
			event = 'BufWinEnter',
			config = function()
				require('garden.ext.dressing')
			end,
		})
		--use({
		--	'rcarriga/nvim-notify',
		--	config = function()
		--		require('garden.ext.notify')
		--	end,
		--})

		-- Markdown preview
		use({
			'davidgranstrom/nvim-markdown-preview',
			config = function()
				vim.g.nvim_markdown_preview_theme = 'github'
			end,
		})

		-- Move
		use({ 'fedepujol/move.nvim' })

		-- Colorschemes
		--use({
		--	'projekt0n/github-nvim-theme',
		--	event = 'VimEnter',
		--	config = function()
		--		require('github-theme').setup()
		--	end,
		--})
		use({
			'rose-pine/neovim',
			as = 'rose-pine',
			event = 'VimEnter',
			config = function()
				vim.g.rose_pine_disable_float_background = true
				vim.cmd('colorscheme rose-pine')
			end,
		})

		-- Misc
		use({ 'lewis6991/impatient.nvim' })
		use({ 'dhruvasagar/vim-table-mode' })
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
