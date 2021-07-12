local utils = require("utils")

-- Indentation, spaces and tabs
vim.opt.expandtab = false
vim.g.expandtab = false
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.tabstop = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.breakindent = true
vim.opt.joinspaces = false

-- Paren
vim.g.showmatch = true
vim.g.matchtime = 10

-- Wrap
vim.opt.wrap = false

-- Clipboard
-- vim.opt.clipboard = "unamedplus"

-- Number column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Other interface options
vim.opt.updatetime = 200
-- vim.opt.colorcolumn = ""
vim.opt.shortmess = "asTAI"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"
vim.opt.formatoptions = vim.opt.formatoptions
	- 'a'
	- 't'
	+ 'c'
	+ 'q'
	- 'o'
	+ 'r'
	+ 'n'
	+ 'j'
	- '2'

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = {'longest', 'list', 'full'}
vim.opt.wildoptions = 'pum'
vim.opt.wildignore = {
  '**/node_modules/**',
  '**/coverage/**',
  '**/.idea/**',
  '**/.git/**',
  '**/.nuxt/**',
	'*.o',
	'*~',
	'*.pyc',
	'*pycache*',
}

-- List
vim.opt.list = true
-- vim.opt.listchars = table.concat
-- vim.opt.listchars = { nbsp = "⍽", trail = "$",precedes = "<",extends = ">" }
-- vim.opt.listchars = "eol:↲"
--vim.opt.listchars = "tab:▏ ,space:·,nbsp:⍽,trail:$,precedes:<,extends:>"

-- Fillchars
vim.g.fillchars = "vert:│,eob: "

-- Scrolloff
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

-- Fold
vim.opt.foldlevel = 120
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Backup
vim.opt.backup = true
vim.opt.writebackup = true
local backupdir = vim.fn.expand(vim.fn.stdpath("config") .. "/.backup//")
vim.opt.backupdir = backupdir
if vim.fn.isdirectory(backupdir) == 0 then
	vim.fn.mkdir(backupdir)
end

-- Undo
vim.opt.undofile = true
vim.opt.undolevels = 500
vim.opt.undoreload = 500
local undodir = vim.fn.expand(vim.fn.stdpath("config") .. "/.undo//")
vim.opt.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Swapfiles
vim.opt.swapfile = true
local swapdir = vim.fn.expand(vim.fn.stdpath("config") .. "/.swap//")
vim.opt.directory = swapdir
if vim.fn.isdirectory(swapdir) == 0 then
	vim.fn.mkdir(swapdir, "p")
end

-- Sessions
if vim.fn.isdirectory(vim.fn.stdpath("config") .. "/.session/") == 0 then
	vim.fn.mkdir(vim.fn.stdpath("config") .. "./.session/", "p")
end

-- Shada
vim.g.shada = { "!", "'1000", "<50", "s10", "h" }

-- Title
vim.opt.title = true
vim.opt.titlelen = 16
-- vim.opt.titlestring = "NVIM: %F"

--Search
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Cursor
vim.opt.cursorline = true

-- Completion
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.pumheight = 10
vim.opt.pumwidth = 16
vim.opt.pumblend = 17

-- Statusbar/ commandline
vim.opt.showmode = false
vim.g.modelines = 0
vim.g.showmode = 0

-- Mouse
vim.opt.mouse = "a"

-- Notifications
vim.opt.belloff = 'all'

-- Providers
vim.g.python_host_skip_check = 0
vim.g.loaded_python_provider = 0
vim.g.python3_host_skip_check = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Distrobuted plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zip = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrwSettings = 0
vim.g.loaded_netrwFileHandlers = 0

-- Autocommands
local definitions = {
	buffer = {
		{ "BufWritePre", "*", [[silent! lua require('utils').remove_trailing_whitespace()]] },
		{ "BufWritePost", "plugins.lua", "PackerCompile" },
	},
	window = {
		{ "VimLeave", "*", [[wshada!]] },
		{ "VimResized", "*", [[tabdo wincmd =]] }, -- When resizing nvim window, equalize window dimensions
		{ "FocusGained", "*", [[checktime]] }, -- More eager version of autoread
	},
	ft = {
		-- { "FileType", "NvimTree", "setlocal winhighlights=Normal:Terminal" },
		{ "FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2" },
	},
	yank = {
		{ "TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]] },
	},
	cursorline = {
		{ "WinEnter", "*", "set cursorline"},
		{	"WinLeave", "*", "set nocursorline"}
	}
}
utils.create_augroups(definitions)

