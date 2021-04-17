local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.api.nvim_command("packadd packer.nvim")
end

vim.cmd([[packadd packer.nvim]])

local packer = require("packer")

return packer.startup(function()
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp")
		end,
	})
	use({
		"RishabhRD/nvim-lsputils",
		requires = "RishabhRD/popfix",
	})
	use({ "glepnir/lspmeta.nvim" })
	use({ "alexaandru/nvim-lspupdate" })
	use({
		"glepnir/lspsaga.nvim",
	})
	use({ "onsails/lspkind-nvim" })
	use({ "nvim-lua/lsp-status.nvim" })
	use({ "tjdevries/lsp_extensions.nvim" })
	use({ "ray-x/lsp_signature.nvim" })
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("ext/lightbulb")
		end,
	})

	-- Completion
	use({
		"hrsh7th/nvim-compe",
		config = function()
			require("ext/completion")
		end,
	})

	-- Debugging & linting
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("ext/lint")
		end,
	})
	use({ "mfussenegger/nvim-dap" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	-- Snippets
	use({
		"hrsh7th/vim-vsnip",
		requires = { "hrsh7th/vim-vsnip-integ" },
		config = function()
			require("ext/snippets")
		end,
	})
	use({ "rafamadriz/friendly-snippets", opt = true })

	-- Registers
	use({ "tversteeg/registers.nvim" })

	-- Quickfix
	use({ "kevinhwang91/nvim-bqf" })
	use({ "alexanderjeurissen/qedit.nvim" })
	use({ "gennaro-tedesco/nvim-jqx" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("ext/treesitter")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"nvim-treesitter/nvim-treesitter-refactor",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"nvim-treesitter/playground",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"p00f/nvim-ts-rainbow",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
	})
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("ext/telescope")
		end,
	})
	use({
		"nvim-telescope/telescope-dap.nvim",
		requires = { { "mfussenegger/nvim-dap" }, { "nvim-telescope/telescope.nvim" } },
		config = function()
			require("telescope").load_extension("dap")
		end,
	})
	use({
		"nvim-telescope/telescope-symbols.nvim",
		requires = "nvim-telescope/telescope.nvim",
	})
	use({ "nvim-telescope/telescope-project.nvim" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	})
	use({
		"nvim-telescope/telescope-fzy-native.nvim",
		requires = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("fzy_native")
		end,
	})
	use({
		"gbrlsnchs/telescope-lsp-handlers.nvim",
		config = function()
			require("telescope").load_extension("lsp_handlers")
		end,
	})
	use({
		"nvim-telescope/telescope-arecibo.nvim",
		config = function()
			require("telescope").load_extension("arecibo")
		end,
	})

	-- Filetree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("ext/nvimtree")
		end,
	})

	-- Terminal
	use({
		"akinsho/nvim-toggleterm.lua",
		conig = function()
			require("ext/toggleterm")
		end,
	})
	use({ "oberblastmeister/termwrapper.nvim" })
	use({ "LoricAndre/OneTerm.nvim" })

	-- Statusline
	use({
		"glepnir/galaxyline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("ext/statusline")
		end,
	})

	-- Tag viewer
	use({ "liuchengxu/vista.vim" })

	-- Undotree
	use({
		"mbbill/undotree",
		config = function()
			require("ext/undotree")
		end,
	})

	-- UI
	use({ "notomo/cmdbuf.nvim" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		branch = "lua",
		config = function()
			require("ext/indentlines")
		end,
	})
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("ext/barbar")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("ext/colorizer")
		end,
	})

	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("ext/hlslens")
		end,
	})

	--use({ "yamatsum/nvim-cursorline" })

	-- Folds
	use({
		"lewis6991/foldsigns.nvim",
		config = function()
			require("foldsigns").setup()
		end,
	})

	-- Git
	use({ "TimUntersberger/neogit" })
	use({ "f-person/git-blame.nvim" })
	use({
		"ruifm/gitlinker.nvim",
		config = function()
			require("ext/gitlinker")
		end,
	})
	use({
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("git-worktree").setup({
				update_on_change = true,
				clearjumps_on_change = true,
			})
		end,
	})
	use({
		"pwntester/octo.nvim",
		requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("octo")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		event = { "BufRead", "BufNewFile" },
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("ext/gitsigns")
		end,
	})

	--

	-- Commenting
	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("ext/kommentary")
		end,
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Whichkey
	use({
		"AckslD/nvim-whichkey-setup.lua",
		requires = { "liuchengxu/vim-which-key" },
		config = function()
			require("ext/whichkey")
		end,
	})

	-- Format
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("ext/format")
		end,
	})

	-- Motions
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use({
		"PHSix/faster.nvim",
		event = { "VimEnter *" },
		config = function()
			vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
		end,
	})
	use({ "karb94/neoscroll.nvim" })
	use({
		"AckslD/nvim-revJ.lua",
		requires = { "sgur/vim-textobj-parameter", "kana/vim-textobj-user" },
	})

	-- Script running
	use({ "michaelb/sniprun" })

	use({ "jbyuki/dash.nvim" })

	use({ "justinmk/vim-sneak" })

	use({ "blackCauldron7/surround.nvim" })

	use({ "phaazon/hop.nvim" })

	use({ "jbyuki/monolithic.nvim" })

	use({ "tjdevries/train.nvim" })

	use({ "ThePrimeagen/vim-be-good" })

	use({ "monaqa/dial.nvim" })

	use({ "jbyuki/instant.nvim" })

	use({ "ThePrimeagen/vim-apm" })

	-- use({ "zegervdv/nrpattern.nvim" })

	-- Notes
	use({ "jbyuki/nabla.nvim" })
	use({ "oberblastmeister/neuron.nvim" })
	use({ "kristijanhusak/line-notes.nvim" })

	-- Session management
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("ext/dashboard")
		end,
	})
	use({
		"rmagatti/auto-session",
	})
	use({
		"rmagatti/session-lens",
		requires = "nvim-telescope/telescope.nvim",
	})

	-- Misc
	use({
		"code-biscuits/nvim-biscuits",
		config = function()
			require("ext/biscuits")
		end,
	})

	use({ "AndrewRadev/splitjoin.vim" })

	use({ "tjdevries/astronauta.nvim" })

	use({ "andweeb/presence.nvim" })

	use({ "tpope/vim-repeat" })

	use({ "delphinus/artify.nvim" })

	use({ "rhysd/clever-f.vim" })

	use({ "lucc/nvimpager" })

	use({ "tjdevries/nsync.nvim" })

	use({ "vigoux/architext.nvim" })

	use({ "mfussenegger/nvim-fzy" })

	use({ "romgrk/fzy-lua-native" })

	use({ "airblade/vim-rooter" })
	use({ "oberblastmeister/rooter.nvim" })
	use({
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	})

	use({ "jbyuki/ntangle-lsp.nvim" })
	use({ "jbyuki/ntangle.nvim" })
	use({ "jbyuki/ntangle-ts.nvim" })

	use({ "tami5/sql.nvim" })

	use({ "pwntester/codeql.nvim" })

	use({ "delphinus/characterize.nvim" })

	use({ "RRethy/nvim-sourcerer" })

	use({
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	})

	-- GAMES!
	use({ "alec-gibson/nvim-tetris" })

	-- Colorscheme
	use({
		"budswa/cleareye-nvim",
		config = function()
			require("cleareye")
		end,
	})

	-- Language support plugins
	-- Lua
	use({ "tjdevries/nlua.nvim", ft = "lua" })
	-- use({ "tjdevries/tree-sitter-lua", ft = "lua" })
	use({ "euclidianAce/BetterLua.vim", ft = "lua" })
	use({ "bfredl/nvim-luadev", ft = "lua" })
	use({ "rafcamlet/nvim-luapad", ft = "lua" })
	use({ "tjdevries/manillua.nvim", ft = "lua" })
	-- Godot
	use({
		"simrat39/rust-tools.nvim",
		ft = "rs",
		config = function()
			require("rust-tools").setup()
		end,
	})
	-- Rust
	use({ "habamax/vim-godot" })
	use({
		"Joakker/godot.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

end)
