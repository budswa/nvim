local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd('packadd packer.nvim')

require('packer').init({
	compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
	display = {
		title = 'Packer',
		prompt_border = 'single',
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
			opt = true,
			event = 'BufRead',
			run = ':TSUpdate',
			config = function()
				require('garden/ext/treesitter')
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
			opt = true,
			event = 'BufReadPre',
			config = function()
				require('garden/ext/lsp')
			end,
			requires = {},
		})
		use({
			'jose-elias-alvarez/null-ls.nvim',
		})
		use({
			'williamboman/nvim-lsp-installer',
		})
		use({
			'folke/lua-dev.nvim',
		})

		-- Completion
		use({
			'hrsh7th/nvim-cmp',
			event = { 'InsertEnter', 'CmdLineEnter' },
			config = function()
				require('garden/ext/completion')
			end,
			requires = 'onsails/lspkind-nvim',
		})
		use({ 'hrsh7th/cmp-nvim-lsp' })
		use({ 'hrsh7th/cmp-buffer' })
		use({ 'hrsh7th/cmp-path' })
		use({ 'hrsh7th/cmp-calc' })
		use({ 'ray-x/cmp-treesitter' })
		use({ 'quangnguyen30192/cmp-nvim-tags' })
		use({ 'lukas-reineke/cmp-rg' })
		use({ 'hrsh7th/cmp-cmdline' })
		use({ 'hrsh7th/cmp-nvim-lsp-document-symbol' })
		use({
			'L3MON4D3/LuaSnip',
			requires = {
				'saadparwaiz1/cmp_luasnip',
				'rafamadriz/friendly-snippets',
			},
		})
		use({
			'windwp/nvim-autopairs',
		})
		use({
			'ray-x/lsp_signature.nvim',
		})

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
				{
					'benfowler/telescope-luasnip.nvim',
					module = 'telescope._extensions.luasnip',
				},
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
		--	config = function()
		--		require('garden/ext/statusline')
		--	end,
		--})
		use({
			'windwp/windline.nvim',
			event = 'BufRead',
			config = function()
				require('garden/ext/windline')
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
			module = 'persistence',
			config = function()
				require('garden/ext/persistence')
			end,
		})
		use({
			'gpanders/editorconfig.nvim',
		})

		-- Git & VCS
		use({
			'lewis6991/gitsigns.nvim',
			event = 'BufRead',
			requires = {
				'nvim-lua/plenary.nvim',
			},
			config = function()
				require('garden/ext/gitsigns')
			end,
		})
		use({
			'sindrets/diffview.nvim',
			cmd = {
				'DiffviewOpen',
				'DiffviewClose',
				'DiffviewRefresh',
			},
			config = function()
				require('garden/ext/diffview')
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
			event = 'BufReadPre',
			config = function()
				require('garden/ext/dap')
			end,
			requires = 'rcarriga/nvim-dap-ui',
		})
		use({
			'Pocco81/DAPInstall.nvim',
			event = 'BufReadPre',
		})
		use({ 'jbyuki/one-small-step-for-vimkind' })

		-- Refactoring
		use({
			'ThePrimeagen/refactoring.nvim',
			event = 'BufRead',
			config = function()
				require('garden/ext/refactoring')
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
			event = 'BufWinEnter',
			config = function()
				require('garden/ext/whichkey')
			end,
		})
		use({
			'tjdevries/astronauta.nvim',
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
			--after = 'nvim-cmp',
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
				require('garden/ext/surround')
			end,
		})

		-- Commenting
		use({
			'winston0410/commented.nvim',
			config = function()
				require('garden/ext/commented')
			end,
		})

		-- Search
		use({
			'kevinhwang91/nvim-hlslens',
			config = function()
				require('hlslens').setup()
			end,
		})
		use({ 'rktjmp/highlight-current-n.nvim' })

		-- Cursor word
		use({ 'xiyaowong/nvim-cursorword' })

		-- Colorizer
		use({
			'norcalli/nvim-colorizer.lua',
			event = {
				'BufRead',
				'BufNewFile',
			},
			config = function()
				require('garden/ext/colorizer')
			end,
		})

		-- Undotree
		use({ 'mbbill/undotree' })

		-- Copilot
		use({ 'github/copilot.vim' })

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

		-- Greeter
		use({
			'goolord/alpha-nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('garden/ext/alpha')
			end,
		})

		-- Colorscheme
		use({
			'projekt0n/github-nvim-theme',
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
				require('garden/ext/presence')
			end,
		})
		use({
			'max397574/better-escape.nvim',
			event = 'InsertEnter',
		})
		use({ 'dstein64/vim-startuptime' })

		-- Language specific
		use({ 'tjdevries/nlua.nvim' })
	end,
})
