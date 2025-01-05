local o = vim.opt

o.number = true
o.relativenumber = true

o.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

o.listchars = {
    tab = "▎ ",
    space = " "
}

o.termguicolors = true
o.laststatus = 3
o.cmdheight = 0
o.list = true

-- Editing
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.shiftround = true
o.expandtab = true
o.smarttab = true
o.smartindent = true
o.cindent = true

o.splitbelow = true
o.splitright = true

o.wrap = false

o.clipboard = "unnamedplus"

o.foldlevel = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = "v:lua.vim.treesitter.foldtext()"
o.foldcolumn = "auto:1"

o.scrolloff = 4
o.smoothscroll = true

o.grepprg = "rg --vimgrep"
o.inccommand = "nosplit"

o.spelloptions = "noplainbuffer"

vim.g.markdown_recommended_style = 0
