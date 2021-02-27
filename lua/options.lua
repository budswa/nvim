local o = vim.o
local g = vim.g
local w = vim.w
local b = vim.b

-- Indentation and tabs
b.expandtab = false
b.shiftwidth = 2
b.smartindent = true
b.tabstop = 2
o.smarttab = true
o.softtabstop = 2
o.shiftround = true

-- Clipboard
o.clipboard = 'unnamedplus'

-- Number column
w.number = true
w.relativenumber = true
w.numberwidth = 3

-- Other interface options
b.formatoptions = 'Mj'
w.colorcolumn = '80'
o.shortmess = 'asTAI'
o.termguicolors = true
o.hidden = true

-- Signcolumn
w.signcolumn = 'yes:1'

-- Wildmenu
o.wildmenu = true
o.wildmode = 'list:longest'

-- List
w.list = true
o.listchars = 'precedes:<,extends:>,eol:⏎'

-- Scrolloff
o.scrolloff = 2
o.sidescrolloff = 2

-- Wrap
w.wrap = false

-- Fold

-- Split
o.splitbelow = true
o.splitright = true

-- Backup
o.backup = false
--o.writebackup = true
--o.backupdir = '.backupdir/'

-- Undo
o.undofile = true
o.undodir = '.undodir/'
o.undolevels = 250
o.undoreload = 500

--Search
o.incsearch = true
o.smartcase = true
o.ignorecase = true

-- Swapfiles
o.swapfile = false

-- Completion
o.completeopt = "menuone,noinsert,noselect"
o.pumheight = 10
o.pumwidth = 16

-- Providers
g.python_host_skip_check = 0
g.loaded_python_provider = 0
g.python3_host_skip_check = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Distrobuted plugins
-- 1 = disabled, 0 = enabled
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1

-- Yanks
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank {timeout = 500}')

-- Mouse
o.mouse = 'a'
