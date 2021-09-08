-- Indentation, spaces and tabs
vim.opt.expandtab = false
vim.opt.expandtab = false
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
vim.opt.clipboard:prepend{"unnamedplus"}

-- Number column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Other interface options
vim.opt.updatetime = 200
-- vim.opt.shortmess = "asTAI"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"
vim.opt.formatoptions = vim.opt.formatoptions
	+ 'j' -- Delete comment character when joining commented lines
	- 'r' -- Disable new line comment leader on <Enter> in insert mode
	- 'o' -- Disable new line comment leader on 'o' or 'O' in normal mode
	- 'a' -- Disable autoformatting

-- Grep
vim.opt.grepprg = 'rg --vimgrep'

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = {'longest', 'list', 'full'}
vim.opt.wildoptions = 'pum'
--[[ vim.opt.wildignore = {
	'',
} ]]

-- List
vim.opt.list = true
-- vim.opt.listchars = { tab = '|', trail = '·', nbsp = '⍽', eol = "↴" }

-- Fillchars
vim.g.fillchars = { vert = '│', eob = ' ' }

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

-- Shada
vim.g.shada = { "!", "'1000", "<50", "s10", "h" }

-- Title
vim.opt.title = true
vim.opt.titlelen = 16
--vim.opt.titlestring = "NVIM: %F"

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
vim.opt.omnifunc = 'syntaxcomplete#Complete'

-- Statusbar/ commandline
vim.opt.showmode = false
vim.g.modelines = 0
vim.g.showmode = 0

-- Mouse
vim.opt.mouse = "a"

-- Notifications
vim.opt.belloff = 'all'

-- Providers
vim.g.loaded_python_provider   = 0
vim.g.loaded_python3_provider  = 0
vim.g.python_host_skip_check   = 1
vim.g.python3_host_skip_check  = 1
vim.g.loaded_node_provider     = 0
vim.g.loaded_ruby_provider     = 0
vim.g.loaded_perl_provider     = 0

-- Disable builtins
vim.g.loaded_tutor             = 1
vim.g.loaded_spec              = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_logipat           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_sql_completion    = 1
vim.g.loaded_syntax_completion = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.vimsyn_embed             = 1

vim.cmd 'packadd cfilter'
