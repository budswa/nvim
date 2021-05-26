local wk = require("which-key")

wk.setup{
	plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false
}

local mappings = {
	a = {
		name = '+action',
		s = {'<cmd>'},
	},
	f = {
		name = "+find",
		l = {
			name = '+LSP',
			d = {'<cmd>Telescope lsp_definitions<CR>', 'definitions'},
			r = {'<cmd>Telescope lsp_references<CR>', 'referencese'},
			a = {'<cmd>Telescope lsp_code_actions<CR>', 'code action'}
		},
		g = {
			name = "+git",
			s = {'<cmd>Telescope git_status<CR>', 'status'},
			f = {'<cmd>Telescope git_files<CR>', 'files'},
			c = {'<cmd>Telescope git_commits<CR>', 'commits'},
			C = {'<cmd>Telescope git_bcommits<CR>', 'buffer commits'},
			b = {'<cmd>Telescope git_branches<CR>', 'branches'},
		},
		f = {'<cmd>Telescope find_files<CR>', 'files'},
		w = {'<cmd>Telescope live_grep<CR>', 'grep'},
	},
	q = {
		name = "+quickfix",
		o = {'<cmd>copen<CR>', ''},
		c = {'<cmd>cclose<CR>'}
	},
	S = {
		name = '+session',
		s = {'<cmd>SessionSave<CR>', 'Save'},
		l = {'<cmd>SessionLoad<CR>', 'Load'},
	},
	g = {
		name = "+git",
		b = {'<cmd>GitBlameToggle<CR>', 'Toggle git blame'},
		y = {'<cmd>lua require"gitlinker".get_buf_range_url("n")<CR>', 'Gitlink'},
	},
	l = {
		name = "+LSP",
	},
	d = {
		name = "+debug",
		r = {'<cmd>lua require("dap").repl.toggle()<CR>', 'toggle repl'},
		b = {'<cmd>lua require("dap").toggle_breakpoint()<CR>', 'toggle breakpoint'},
		c = {'<cmd>lua require("dap").continue<CR>', 'continue/start'},
		i = {'cmd>lua require("dap").step_into<CR>', 'step into'},
		o = {'cmd>lua require("dap").step_over<CR>', 'step over'},
	},
	z = {
		name = "+zen",
		s = {'<cmd>lua require("s").toggle()<CR>', 'Toggle shade'},
		m = {'<cmd>TZMinimalist<CR>', 'Toggle Minimalist mode'},
		a = {'<cmd>TZAtaraxis<CR>', 'Toggle Ataraxis mode'},
		f = {'<cmd>TZFocus<CR>', 'Toggle Focus mode'}
	},
	U = {'<cmd>UndotreeToggle<CR>', 'Toggle Undotree'},
	E = {'<cmd>NvimTreeToggle<CR>', 'Toggle NvimTree'}
}

wk.register(mappings, opts)
