local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(vim.fn.stdpath("data"))) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")
vim.api.nvim_command("packadd packer.nvim")

packer.init({
	--opt_default = true,
	git = {
		clone_timeout = 120,
	},
})

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("ext/lsp")
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
		"RishabhRD/nvim-lsputil",
		requires = "RishabhRD/popfix",
	})

	-- Completion
	use({
		"hrsh7th/nvim-compe",
		config = function()
			require("ext/completion")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("ext/autopairs")
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
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
	use ({ "mfussenegger/nvim-dap-python" })
	use({
		"rcarriga/nvim-dap-ui",
		requires = "mfussenegger/nvim-dap",
	})
	use({ "jbyuki/one-small-step-for-vimkind" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	use({
	    	"ThePrimeagen/refactoring.nvim",
		requires = {
			{"nvim-lua/plenary.nvim"},
			{"nvim-treesitter/nvim-treesitter"}
		}
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("ext/treesitter")
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "mfussenegger/nvim-ts-hint-textobject" })
	use({ "RRethy/nvim-treesitter-textsubjects" })
	use({ "nvim-treesitter/nvim-treesitter-refactor" })
	use({ "nvim-treesitter/playground" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "romgrk/nvim-treesitter-context" })
	-- use({
	-- 	"windwp/nvim-ts-autotag",
	-- 	requires = "nvim-treesitter/nvim-treesitter",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"lewis6991/spellsitter.nvim",
	-- 	config = function()
	-- 		require("ext/spellsitter")
	-- 	end,
	-- })

	-- Script running
	use({ "michaelb/sniprun" })
	use({ "jbyuki/dash.nvim" })


	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("ext/telescope")
		end,
	})
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({
		"nvim-telescope/telescope-frecency.nvim",
		requires = "nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	})
	use({ "sudormrfbin/cheatsheet.nvim" })

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
	use({
		"hoob3rt/lualine.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("ext/lualine")
		end,
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require('symbols-outline').setup()
		end
	})
	use({ "weilbith/nvim-lsp-smag" })
	use({
		"mbbill/undotree",
		config = function()
			require("ext/undotree")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ext/indentlines")
		end,
	})

	-- UI plugins
	use({
		"akinsho/nvim-bufferline.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("ext/bufferline")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("ext/colorizer")
		end
	})
	use({
		"kdav5758/TrueZen.nvim",
		config = function()
			require("ext/zen")
		end,
	})
	use({
  		"folke/twilight.nvim",
  		config = function()
    		require("ext/twilight")
  		end
	})
	use({ "bfredl/nvim-miniyank" })

		-- Quickfix
		use({ "kevinhwang91/nvim-bqf" })

	-- Folds
	use({
		"lewis6991/foldsigns.nvim",
		config = function()
			require("foldsigns").setup()
		end,
	})

	-- Search
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("ext/hlslens")
		end,
	})

	-- Git
	use({ "TimUntersberger/neogit" })
	use({
		"f-person/git-blame.nvim",
		config = function()
			require("ext/blame")
		end,
	})
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
	use({
		"tanvirtin/vgit.nvim",
		config = function()
			require("ext/vgit")
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

	-- Spelling 
	--use({
	--	"Pocco81/AbbrevMan.nvim",
	--	config = function ()
	--		require("ext/abbrev")
	--	end
	--})

	-- Key mappings
	use {
  		"folke/which-key.nvim",
  		config = function()
    		require("ext/whichkey")
  		end
	}

	-- Motions
	use({
		"ggandor/lightspeed.nvim",
		config = function() require("ext/lightspeed") end
	})
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use({
		"phaazon/hop.nvim",
		config = function()
			require'hop'.setup()
		end
	})
	use({ "monaqa/dial.nvim" })
	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require "surround".setup{}
		end
	})
	use({ "tpope/vim-repeat" })
	use({ "rhysd/clever-f.vim" })
	
	-- Notes and literate programming
	-- use({
	-- 	"Vhyrro/neorg",
	-- 	branch = "unstable",
	-- 	config = function()
	-- 		require("neorg").setup({})
	-- 	end,
	-- })
	

	-- Session/ project management
	use({ "ahmedkhalf/project.nvim" })
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("ext/dashboard")
		end,
	})
  	use ({
		"ethanholz/nvim-lastplace",
		config = function()
			require'nvim-lastplace'.setup{}
		end
	})
	use({ "xiyaowong/nvim-cursorword" })

	-- Misc 
	use({
		"andweeb/presence.nvim",
		config = function()
			require("ext/presence")
		end
	})
	use({ "jbyuki/instant.nvim" })
	use({ "henriquehbr/nvim-startup.lua" })
	use({ "pwntester/codeql.nvim" })

	-- Themes
	use({ "folke/tokyonight.nvim", opt = true })

	-- Help pages
	use({ "milisims/nvim-luaref" })

	-- Language specific plugins
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
