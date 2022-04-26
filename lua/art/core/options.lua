local g = vim.g
local o = vim.opt

o.syntax = 'on'

-- Indentation, spaces and tabs
o.expandtab = true
o.shiftwidth = 4
o.shiftwidth = 4
o.smartindent = true
o.smartindent = true
o.preserveindent = true
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
o.signcolumn = 'yes:1'
o.formatoptions:append('j')
o.formatoptions:remove('r')
o.formatoptions:remove('o')
o.formatoptions:remove('a')
o.shortmess = {
	t = true,
	A = true,
	o = true,
	O = true,
	T = true,
	f = true,
	F = true,
	s = true,
	c = true,
	W = true,
}

-- Autowrite
o.autowriteall = true

-- Grep
o.grepprg = 'rg --vimgrep'

-- List
o.list = true
o.listchars = {
	tab = '▏ ',
	trail = '·',
	nbsp = '⍽',
	extends = '>',
	precedes = '<',
}

-- Fillchars
o.fillchars = {
	eob = ' ',
}

o.spellfile = vim.fn.expand(vim.fn.stdpath('config') .. '/spell/en.utf-8.add')

-- Scrolloff
o.scrolloff = 1
o.sidescrolloff = 1

-- Fold
o.foldlevel = 120
o.foldnestmax = 4
o.foldminlines = 1
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

-- Split
o.splitbelow = true
o.splitright = true

-- Undo
o.undofile = true
local undodir = vim.fn.expand(vim.fn.stdpath('data') .. '/undo//')
o.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, 'p')
end

-- Title
o.title = true
o.titlelen = 64
o.titlestring = 'Neovim • %f %m'

--Search
o.inccommand = 'split'
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

-- Cursor
o.cursorline = true

-- popup menu
o.pumheight = 10
o.pumwidth = 16
o.pumblend = 0

-- Statusline and cmdline
o.showmode = false
o.laststatus = 3
g.modelines = 0

-- Mouse
o.mouse = 'a'
o.mousefocus = true

-- Notifications
o.belloff = 'all'

-- Shada
--o.shada = { '!', '"100', '\'100', '%', '/100', '<100' }
--o.shada = [[!, '100, <0, s100, h']]

-- Misc
o.virtualedit = 'onemore'
o.hidden = true

vim.cmd('packadd! cfilter')

--g.loaded_remote_plugins = 1
--
---- Providers
--g.loaded_python_provider = 0
--g.loaded_python3_provider = 0
--g.python_host_skip_check = 0
--g.python3_host_skip_check = 0
--g.loaded_node_provider = 0
--g.loaded_ruby_provider = 0
--g.loaded_perl_provider = 0
--
---- Disable builtins
--g.did_load_filetypes = 1
--g.loaded_2html_plugin = 1
--g.loaded_fzf = 1
--g.loaded_getscript = 1
--g.loaded_getscriptPlugin = 1
--g.loaded_gzip = 1
--g.loaded_logipat = 1
--g.loaded_matchit = 0
--g.loaded_matchparen = 1
--g.loaded_netrw = 1
--g.loaded_netrwFileHandlers = 1
--g.loaded_netrwPlugin = 1
--g.loaded_netrwSettings = 1
--g.loaded_rrhelper = 1
--g.loaded_spec = 1
--g.loaded_spellfile_plugin = 1
--g.loaded_sql_completion = 1
--g.loaded_syntax_completion = 1
--g.loaded_tar = 1
--g.loaded_tarPlugin = 1
--g.loaded_tutor = 1
--g.loaded_vimball = 1
--g.loaded_vimballPlugin = 1
--g.loaded_zip = 1
--g.loaded_zipPlugin = 1
g.vimsyn_embed = 1
