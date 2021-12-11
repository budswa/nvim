local o = vim.opt
local g = vim.g

-- Indentation, spaces and tabs
o.expandtab = false
o.shiftwidth = 4
o.shiftwidth = 4
o.smartindent = true
o.smartindent = true
o.cindent = true
o.tabstop = 4
o.tabstop = 4
o.smarttab = true
o.softtabstop = 4
o.softtabstop = 4
o.shiftround = true
o.breakindent = true
o.joinspaces = false

-- Paren
o.showmatch = true
g.matchtime = 10

-- Wrap
o.wrap = false

-- Clipboard
o.clipboard:prepend({ 'unnamedplus' })

-- Number column
o.number = true
o.relativenumber = true
o.numberwidth = 3

-- Other interface options
o.colorcolumn = '9999'
o.updatetime = 200
o.redrawtime = 300
o.termguicolors = true
-- o.shortmess = o.shortmess + { 'a', 'I' }
--o.signcolumn = 'number'
o.signcolumn = 'no'
o.formatoptions:append('j')
o.formatoptions:remove('r')
o.formatoptions:remove('o')
o.formatoptions:remove('a')

-- Autowrite
o.autowriteall = true

-- Grep
o.grepprg = 'rg --vimgrep'

-- Wildmenu
o.wildmenu = true
-- o.wildmode = o.wildmode + { 'full', 'longest', 'list' }
o.wildoptions = 'pum'
--[[ o.wildignore = {
	'',
} ]]

-- List
o.list = true
o.listchars = {
	tab = '▏ ',
	trail = '·',
	nbsp = '⍽',
	extends = '»',
	precedes = '«',
}

-- Fillchars
o.fillchars = {
	--vert = '│',
	vert = ' ',
	eob = ' ',
	fold = '·',
	foldopen = '▼',
	foldclose = '▶',
}

-- Scrolloff
o.scrolloff = 2
o.sidescrolloff = 2

-- Fold
o.foldlevel = 120
o.foldnestmax = 4
o.foldminlines = 1
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Split
o.splitbelow = true
o.splitright = true

-- Backup
o.backup = false
o.writebackup = false
local backupdir = vim.fn.expand(vim.fn.stdpath('data') .. '/backup//')
o.backupdir = backupdir
if vim.fn.isdirectory(backupdir) == 0 then
	vim.fn.mkdir(backupdir)
end

-- Undo
o.undofile = true
o.undolevels = 500
o.undoreload = 500
local undodir = vim.fn.expand(vim.fn.stdpath('data') .. '/undo//')
o.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, 'p')
end

-- Shada
g.shada = { '!', "'1000", '<50', 's10', 'h' }

-- Title
o.title = true
o.titlelen = 16
--o.titlestring = "NVIM: %F"

--Search
o.inccommand = 'split'
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Cursor
o.cursorline = true

-- Completion
o.completeopt = { 'menuone', 'preview' }

-- popup menu
o.pumheight = 10
o.pumwidth = 16
o.pumblend = 20

-- Statusline and cmdline
o.showmode = true
o.laststatus = 0
g.modelines = 0

-- Mouse
o.mouse = 'a'

-- Notifications
o.belloff = 'all'

-- Shada
o.shada = { '!', "'100", '%', '/100', '<100' }

-- Misc
o.virtualedit = 'onemore'
o.hidden = true

-- Providers
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.python_host_skip_check = 0
g.python3_host_skip_check = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

vim.cmd('packadd! cfilter')

-- Disable builtins
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logiPat = 1
g.loaded_logipat = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_rrhelper = 1
g.loaded_spec = 1
g.loaded_spellfile_plugin = 1
g.loaded_sql_completion = 1
g.loaded_syntax_completion = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_tutor = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.vimsyn_embed = 1
