local g, o = vim.g, vim.opt

g.loaded_remote_plugins = 1

g.loaded_ada = 1
g.loaded_clojurecomplete = 1
g.loaded_context = 1
g.loaded_contextcomplete = 1
g.loaded_csscomplete = 1
g.loaded_decada = 1
g.loaded_freebasic = 1
g.loaded_gnat = 1
g.loaded_gzip = 1
g.loaded_haskellcomplete = 1
g.loaded_htmlcomplete = 1
g.loaded_javascriptcomplete = 1
g.loaded_man = 1
g.loaded_phpcomplete = 1
g.loaded_python3complete = 1
g.loaded_pythoncomplete = 1
g.loaded_RstFold = 1
g.loaded_rubycomplete = 1
g.loaded_shada = 1
g.loaded_spellfile = 1
g.loaded_sqlcomplete = 1
g.loaded_tar = 1
g.loaded_tohtml = 1
g.loaded_tutor = 1
g.loaded_vimexpect = 1
g.loaded_xmlcomplete = 1
g.loaded_xmlformat = 1
g.loaded_zip = 1
g.loaded_bugreport = 1
g.loaded_macmap = 1
g.loaded_spell = 1
g.loaded_rplugin = 1
g.loaded_matchit = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_zipPlugin = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_compiler = 1
g.loaded_matchparen = 1

g.loaded_python3_provider = 1
g.loaded_python_provider = 1
g.loaded_node_provider = 1
g.loaded_ruby_provider = 1
g.loaded_perl_provider = 1

g.vimsyn_embed = 1

--vim.cmd('packadd! cfilter')

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
g.matchtime = 100

-- Wrap
o.wrap = false

-- Clipboard
o.clipboard:prepend({ 'unnamedplus' })

-- Number column
o.number = true
o.relativenumber = true
o.numberwidth = 3

-- Sessions
o.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }

-- Other interface options
o.termguicolors = true
o.updatetime = 160
o.redrawtime = 300
o.colorcolumn = '120'
o.signcolumn = 'yes:1'
o.foldcolumn = '1'
o.confirm = true
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
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
    fold = '─',
    foldopen = "",
    foldclose = "",
}

o.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
o.spelloptions = "noplainbuffer"

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
o.undodir = vim.fn.stdpath('data') .. '/undo//'
if not vim.loop.fs_stat(o.undodir:get()[1]) then vim.loop.fs_mkdir(o.undodir:get()[1], 750) end

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
o.cmdheight = 1
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
