local g, o = vim.g, vim.opt

for _, builtin in ipairs({
    "RstFold",
    "ada",
    "adacomplete",
    "bugreport",
    "ccomplete",
    "clojurecomplete",
    "compiler",
    "context",
    "contextcomplete",
    "csscomplete",
    "decada",
    "freebasic",
    "gnat",
    "gzip",
    "haskellcomplete",
    "htmlcomplete",
    "javascriptcomplete",
    "logiPat",
    "macmap",
    "man",
    "matchit",
    "matchparen",
    "netrw",
    "netrwFileHandlers",
    "netrwSettings",
    "netrw_gitignore",
    "phpcomplete",
    "provider",
    "python3complete",
    "pythoncomplete",
    "rplugin",
    "rrhelper",
    "rubycomplete",
    "rust",
    "rustfmt",
    "shada",
    --'spell',
    --'spellfile',
    "sqlcomplete",
    "syntaxcomplete",
    "tar",
    "tarPlugin",
    "tohtml",
    "tutor",
    "vimball",
    "vimballPlugin",
    "vimexpect",
    "xmlcomplete",
    "xmlformat",
    "zip",
    "zipPlugin",
}) do
    g["loaded_" .. builtin] = 1
end

for _, provider in ipairs({ "perl", "node", "ruby", "python", "python3" }) do
    g["loaded_" .. provider .. "_provider"] = 0
end

g.loaded_remote_plugins = 1
g.vimsyn_embed = 1

--vim.cmd('packadd! cfilter')
vim.g.ts_highlight_lua = true

o.path = "**"
o.timeoutlen = 500

-- Indentation, spaces and tabs
o.expandtab = true
o.smartindent = true
o.smarttab = true
o.preserveindent = true
o.cindent = true
o.tabstop = 4
o.shiftwidth = 4
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
o.clipboard:prepend({ "unnamedplus" })

-- Number column
o.number = true
o.relativenumber = true
o.numberwidth = 3

-- Sessions
o.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- Other interface options
o.termguicolors = true
o.updatetime = 160
o.redrawtime = 300
o.colorcolumn = "999"
o.signcolumn = "yes:1"
o.foldcolumn = "0"
o.confirm = true
o.formatoptions:append("j")
o.formatoptions:remove("r")
o.formatoptions:remove("o")
o.formatoptions:remove("a")
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
o.grepprg = "rg --vimgrep"

-- List
o.list = true
o.listchars = {
    tab = "▏ ",
    trail = "·",
    nbsp = "⍽",
    extends = ">",
    precedes = "<",
}

-- Fillchars
o.fillchars = {
    msgsep = "─",
    eob = " ",
    --horiz = '━',
    --horizup = '┻',
    --horizdown = '┳',
    --vert = '┃',
    --vertleft = '┫',
    --vertright = '┣',
    --verthoriz = '╋',
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = "│",
    diff = "─",
}

o.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
o.spelloptions = "noplainbuffer"

-- Scrolloff
o.scrolloff = 1
o.sidescrolloff = 1

-- Fold
o.foldlevel = 120
o.foldnestmax = 4
o.foldminlines = 1
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

-- Split
o.splitbelow = true
o.splitright = true

-- Undo
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo//"
if not vim.loop.fs_stat(o.undodir:get()[1]) then vim.loop.fs_mkdir(o.undodir:get()[1], 750) end

-- Title
o.title = true
o.titlelen = 64
o.titlestring = "Neovim: %f %m"

--Search
o.inccommand = "split"
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
o.mouse = "a"
o.mousefocus = true

-- Notifications
o.belloff = "all"

-- Shada
--o.shada = { '!', '"100', '\'100', '%', '/100', '<100' }
--o.shada = [[!, '100, <0, s100, h']]

-- Misc
o.virtualedit = "onemore"
o.hidden = true
