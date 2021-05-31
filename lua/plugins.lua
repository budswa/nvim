local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.api.nvim_command("packadd packer.nvim")
end

vim.cmd([[packadd packer.nvim]])

local packer = require("packer")

return packer.startup(function()
	-- Packer can manage itslf as an optional plugin
	use({ "wbthomason/packer.nvim", opt = true })

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp")
		end,
	})
	use({ "folke/lua-dev.nvim" })
	use({ "kabouzeid/nvim-lspinstall" })
	use({ "glepnir/lspsaga.nvim" })
	use({ "onsails/lspkind-nvim" })
	use({ "nvim-lua/lsp-status.nvim" })
	use({ "ray-x/lsp_signature.nvim" })
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("ext/trouble")
		end
	})
	use({
		"RishabhRD/nvim-lsputils",
		requires = "RishabhRD/popfix",
	})

	-- Completion
	use({
		"hrsh7th/nvim-compe",
		config = function()
			require("ext/completion")
		end,
	})
	-- Snippets
	use({
		"hrsh7th/vim-vsnip",
		config = function()
			require("ext/snippets")
		end,
	})

	-- Debugging & linting
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("ext/lint")
		end,
	})
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("ext/dap")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap",
	})
	use({ "jbyuki/one-small-step-for-vimkind" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	-- Running
	use({ "michaelb/sniprun" })
	use({ "jbyuki/dash.nvim" })

	-- Search
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("ext/hlslens")
		end,
	})
	use({ "windwp/nvim-spectre" })

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
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
	})
	use({
		"romgrk/nvim-treesitter-context",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"theHamsta/crazy-node-movement",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("ext/spellsitter")
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

	-- Statusline
	use({
		"hoob3rt/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("ext/lualine")
		end,
	})

	-- Tags/ symbols
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require('symbols-outline').setup()
		end
	})
	use({ "weilbith/nvim-lsp-smag" })

	-- Undotree
	use({
		"mbbill/undotree",
		config = function()
			require("ext/undotree")
		end,
	})

	-- Indent guides
	use({
		"lukas-reineke/indent-blankline.nvim",
		branch = "lua",
		config = function()
			require("ext/indentlines")
		end,
	})

	-- Tab bar
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
	-- use({
	-- 	"sunjon/shade.nvim",
	-- 	config = function()
	-- 		require("ext/shade")
	-- 	end,
	-- })
	use({
		"kdav5758/TrueZen.nvim",
		config = function()
			require("ext/zen")
		end,
	})
	use({ "bfredl/nvim-miniyank" })
	--use({ "yamatsum/nvim-cursorline" })

	-- Spelling
	use({
		"Pocco81/AbbrevMan.nvim",
	config = function ()
		require("ext/isas")
	end
	})

	-- Folds
	use({
		"lewis6991/foldsigns.nvim",
		config = function()
			require("foldsigns").setup()
		end,
	})

	-- Git
	use({ "TimUntersberger/neogit" })
	use({
		"tanvirtin/vgit.nvim",
		config = function()
			require("ext/vgit")
		end
	})
	use({
		"f-person/git-blame.nvim",
		config = function()
			require("ext/blame")
		end,
	})
	-- use({ "mitubaEX/blame_open.nvim" })
	use({
		"ruifm/gitlinker.nvim",
		config = function()
			require("ext/gitlinker")
		end,
	})
	use({
		"ThePrimeagen/git-worktree.nvim",
		config = function()
			require("ext/worktree")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("ext/gitsigns")
		end,
	})
	use({
		"sindrets/diffview.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("ext/diffview")
		end
	})

	-- Commenting
	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("ext/kommentary")
		end,
	})
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("ext/todo")
  end
})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("ext/autopairs")
		end,
	})

	-- Whichkey
	use {
  "folke/which-key.nvim",
  config = function()
    require("ext/whichkey")
  end
}

	-- Surround
	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require "surround".setup{}
		end
	})

	-- Format
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("ext/format")
		end,
	})

	-- 'swap'
	use({ "mizlan/iswap.nvim" })

	-- Motions
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	-- use({
	-- 	"winston0410/range-highlight.nvim",
	-- 		config = function()
	-- 			require'range-highlight'.setup{}
	-- 		end
	-- })
	use({
		"PHSix/faster.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
		end,
	})
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require('neoscroll').setup()
		end
	})
	-- use({
	-- 	"AckslD/nvim-revJ.lua",
	-- 	requires = { "sgur/vim-textobj-parameter", "kana/vim-textobj-user" },
	-- 	config = function()
	-- 		require("revj").setup()
	-- 	end,
	-- })
	use({
		"micmine/jumpwire.nvim",
		config = function()
			require("ext/jumpwire") -- not configured yet
		end,
	})
	-- use({
	-- 	"phaazon/hop.nvim",
	-- 	config = function()
	-- 		require'hop'.setup()
	-- 	end
	-- })
	use({ "monaqa/dial.nvim" })
	use({ "zegervdv/nrpattern.nvim" })
	use({ "justinmk/vim-sneak" })
	use({ "tpope/vim-repeat" })
	use({ "rhysd/clever-f.vim" })
	use({ "vigoux/architext.nvim" })
	-- use({ "delphinus/characterize.nvim" })

	-- Notes and literate programming
	-- use({ "kristijanhusak/line-notes.nvim" })
	-- use({
	-- 	"Vhyrro/neorg",
	-- 	branch = "unstable",
	-- 	config = function()
	-- 		require("neorg").setup({})
	-- 	end,
	-- })
	use({ "jbyuki/ntangle-lsp.nvim" })
	use({ "jbyuki/ntangle.nvim" })
	use({ "jbyuki/ntangle-ts.nvim" })

	-- Collaberative editing
	use({ "jbyuki/instant.nvim" })

	-- Session management
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("ext/dashboard")
		end,
	})

	-- Fzy
	use({ "mfussenegger/nvim-fzy" })
	use({ "romgrk/fzy-lua-native" })

	-- Misc
  use ({
		"ethanholz/nvim-lastplace",
		config = function()
			require'nvim-lastplace'.setup{}
		end
	})
	use({
		"andweeb/presence.nvim",
		config = function()
			require("ext/presence")
		end
	})
	use({ "ahmedkhalf/lsp-rooter.nvim" })
	use({ "ThePrimeagen/vim-apm" })
	use({ "tjdevries/train.nvim" })
	-- use({ "ThePrimeagen/vim-be-good" })
	use({ "takac/vim-hardtime" })
	use({
		"code-biscuits/nvim-biscuits",
		config = function()
			require("ext/biscuits")
		end,
	})
	use({ "notomo/filetypext.nvim" })
	use({ "tjdevries/astronauta.nvim" })
	use({ "delphinus/artify.nvim" })
	use({ "lucc/nvimpager" })
	use({ "tjdevries/nsync.nvim" })
	use({ "dstein64/vim-startuptime" })
	use({ "tami5/sql.nvim" })
	use({ "pwntester/codeql.nvim" })
	use({ "notomo/nvimtool" })

	-- Theme
	use({ "folke/tokyonight.nvim", opt = true })

	-- -- Language specific plugins
	-- Lua
	use({ "tjdevries/nlua.nvim", ft = "lua" })
	use({ "euclidianAce/BetterLua.vim", ft = "lua" })
	use({ "bfredl/nvim-luadev", ft = "lua" })
	use({ "tjdevries/manillua.nvim", ft = "lua" })
	-- Rust
	use({
		"simrat39/rust-tools.nvim",
		ft = "rs",
		config = function()
			require("rust-tools").setup()
		end,
	})
	-- Godot
end)
