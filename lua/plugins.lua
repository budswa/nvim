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
  use {'alexaandru/nvim-lspupdate'}
  use {'glepnir/lspsaga.nvim'}

  -- Completion
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require ('ext/completion')
    end
  }
  -- Snippets
  use 'norcalli/snippets.nvim'
  use 'honza/vim-snippets'

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
  use {'nvim-telescope/telescope-frecency.nvim'}

  -- Filetree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require ('ext/nvimtree')
    end
  }

  -- Terminal
  use {'akinsho/nvim-toggleterm.lua'}

  -- UI
  use {'kyazdani42/nvim-web-devicons'}
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
      require ('colorizer').setup()
    end
  }

  use {'kevinhwang91/nvim-hlslens'}

  use {'yamatsum/nvim-cursorline'}

  -- Git
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
  use {'tjdevries/train.nvim'}

  use {'monaqa/dial.nvim'}

  -- Misc
  use {'mhinz/vim-startify'}

  use {'dstein64/vim-startuptime'}

  --

  -- Language specific plugins
  -- Lua
  use {'tjdevries/nlua.nvim'}
  use {'euclidianAce/BetterLua.vim'}

end)
