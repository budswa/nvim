local opt = vim.opt
local g = vim.g

-- Indentation, spaces and tabs
opt.expandtab = false
opt.shiftwidth = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.smartindent = true
opt.cindent = true
opt.tabstop = 4
opt.tabstop = 4
opt.smarttab = true
opt.softtabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.breakindent = true
opt.joinspaces = false

-- Paren
g.showmatch = true
g.matchtime = 10

-- Wrap
opt.wrap = false

-- Clipboard
opt.clipboard:prepend({ 'unnamedplus' })

-- Number column
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- Other interface options
opt.updatetime = 200
opt.redrawtime = 300
opt.termguicolors = true
-- opt.shortmess = opt.shortmess + { 'a', 'I' }
opt.termguicolors = true
opt.signcolumn = 'yes:1'
opt.formatoptions:append('j')
opt.formatoptions:remove('r')
opt.formatoptions:remove('o')
opt.formatoptions:remove('a')
-- Grep
opt.grepprg = 'rg --vimgrep'

-- Wildmenu
opt.wildmenu = true
-- opt.wildmode = opt.wildmode + { 'full', 'longest', 'list' }
opt.wildoptions = 'pum'
--[[ opt.wildignore = {
	'',
} ]]

-- List
opt.list = true
opt.listchars = {
	tab = '▏ ',
	trail = '·',
	nbsp = '⍽',
}

-- Fillchars
opt.fillchars = {
	fold = ' ',
	-- vert = '│',
	vert = ' ', -- blank character
	eob = ' ',
}

-- Scrolloff
opt.scrolloff = 0
opt.sidescrolloff = 0

-- Fold
opt.foldlevel = 120
opt.foldnestmax = 4
opt.foldminlines = 1
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldtext =
	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

-- Split
opt.splitbelow = true
opt.splitright = true

-- Backup
opt.backup = true
opt.writebackup = true
local backupdir = vim.fn.expand(vim.fn.stdpath('config') .. '/.backup//')
opt.backupdir = backupdir
if vim.fn.isdirectory(backupdir) == 0 then
	vim.fn.mkdir(backupdir)
end

-- Undo
opt.undofile = true
opt.undolevels = 500
opt.undoreload = 500
local undodir = vim.fn.expand(vim.fn.stdpath('config') .. '/.undo//')
opt.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, 'p')
end

-- Swapfiles
opt.swapfile = true
local swapdir = vim.fn.expand(vim.fn.stdpath('config') .. '/.swap//')
opt.directory = swapdir
if vim.fn.isdirectory(swapdir) == 0 then
	vim.fn.mkdir(swapdir, 'p')
end

-- Shada
g.shada = { '!', "'1000", '<50', 's10', 'h' }

-- Title
opt.title = true
opt.titlelen = 16
--opt.titlestring = "NVIM: %F"

--Search
opt.inccommand = 'split'
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Cursor
opt.cursorline = true

-- Completion
opt.completeopt = { 'menuone', 'preview' }
opt.pumheight = 10
opt.pumwidth = 16
opt.pumblend = 17
opt.omnifunc = 'syntaxcomplete#Complete'

-- Statusbar/ commandline
opt.showmode = false
g.modelines = 0
g.showmode = 0

-- Mouse
opt.mouse = 'a'

-- Notifications
opt.belloff = 'all'

opt.virtualedit = 'onemore'

-- Providers
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.python_host_skip_check = 1
g.python3_host_skip_check = 1
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Disable builtins
g.loaded_tutor = 1
g.loaded_spec = 1
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_logiPat = 1
g.loaded_matchparen = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_sql_completion = 1
g.loaded_syntax_completion = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.vimsyn_embed = 1

vim.cmd('packadd cfilter')
