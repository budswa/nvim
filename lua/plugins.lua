vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.vim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.vim_command 'packadd packer.nvim'
end

vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('ext.lsp')
    end
  }
	use {'RishabhRD/nvim-lsputils'}
  use {'glepnir/lspmeta.nvim'}
  use {'glepnir/lspsaga.nvim'}
  use {'onsails/lspkind-nvim'}
  use {'nvim-lua/lsp-status.nvim'}
	use {'tjdevries/lsp_extensions.nvim'}
	--[[ use {
		'kosayoda/nvim-lightbulb',
		config = function()
			require ('ext/lightbulb')
		end
	} ]]

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require ('ext/completion')
    end
  }

	-- Debugging & linting
	use {'mfussenegger/nvim-lint'}
	use {'mfussenegger/nvim-dap'}
	use {'theHamsta/nvim-dap-virtual-text'}

  -- Snippets
  use {
    'norcalli/snippets.nvim',
    config = function()
      require ('ext/snippets')
    end
  }
  use {'honza/vim-snippets'}

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require ('ext/treesitter')
    end
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects'}
  use {'nvim-treesitter/nvim-treesitter-refactor'}
  use {'nvim-treesitter/playground'}
  use {'p00f/nvim-ts-rainbow'}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
      require ('ext/telescope')
    end
  }
	use {
		'nvim-telescope/telescope-dap.nvim',
		config = function()
			require('telescope').load_extension('dap')
		end
	}
  use {
    'nvim-telescope/telescope-snippets.nvim',
    config = function()
      require ('telescope').load_extension('snippets')
    end
  }
  use {'nvim-telescope/telescope-symbols.nvim'}
  use {
    'nvim-telescope/telescope-github.nvim',
    config = function()
      require ('telescope').load_extension('gh')
    end
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end
  }
  use {'nvim-telescope/telescope-packer.nvim'}

  -- Filetree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require ('ext/nvimtree')
    end
  }

  -- Terminal
  use {
    'akinsho/nvim-toggleterm.lua',
    conig = function()
      require ('ext/toggleterm')
    end
  }
  use {
    'numToStr/FTerm.nvim',
    config = function()
      require ('ext/fterm')
    end
  }
	use {'oberblastmeister/termwrapper.nvim'}

  -- Statusline
  use {
    'glepnir/galaxyline.nvim',
    config = function()
      require ('ext/galaxyline')
    end
  }

  -- Tag viewer
  use {'liuchengxu/vista.vim'}

  -- Undotree
	use {
    'mbbill/undotree',
		cmd = 'UndotreeToggle',
    config = function()
			require('ext/undotree')
		end
	}

  -- UI
	use {'notomo/cmdbuf.nvim'}
  use {'kyazdani42/nvim-web-devicons'}
  use {
    'beauwilliams/focus.nvim',
		cmd = 'ToggleFocus',
    config = function()
      require ('ext/focus')
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = "lua",
    config = function()
      require ('ext/indentline')
    end
  }

  use {
    'akinsho/nvim-bufferline.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require ('ext/tabline')
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require ('ext/colorizer')
    end
  }

  use {
		'kevinhwang91/nvim-hlslens',
		config = function()
			require ('ext/hlslens')
		end
	}

  use {'yamatsum/nvim-cursorline'}

  -- Git
  use {'TimUntersberger/neogit'}
	use {'f-person/git-blame.nvim'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('ext/gitsigns')
    end
  }

  -- Commenting
  use 'b3nj5m1n/kommentary'

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Format
  use {
    'mhartington/formatter.nvim',
    config = function()
      require('ext/format')
    end
  }

  use {'windwp/nvim-autospace'}

  -- Motions
  use{
    "PHSix/faster.nvim",
    event = {"VimEnter *"},
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
		end
  }

	use {'justinmk/vim-sneak'}

  use {'blackCauldron7/surround.nvim'}

	use {'phaazon/hop.nvim'}

  use {'tjdevries/train.nvim'}

  use {'ThePrimeagen/vim-be-good'}

  use {'monaqa/dial.nvim'}

  use {'jbyuki/instant.nvim'}
  vim.g.instant_username = "m2"

  use {'zegervdv/nrpattern.nvim'}

	-- Misc

  use {'AndrewRadev/splitjoin.vim'}

  use {'andweeb/presence.nvim'}

  use {
		'oberblastmeister/neuron.nvim',
		config = function()
			require ('ext/neuron')
		end
	}

  use {'tpope/vim-repeat'}

	use {'delphinus/artify.nvim'}

	use {'rhysd/clever-f.vim'}

	use {'gelguy/wilder.nvim'}

	use {'lucc/nvimpager'}

  use {'tjdevries/nsync.nvim'}

	use {
		'glepnir/dashboard-nvim',
		config = function()
			require ('ext/dashboard')
		end
	}

  use {'vigoux/architext.nvim'}

  use {'oberblastmeister/rooter.nvim'}

  use {
		'dstein64/vim-startuptime',
	  cmd = 'StartupTime',
	}

  use {'jbyuki/ntangle.nvim'}

  use {'tami5/sql.nvim'}

  use {'delphinus/characterize.nvim'}

	use {'liuchengxu/vim-which-key'}

  -- Colorscheme
  use {'budswa/cleareye-nvim', as = 'cleareye'}

  -- Language support plugins
  -- Generic
	use {'sheerun/vim-polyglot'}
	-- Lua
  use {'tjdevries/nlua.nvim', ft='lua'}
  use {'tjdevries/tree-sitter-lua', ft='lua'}
  use {'euclidianAce/BetterLua.vim', ft='lua'}
	use {'bfredl/nvim-luadev', ft='lua'}
	use {'rafcamlet/nvim-luapad', ft='lua'}
	use {'tjdevries/manillua.nvim', ft='lua'}
  -- Godot
  use {'habamax/vim-godot'}

end)
