local present, packer = pcall(require, 'packer')

_G.bootstrap = false
if not present then
	local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

	vim.fn.delete(packer_path, 'rf')
	print('Cloning packer...')
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		'--depth',
		'1',
		packer_path,
	})

	vim.cmd([[packadd packer.nvim]])

	local now_present, now_packer = pcall(require, 'packer')

	if now_present then
		print('Packer installed successfully...')
		_G.bootstrap = true
		packer = now_packer
	else
		error("Couldn't install packer!\nPacker path: " .. packer_path .. '\n' .. now_packer)
	end
end

local use = packer.use
local rocks = packer.use_rocks

packer.init({
	compile_path = vim.fn.stdpath('config') .. '/lua/compiled.lua',
	max_jobs = 16,
	auto_clean = true,
	compile_on_sync = true,
	display = {
		title = 'Packer',
		prompt_border = 'rounded',
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
	git = { clone_timeout = 300 },
	profile = { enable = true },
})

packer.startup({
	function()
		rocks({ 'penlight', 'lua-cjson', 'promise-lua', 'lualogging' })

		use({ 'wbthomason/packer.nvim', opt = true })
		use({ 'lewis6991/impatient.nvim' })
		use({ 'nvim-lua/plenary.nvim' })

		-- Treesitter
		use({
			'nvim-treesitter/nvim-treesitter',
			opt = true,
			run = ':TSUpdate',
			config = function()
				require('plugins.treesitter')
			end,
			requires = {
				{ 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' },
				{ 'RRethy/nvim-treesitter-endwise', event = 'InsertEnter' },
				'RRethy/nvim-treesitter-textsubjects',
				'nvim-treesitter/nvim-treesitter-refactor',
				'nvim-treesitter/playground',
				'JoosepAlviste/nvim-ts-context-commentstring',
				'windwp/nvim-ts-autotag',
			},
		})
		use({ 'p00f/nvim-ts-rainbow' })
		use({ 'TornaxO7/tree-setter' })
		use({
			'romgrk/nvim-treesitter-context',
			event = 'InsertEnter',
			config = function()
				--vim.cmd([[hi! link TreesitterContext Visual]])
				require('treesitter-context.config').setup({
					enable = true,
					patterns = {
						default = {
							'class',
							'function',
							'method',
							'for',
							'field',
							'if',
						},
					},
				})
			end,
		})

		-- LSP
		use({
			'neovim/nvim-lspconfig',
			requires = {
				'williamboman/nvim-lsp-installer',
				'folke/lua-dev.nvim',
			},
			event = 'BufReadPre',
			config = function()
				require('plugins.lsp')
			end,
		})
		use({ 'jose-elias-alvarez/null-ls.nvim' })
		use({ 'lukas-reineke/lsp-format.nvim' })
		use({
			'mfussenegger/nvim-lint',
			config = function()
				require('plugins.lint')
			end,
		})
		--use({ 'nanotee/sqls.nvim' })
		use({ 'ii14/lsp-command', opt = true, after = 'nvim-lspconfig' })
		use({
			'j-hui/fidget.nvim',
			event = 'BufEnter',
			config = function()
				require('fidget').setup({
					text = { spinner = 'bouncing_bar' },
				})
			end,
		})
		use({
			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
			config = function()
				require('toggle_lsp_diagnostics').init()
			end,
		})
		--use({ 'p00f/clangd_extensions.nvim' })

		-- Completion
		use({
			'hrsh7th/nvim-cmp',
			branch = 'dev',
			event = { 'InsertEnter', 'CmdLineEnter' },
			config = function()
				require('plugins.cmp')
			end,
		})
		use({ 'petertriho/cmp-git', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
		use({ 'ray-x/cmp-treesitter', after = 'nvim-cmp' })
		use({ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' })
		use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })
		use({ 'zbirenbaum/copilot-cmp', after = { 'copilot.lua', 'nvim-cmp' } })

		use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' })
		use({
			'L3MON4D3/LuaSnip',
			requires = 'rafamadriz/friendly-snippets',
			after = 'nvim-cmp',
			config = function()
				require('plugins.luasnip')
			end,
		})
		use({
			'ZhiyuanLck/smart-pairs',
			event = 'BufRead',
			config = function()
				require('pairs'):setup()
			end,
		})
		use({ 'ray-x/lsp_signature.nvim', module = 'lsp_signature' })
		use({ 'onsails/lspkind-nvim' })
		use({ 'github/copilot.vim', cmd = 'Copilot' })
		use({
			'zbirenbaum/copilot.lua',
			event = 'InsertEnter',
			config = function()
				vim.schedule(function()
					require('copilot').setup()
				end)
			end,
		})

		-- Telescope
		use({
			'nvim-telescope/telescope.nvim',
			event = 'BufEnter',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-lua/popup.nvim',
				'nvim-telescope/telescope-frecency.nvim',
				'nvim-telescope/telescope-symbols.nvim',
				'nvim-telescope/telescope-file-browser.nvim',
				'nvim-telescope/telescope-hop.nvim',
				'nvim-neorg/neorg-telescope',
				'natecraddock/workspaces.nvim',
			},
			config = function()
				require('plugins.telescope')
			end,
		})

		-- File explorer
		use({
			'nvim-neo-tree/neo-tree.nvim',
			requires = 'MunifTanjim/nui.nvim',
			cmd = 'Neotree',
			config = function()
				require('plugins.neotree')
			end,
		})

		-- Terminal
		use({
			'akinsho/toggleterm.nvim',
			event = 'BufWinEnter',
			config = function()
				require('toggleterm').setup({
					shade_terminals = true,
					open_mapping = [[<c-\>]],
				})
			end,
		})
		use({
			'yioneko/nvim-yati',
			event = 'BufRead',
			requires = 'nvim-treesitter/nvim-treesitter',
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
				require('neogen').setup({
					enabled = true,
					snippet_engine = 'luasnip',
				})
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
			keys = '<leader>gy',
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

		-- Statusline
		use({
			'nvim-lualine/lualine.nvim',
			event = 'BufEnter',
			config = function()
				require('plugins.lualine')
			end,
		})

		-- Tabline
		use({
			'akinsho/bufferline.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			event = 'ColorScheme',
			config = function()
				require('bufferline').setup({})
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
			event = 'ColorScheme',
			config = function()
				require('bqf').setup()
			end,
		})

		use({
			'ThePrimeagen/harpoon',
			event = 'BufRead',
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
		use({
			'lewis6991/spellsitter.nvim',
			config = function()
				require('spellsitter').setup()
			end,
		})

		-- Motions
		use({ 'ggandor/lightspeed.nvim', event = 'BufRead' })
		use({
			'abecodes/tabout.nvim',
			event = 'BufRead',
			config = function()
				require('tabout').setup({
					ignore_beginning = true,
				})
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
		use({ 'tpope/vim-repeat', event = 'BufRead' })

		-- Surround
		use({
			'ur4ltz/surround.nvim',
			event = 'BufRead',
			config = function()
				require('surround').setup({
					mappings_style = 'surround',
					load_autogroups = true,
				})
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
		--		require('todo-comments').setup()
		--	end,
		--})

		use({
			'haringsrob/nvim_context_vt',
			config = function()
				require('nvim_context_vt').setup({
					prefix = '-',
				})
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
		use({ 'mbbill/undotree', cmd = 'UndotreeToggle' })

		use({
			'mizlan/iswap.nvim',
			cmd = { 'ISwap', 'ISwapWith' },
			config = function()
				require('iswap').setup({
					keys = 'qwertyuiop',
					autoswap = true,
				})
			end,
		})

		-- Zen
		use({
			'folke/zen-mode.nvim',
			cmd = 'ZenMode',
			config = function()
				require('plugins.zen')
			end,
		})
		use({
			'folke/twilight.nvim',
			cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
			config = function()
				require('twilight').setup({})
			end,
		})

		-- Folding
		use({
			'anuvyklack/pretty-fold.nvim',
			config = function()
				require('plugins.fold')
			end,
		})
		use({
			'lewis6991/foldsigns.nvim',
			config = function()
				require('foldsigns').setup({
					exclude = { 'GitSigns.*' },
				})
			end,
		})
		use({
			'natecraddock/workspaces.nvim',
			config = function()
				require('workspaces').setup()
			end,
		})
		--use({ 'pierreglaser/folding-nvim' })

		use({
			'zegervdv/nrpattern.nvim',
			config = function()
				require('plugins.nrpattern')
			end,
		})

		-- Lastplace
		use({
			'ethanholz/nvim-lastplace',
			event = 'BufRead',
			config = function()
				require('nvim-lastplace').setup({
					lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
					lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn' },
				})
			end,
		})

		-- Note taking
		use({
			'nvim-neorg/neorg',
			require = 'nvim-lua/plenary.nvim',
			config = function()
				require('plugins.neorg')
			end,
		})
		use({
			'mickael-menu/zk-nvim',
			config = function()
				require('plugins.zk')
			end,
		})

		-- Pastebin
		use({ 'rktjmp/paperplanes.nvim' })

		use({
			'NarutoXY/dim.lua',
			config = function()
				require('dim').setup()
			end,
		})
		--use({
		--	'm-demare/hlargs.nvim',
		--	requires = 'nvim-treesitter/nvim-treesitter',
		--	config = function()
		--		require('hlargs').setup()
		--	end,
		--})

		-- Indentlines
		use({
			'lukas-reineke/indent-blankline.nvim',
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
			'lewis6991/hover.nvim',
			event = 'BufRead',
			config = function()
				require('plugins.hover')
			end,
		})

		use({
			'mvllow/modes.nvim',
			config = function()
				require('modes').setup({
					set_cursor = true,
					focus_only = true,
				})
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

		use({
			'hoschi/yode-nvim',
			requires = 'nvim-lua/plenary.nvim',
			cmd = {
				'YodeBufferDelete',
				'YodeCloneCurrentIntoFloat',
				'YodeCreateSeditorFloating',
				'YodeCreateSeditorReplace',
				'YodeFloatToMainWindow',
				'YodeFloatToMainWindow',
				'YodeGoToAlternateBuffer',
				'YodeLayoutShiftWinBottom',
				'YodeLayoutShiftWinDown',
				'YodeLayoutShiftWinTop',
				'YodeLayoutShiftWinUp',
				'YodeRunInFile',
			},
			config = function()
				require('yode-nvim').setup({})
			end,
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
		use({ 'fedepujol/move.nvim', module = 'move' })

		-- Colorschemes
		use({
			'projekt0n/github-nvim-theme',
			as = 'colorscheme',
			event = 'VimEnter',
			config = function()
				require('github-theme').setup({
					theme_style = 'dark_default',
					sidebars = { 'qf', 'terminal', 'toggleterm', 'packer' },
				})
			end,
		})
		use({
			'xiyaowong/nvim-transparent',
			config = function()
				require('transparent').setup({ enable = false })
			end,
		})
		use({ 'nlsickler/colorscheme-tweaks.nvim' })

		--use({
		--	'luukvbaal/stabilize.nvim',
		--	config = function()
		--		require('stabilize').setup()
		--	end,
		--})

		-- Math
		use({ 'jbyuki/nabla.nvim' })

		-- Misc
		use({ 'dhruvasagar/vim-table-mode', cmd = 'TableModeToggle' })
		--use({
		--	'lewis6991/spaceless.nvim',
		--	config = function()
		--		require('spaceless').setup()
		--	end,
		--})
		use({ 'nathom/filetype.nvim' })
		use({ 'zeertzjq/nvim-paste-fix' })
		use({
			'monkoose/matchparen.nvim',
			config = function()
				require('matchparen').setup()
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
		use({ 'milisims/nvim-luaref' })
		use({ 'nanotee/luv-vimdocs' })

		-- Language specific
		use({ 'tjdevries/nlua.nvim' })

		if _G.bootstrap then
			packer.sync()
		end
	end,
})
