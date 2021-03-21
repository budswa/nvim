-- Encoding
vim.o.encoding = "utf8"

-- Indentation and tabs
vim.bo.expandtab = false
vim.bo.shiftwidth = 2
vim.bo.smartindent = true
vim.bo.tabstop = 2
vim.o.smarttab = true
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
vim.wo.colorcolumn = "80"
vim.o.shortmess = "asTAI"
vim.o.termguicolors = true
vim.wo.signcolumn = "yes:1"

-- Wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "list:longest"

-- List
vim.wo.list = true
-- vim.o.listchars = "precedes:«,extends:»,tab:├─┤,nbsp:⍽,trail:$,eol:↲"
-- vim.o.listchars = "precedes:«,extends:»,tab:│ ,nbsp:⍽,trail:$,eol:↲"
-- vim.o.listchars = "precedes:«,extends:»,tab:┊ ,nbsp:⍽,trail:$,eol:↲"
vim.o.listchars = "precedes:«,extends:»,tab:▏ ,nbsp:⍽,trail:$,eol:↲"

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
vim.o.backup = false
vim.o.writebackup = false
vim.o.backupdir = "~/.config/nvim/.backup//"

-- Undo
vim.o.undofile = true
vim.o.undodir = "~/.config/nvim/.undo//"
vim.o.undolevels = 500
vim.o.undoreload = 500

-- Title
vim.o.title = true

--Search
vim.o.inccommand = 'nosplit'
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- Swapfiles
vim.o.swapfile = false
vim.bo.swapfile = false

-- Cursor
vim.wo.cursorline = true

-- Completion
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.pumheight = 10
vim.o.pumwidth = 16

-- Statusbar/ commandline
vim.o.showmode = false

-- Yanks
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank {timeout = 500}")

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
