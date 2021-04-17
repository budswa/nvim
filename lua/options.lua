local utils = require("utils")

-- Autocommands
local definitions = {
	buffer = {
		{'BufWritePre', "*", [[silent! lua require('utils').remove_trailing_whitespace()]]},
		{'BufWritePost', "plugins.lua", "PackerCompile"}
	},
	window = {
		{"VimLeave", "*", [[wshada! | wviminfo!]]},
		{"VimResized", "*", [[tabdo wincmd =]]}, -- When resizing nvim window, equalize window dimensions
		{"FocusGained", "* checktime"} -- More eager version of autoread
	},
	ft = {
		{"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"}
	},
	yank = {
		{"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]}
	},
}
utils.create_augroups(definitions)

-- Encoding
vim.o.encoding = "utf-8"

-- Indentation and tabs
vim.o.expandtab = false
vim.g.expandtab = false
vim.bo.expandtab = false
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftround = true

-- Clipboard
-- vim.o.clipboard = "unamedplus"

-- Number column
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.numberwidth = 2

-- Other interface options
vim.bo.formatoptions = "Mj"
-- vim.wo.colorcolumn = "80"
vim.o.shortmess = "asTAI"
vim.o.termguicolors = true
vim.wo.signcolumn = "yes:1"

-- Wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"

-- List
--vim.wo.list = true
--vim.o.listchars = "nbsp:⍽,trail:$,precedes:<,extends:>"
-- vim.o.listchars = "tab:▏ ,space:·,nbsp:⍽,trail:$,precedes:<,extends:>,eol:↲"
--vim.o.listchars = "tab:▏ ,space:·,nbsp:⍽,trail:$,precedes:<,extends:>"

-- Fillchars
vim.o.fillchars = "vert:│,eob: "
-- vim.o.fillchars = "stlnc:─,vert:│,eob: "

-- Scrolloff
vim.o.scrolloff = 2
vim.o.sidescrolloff = 2

-- Wrap
vim.wo.wrap = false

-- Fold
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

-- Backup
vim.o.backup = true
vim.o.writebackup = true
vim.o.backupdir = vim.fn.expand(vim.fn.stdpath("config") .. "./backupdir//")
if vim.fn.isdirectory(vim.o.backupdir) == 0 then
	vim.fn.mkdir(vim.o.backupdir, "p")
end

-- Undo
vim.o.undofile = true
vim.o.undolevels = 500
vim.o.undoreload = 500
vim.o.undodir = vim.fn.expand(vim.fn.stdpath("config") .. "./undodir//")
if vim.fn.isdirectory(vim.o.undodir) == 0 then
	vim.fn.mkdir(vim.o.undodir, "p")
end

-- Swapfiles
vim.o.swapfile = true
vim.bo.swapfile = true
vim.o.directory = vim.fn.expand(vim.fn.stdpath("config") .. "./swap//")
if vim.fn.isdirectory(vim.o.directory) == 0 then
	vim.fn.mkdir(vim.o.directory, "p")
end

-- Title
vim.o.title = true
vim.o.titlelen = 16
vim.o.titlestring = "NVIM: %F"

--Search
vim.o.inccommand = "nosplit"
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Cursor
vim.wo.cursorline = true

-- Completion
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.pumheight = 10
vim.o.pumwidth = 16

-- Statusbar/ commandline
vim.o.showmode = false
vim.g.modelines = 0

-- Mouse
vim.o.mouse = "a"

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
