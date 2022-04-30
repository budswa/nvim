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

	local ok, packer_new = pcall(require, 'packer')

	if ok then
		print('Packer installed successfully...')
		_G.bootstrap = true
		packer = packer_new
	elseif not ok then
		error("Couldn't install packer!\nPacker path: " .. packer_path .. '\n' .. packer_new)
	end
end

local use = packer.use
local rocks = packer.use_rocks

packer.init({
	compile_path = vim.fn.stdpath('config') .. '/lua/compiled.lua',
	max_jobs = 4,
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
				require('art.modules.misc.treesitter')
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
				vim.cmd([[hi! link TreesitterContext Visual]])
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
			event = 'BufRead',
			requires = {
				'williamboman/nvim-lsp-installer',
				{ 'folke/lua-dev.nvim', module = 'lua-dev' },
			},
			config = function()
				require('art.modules.lsp')
			end,
		})
		use({
			'jose-elias-alvarez/null-ls.nvim',
			after = 'nvim-lspconfig',
			config = function()
				require('art.modules.lsp.null-ls')
			end,
		})
		use({ 'lukas-reineke/lsp-format.nvim' })
		use({ 'ii14/lsp-command', opt = true, after = 'nvim-lspconfig' })
		use({ 'p00f/clangd_extensions.nvim', module = 'clangd_extensions', ft = { 'cpp', 'c' } })
		use({
			'j-hui/fidget.nvim',
			event = 'BufEnter',
			config = function()
				require('fidget').setup({
					text = { spinner = 'bouncing_ball' },
					timer = { fidget_decay = 2000 },
				})
			end,
		})
		use({
			'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
			after = 'nvim-lspconfig',
			config = function()
				require('toggle_lsp_diagnostics').init()
			end,
		})
		use({
			'simrat39/symbols-outline.nvim',
			setup = function()
				vim.g.symbols_outline = {
					highlight_hovered_item = true,
					show_guides = true,
					auto_preview = true,
					position = 'right',
					keymaps = {
						close = 'q',
						goto_location = 'o',
						focus_location = '<Tab>',
						hover_symbol = 'K',
						rename_symbol = 'r',
						code_actions = 'a',
					},
					lsp_blacklist = {},
				}
			end,
			cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
		})

		-- Completion
		use({
			'hrsh7th/nvim-cmp',
			event = { 'InsertEnter', 'CmdLineEnter' },
			config = function()
				require('art.modules.completion.cmp')
			end,
			after = { 'LuaSnip', 'neogen', 'lspkind-nvim' },
		})
		use({ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
		use({ 'ray-x/cmp-treesitter', after = 'nvim-cmp' })
		use({ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' })
		use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })
		use({ 'petertriho/cmp-git', after = 'nvim-cmp' })
		use({ 'zbirenbaum/copilot-cmp', after = { 'copilot.lua', 'nvim-cmp' } })
		use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })
		use({ 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' })
		use({
			'L3MON4D3/LuaSnip',
			requires = { 'rafamadriz/friendly-snippets', after = 'LuaSnip', event = 'InsertEnter' },
			event = 'BufRead',
			config = function()
				require('art.modules.completion.luasnip')
			end,
		})
		use({
			'windwp/nvim-autopairs',
			after = 'nvim-cmp',
			config = function()
				require('art.modules.completion.autopairs')
			end,
		})
		use({ 'onsails/lspkind-nvim', module = 'lspkind' })
		use({
			'github/copilot.vim',
			cmd = 'Copilot',
			config = function()
				vim.g.copilot_no_tab_map = false
				vim.g.copilot_assume_mapped = true
				vim.g.copilot_tab_fallback = ''
			end,
		})
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
			opt = true,
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-lua/popup.nvim',
				'nvim-telescope/telescope-symbols.nvim',
			},
			config = function()
				require('art.modules.search.telescope')
			end,
		})
		use({
			'nvim-telescope/telescope-frecency.nvim',
			after = 'telescope.nvim',
			config = function()
				require('telescope').load_extension('frecency')
			end,
		})
		use({
			'nvim-telescope/telescope-file-browser.nvim',
			after = 'telescope.nvim',
			config = function()
				require('telescope').load_extension('file_browser')
			end,
		})
		use({
			'nvim-telescope/telescope-hop.nvim',
			after = 'telescope.nvim',
			config = function()
				require('telescope').load_extension('hop')
			end,
		})
		use({
			'benfowler/telescope-luasnip.nvim',
			after = 'telescope.nvim',
			config = function()
				require('telescope').load_extension('luasnip')
			end,
		})
		use({
			'natecraddock/workspaces.nvim',
			after = 'telescope.nvim',
			config = function()
				require('workspaces').setup()
				require('telescope').load_extension('workspaces')
			end,
		})

		-- File explorer
		use({
			'nvim-neo-tree/neo-tree.nvim',
			requires = 'MunifTanjim/nui.nvim',
			cmd = 'Neotree',
			config = function()
				require('art.modules.search.neotree')
			end,
		})

		-- Terminal
		use({
			'akinsho/toggleterm.nvim',
			event = 'BufWinEnter',
			config = function()
				require('art.modules.ui.terminal')
			end,
		})
		use({
			'yioneko/nvim-yati',
			event = 'BufRead',
			requires = 'nvim-treesitter/nvim-treesitter',
		})

		-- Code Actions
		use({ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' })

		-- Dynmaic help
		use({ 'max397574/dyn_help.nvim' })

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
		use({ 'gpanders/editorconfig.nvim' })

		-- Git & VCS
		use({
			'ipod825/igit.nvim',
			event = 'BufRead',
			requires = { 'nvim-lua/plenary.nvim', 'ipod825/libp.nvim' },
			config = function()
				require('igit').setup()
			end,
		})
		use({
			'lewis6991/gitsigns.nvim',
			event = 'BufRead',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('art.modules.ui.gitsigns')
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
				require('art.modules.debug')
			end,
		})
		use({ 'Pocco81/DAPInstall.nvim', event = 'BufReadPre' })
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
			requires = 'kyazdani42/nvim-web-devicons',
			cmd = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
			config = function()
				require('art.modules.ui.trouble')
			end,
		})

		-- Statusline
		use({
			'rebelot/heirline.nvim',
			event = 'BufEnter',
			config = function()
				require('art.modules.ui.heirline')
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
			opt = true,
			config = function()
				require('art.modules.keys.whichkey')
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
		use({ 'ggandor/lightspeed.nvim', opt = true })
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
				require('art.modules.keys.comment')
			end,
		})
		use({ 'LudoPinelli/comment-box.nvim' })

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
			'Pocco81/TrueZen.nvim',
			event = 'BufRead',
			config = function()
				require('true-zen').setup({})
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
				require('art.modules.ui.fold')
			end,
		})
		use({
			'lewis6991/foldsigns.nvim',
			event = 'BufRead',
			config = function()
				require('foldsigns').setup({
					exclude = { 'GitSigns.*' },
				})
			end,
		})

		use({
			'zegervdv/nrpattern.nvim',
			config = function()
				require('art.modules.keys.nrpattern')
			end,
		})

		-- Lastplace
		--use({
		--	'ethanholz/nvim-lastplace',
		--	event = 'BufRead',
		--	config = function()
		--		require('nvim-lastplace').setup({
		--			lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
		--			lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'packer', 'toggleterm', 'neo-tree' },
		--		})
		--	end,
		--})

		-- Note taking
		use({
			'nvim-neorg/neorg',
			requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope' },
			config = function()
				require('art.modules.misc.neorg')
			end,
		})

		-- Pastebin
		use({ 'rktjmp/paperplanes.nvim' })

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
				require('art.modules.ui.indentline')
			end,
		})

		-- UI replacements
		use({
			'stevearc/dressing.nvim',
			opt = true,
			event = 'BufWinEnter',
			config = function()
				require('art.modules.ui.dressing')
			end,
		})
		use({
			'rcarriga/nvim-notify',
			event = 'VimEnter',
			config = function()
				require('art.modules.ui.notify')
			end,
		})

		use({
			'lewis6991/hover.nvim',
			event = 'BufRead',
			config = function()
				require('art.modules.ui.hover')
			end,
		})

		use({
			'mvllow/modes.nvim',
			event = 'BufRead',
			config = function()
				require('modes').setup({})
			end,
		})

		use({
			'AckslD/nvim-neoclip.lua',
			config = function()
				require('neoclip').setup()
			end,
		})

		-- Markdown preview
		use({ 'frabjous/knap' })

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
			'ray-x/sad.nvim',
			requires = { 'ray-x/guihua.lua', after = 'sad.nvim', opt = true },
			opt = true,
			cmd = { 'Sad' },
			config = function()
				require('sad').setup({
					diff = 'diff-so-fancy',
					exact = false,
				})
			end,
		})

		-- Move
		use({ 'fedepujol/move.nvim', module = 'move' })

		-- Colorscheme
		use({
			'xiyaowong/nvim-transparent',
			config = function()
				require('transparent').setup({ enable = false })
			end,
		})
		use({ 'nlsickler/colorscheme-tweaks.nvim' })

		use({
			'luukvbaal/stabilize.nvim',
			event = 'BufRead',
			config = function()
				require('stabilize').setup()
			end,
		})

		-- Math
		use({ 'jbyuki/nabla.nvim' })

		-- Misc
		use({ 'dhruvasagar/vim-table-mode', cmd = 'TableModeToggle' })
		use({ 'nathom/filetype.nvim' })
		use({ 'zeertzjq/nvim-paste-fix' })
		--use({
		--	'monkoose/matchparen.nvim',
		--	config = function()
		--		require('matchparen').setup()
		--	end,
		--})
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
		--use({ 'tjdevries/nlua.nvim' })
		use({ 'bfredl/nvim-luadev' })

		if _G.bootstrap then
			packer.sync()
		end
	end,
})
