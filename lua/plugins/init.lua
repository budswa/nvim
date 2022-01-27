require('plugins.packer')
local packer = require('packer')

packer.init({
	compile_path = vim.fn.stdpath('config') .. '/lua/compiled.lua',
	auto_clean = true,
	compile_on_sync = true,
	display = {
		title = 'Packer',
		prompt_border = 'rounded',
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end,
	},
	git = {
		clone_timeout = 300,
	},
	profile = {
		enable = true,
	},
})

local use = packer.use
local rocks = packer.use_rocks

require('packer').startup({
	function()
		use({ 'wbthomason/packer.nvim' })
		use({ 'lewis6991/impatient.nvim' })
		use({ 'nvim-lua/plenary.nvim' })

		-- Treesitter
		use({
			'nvim-treesitter/nvim-treesitter',
			opt = true,
			event = 'BufRead',
			run = ':TSUpdate',
			config = function()
				require('plugins.treesitter')
			end,
			requires = {
				{ 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' },
				'nvim-treesitter/playground',
				'JoosepAlviste/nvim-ts-context-commentstring',
				'windwp/nvim-ts-autotag',
			},
		})
		use({ 'p00f/nvim-ts-rainbow' })

		-- LSP
		use({
			'neovim/nvim-lspconfig',
			requires = 'williamboman/nvim-lsp-installer',
			event = 'BufReadPre',
			config = function()
				require('plugins.lsp')
			end,
		})
		use({
			'jose-elias-alvarez/null-ls.nvim',
			requires = 'PlatyPew/format-installer.nvim',
		})
		use({ 'folke/lua-dev.nvim' })
		use({ 'ii14/lsp-command', opt = true, after = 'nvim-lspconfig' })
		use({
			'j-hui/fidget.nvim',
			config = function()
				require('fidget').setup({
					text = { spinner = 'bouncing_bar' },
				})
			end,
		})

		-- Completion
		use({
			'hrsh7th/nvim-cmp',
			--'iron-e/nvim-cmp',
			--branch = 'feat/completion-menu-borders',
			event = { 'InsertEnter', 'CmdLineEnter' },
			requires = {},
			--event = 'InsertEnter',
			config = function()
				require('plugins.cmp')
			end,
		})
		use({ 'petertriho/cmp-git', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-buffer', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-path', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-calc', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'ray-x/cmp-treesitter', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'lukas-reineke/cmp-rg', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-copilot', event = 'InsertEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-cmdline', event = 'CmdLineEnter', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lsp-signature-help', event = 'CmdLineEnter', after = 'nvim-cmp' })
		use({
			'L3MON4D3/LuaSnip',
			event = 'InsertEnter',
			requires = 'rafamadriz/friendly-snippets',
		})

		use({
			'windwp/nvim-autopairs',
			event = 'BufRead',
			config = function()
				require('plugins.autopairs')
			end,
		})
		use({ 'ray-x/lsp_signature.nvim' })
		use({ 'JASONews/glow-hover' })
		use({ 'onsails/lspkind-nvim' })

		-- Telescope
		use({
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-lua/popup.nvim',
				'nvim-telescope/telescope-frecency.nvim',
				'nvim-telescope/telescope-file-browser.nvim',
				'nvim-telescope/telescope-hop.nvim',
			},
			cmd = 'Telescope',
			config = function()
				require('plugins.telescope')
			end,
		})

		-- File explorer
		use({
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons',
				config = function()
					require('nvim-web-devicons').setup()
				end,
			},
			cmd = { 'NvimTreeToggle', 'NvimTreeRefresh' },
			config = function()
				require('plugins.nvimtree')
			end,
		})

		-- Terminal
		use({
			'akinsho/toggleterm.nvim',
			event = 'BufWinEnter',
			config = function()
				require('plugins.toggleterm')
			end,
			--cmd = { 'ToggleTerm', 'TermExec', 'ToggleTermOpenAll', 'ToggleTermCloseAll' },
		})
		use({
			'yioneko/nvim-yati',
			requires = 'nvim-treesitter/nvim-treesitter',
			config = function()
				require('nvim-treesitter.configs').setup({
					yati = { enable = true },
				})
			end,
		})

		-- Code Actions
		use({
			'weilbith/nvim-code-action-menu',
			cmd = 'CodeActionMenu',
		})

		-- Annotation generator
		use({
			'danymat/neogen',
			after = 'nvim-treesitter',
			config = function()
				require('plugins.neogen')
			end,
		})

		-- Session management
		use({
			'Shatur/neovim-session-manager',
			config = function()
				require('plugins.sessions')
			end,
		})
		use({ 'gpanders/editorconfig.nvim' })

		-- Git & VCS
		use({
			'lewis6991/gitsigns.nvim',
			event = 'BufRead',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('plugins.gitsigns')
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

		-- Debugging and testing
		use({
			'mfussenegger/nvim-dap',
			requires = 'rcarriga/nvim-dap-ui',
			event = 'BufReadPre',
			config = function()
				require('plugins.dap')
			end,
		})
		use({
			'Pocco81/DAPInstall.nvim',
			event = 'BufReadPre',
		})
		use({ 'jbyuki/one-small-step-for-vimkind' })
		use({ 'notomo/vusted' })

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
				require('plugins.trouble')
			end,
		})

		-- Quickfix
		use({
			'stefandtw/quickfix-reflector.vim',
			config = function()
				vim.g.qf_write_changes = 0
			end,
		})

		use({
			'kevinhwang91/nvim-bqf',
			ft = 'qf',
			config = function()
				require('bqf').setup()
			end,
		})

		--use({
		--	'ldelossa/litee.nvim',
		--	requires = {
		--		'ldelossa/litee-calltree.nvim',
		--		'ldelossa/litee-symboltree.nvim',
		--		'ldelossa/litee-filetree.nvim'
		--	},
		--	config = function()
		--		require('plugins.litee')
		--	end
		--})

		use({
			'ThePrimeagen/harpoon',
			config = function()
				require('harpoon').setup({})
			end,
		})

		-- Whichkey
		use({
			'max397574/which-key.nvim',
			--'folke/which-key.nvim',
			event = 'BufWinEnter',
			config = function()
				require('plugins.whichkey')
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
				require('plugins.lightspeed')
			end,
		})
		use({
			'abecodes/tabout.nvim',
			event = 'BufRead',
			config = function()
				require('plugins.tabout')
			end,
		})
		use({
			'nacro90/numb.nvim',
			event = 'BufRead',
			config = function()
				require('numb').setup()
			end,
		})
		use({
			'kana/vim-textobj-user',
			event = 'BufEnter',
		})

		-- Surround
		use({
			'blackCauldron7/surround.nvim',
			event = 'BufRead',
			config = function()
				require('plugins.surround')
			end,
		})
		use({
			'numToStr/Comment.nvim',
			event = 'BufRead',
			config = function()
				require('plugins.comment')
			end,
		})
		use({ 'LudoPinelli/comment-box.nvim' })
		--use({
		--	'folke/todo-comments.nvim',
		--	requires = 'nvim-lua/plenary.nvim',
		--	event = 'BufRead',
		--	config = function()
		--		require('todo-comments').setup({})
		--	end,
		--})

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

		use({
			'mizlan/iswap.nvim',
			cmd = { 'ISwap', 'ISwapWith' },
			config = function()
				require('plugins.iswap')
			end,
		})

		-- Zen
		use({
			'folke/zen-mode.nvim',
			config = function()
				require('plugins.zenmode')
			end,
			cmd = 'ZenMode',
		})
		use({
			'folke/twilight.nvim',
			cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
			config = function()
				require('plugins.twilight')
			end,
		})

		use({
			'goolord/alpha-nvim',
			config = function()
				require('plugins.alpha')
			end,
		})

		use({
			'anuvyklack/pretty-fold.nvim',
			config = function()
				require('plugins.fold')
			end,
		})

		-- Lastplace
		use({
			'ethanholz/nvim-lastplace',
			event = 'BufRead',
			config = function()
				require('plugins.lastplace')
			end,
		})

		-- Note taking
		use({
			'nvim-neorg/neorg',
			require = 'nvim-lua/plenary.nvim',
			config = function()
				require('plugins.neorg')
			end
		})
		use({
			'mickael-menu/zk-nvim',
			config = function()
				require('plugins.zk')
			end,
		})

		-- Pastebin
		use({ 'rktjmp/paperplanes.nvim' })

		-- Indentlines
		use({
			'lukas-reineke/indent-blankline.nvim',
			--event = 'BufRead',
			config = function()
				require('plugins.indentline')
			end,
		})

		-- UI replacements
		use({
			'stevearc/dressing.nvim',
			opt = true,
			event = 'BufWinEnter',
			config = function()
				require('plugins.dressing')
			end,
		})
		use({
			'rcarriga/nvim-notify',
			event = 'VimEnter',
			config = function()
				require('plugins.notify')
			end,
		})

		use({
			'AckslD/nvim-neoclip.lua',
			config = function()
				require('neoclip').setup()
			end,
		})

		-- Markdown preview
		use({
			'davidgranstrom/nvim-markdown-preview',
			config = function()
				vim.g.nvim_markdown_preview_theme = 'github'
			end,
		})

		-- Emacs Narrowing for Vim
		use({
			'chrisbra/NrrwRgn',
			opt = 'true',
			cmd = { 'NR', 'NW' },
		})

		-- Search and replace
		use({
			'nvim-pack/nvim-spectre',
			event = 'BufEnter',
			config = function()
				require('spectre').setup()
			end,
		})

		-- Move
		use({ 'fedepujol/move.nvim' })

		-- Colorschemes
		use({
			'themercorp/themer.lua',
			event = 'VimEnter',
			config = function()
				require('plugins.themer')
			end,
		})
		--use({
		--	'projekt0n/github-nvim-theme',
		--	event = 'VimEnter',
		--	config = function()
		--		require('github-theme').setup()
		--	end,
		--})
		--use({
		--	'rose-pine/neovim',
		--	as = 'rose-pine',
		--	event = 'VimEnter',
		--	config = function()
		--		vim.g.rose_pine_disable_float_background = true
		--		vim.cmd('colorscheme rose-pine')
		--	end,
		--})

		-- Misc
		use({
			'dhruvasagar/vim-table-mode',
			cmd = 'TableModeToggle',
		})
		use({
			'lewis6991/spaceless.nvim',
			config = function()
				require('spaceless').setup()
			end,
		})
		use({ 'nathom/filetype.nvim' })
		use({ 'zeertzjq/nvim-paste-fix' })
		use({
			'monkoose/matchparen.nvim',
			config = function()
				require('matchparen').setup()
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
		use({ 'tjdevries/vim9jit' })
		use({
			'dstein64/vim-startuptime',
			cmd = 'StartupTime',
		})
		use({ 'antoinemadec/FixCursorHold.nvim' })
		use({ 'tami5/sqlite.lua', module = 'sqlite' })
		use({ 'nanotee/luv-vimdocs' })

		-- Language specific
		use({ 'tjdevries/nlua.nvim' })

		rocks({ 'luazip', 'penlight', 'lua-cjson' })
	end,
})
