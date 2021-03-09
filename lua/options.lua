local g = vim.g

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Encoding
opt('o', 'encoding' , 'utf8')

-- Indentation and tabs
opt('b', 'expandtab', false)
opt('b', 'shiftwidth', 2)
opt('b', 'smartindent', true)
opt('b', 'tabstop', 2)
opt('o', 'smarttab', true)
opt('b', 'smartindent', true)
opt('b', 'softtabstop', 2)
opt('o', 'shiftround', true)

-- Clipboard
-- opt('o', 'clipboard', 'unamedplus')

-- Number column
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'numberwidth', 2)

-- Other interface options
opt('b', 'formatoptions', 'Mj')
opt('w', 'colorcolumn', '80')
opt('o', 'shortmess', 'asTAI')
opt('o', 'termguicolors', true)
opt('w', 'signcolumn', 'yes:1')

-- Wildmenu
opt('o', 'wildmenu', true)
opt('o', 'wildmode', 'list:longest')

-- List
opt('w', 'list', true)
opt('o', 'listchars', 'precedes:<,extends:>,eol:⏎')

-- Scrolloff
opt('o', 'scrolloff', 2)
opt('o', 'sidescrolloff', 2)

-- Wrap
opt('w', 'wrap', false)

-- Fold

-- Split
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)

-- Backup
opt('o', 'backup', true)
opt('o', 'writebackup', true)
-- g.backupdir = vim.fn.expand(vim.fn.stdpath("data") .. "./backupdir//")
-- opt('o', 'backupdir', '')

-- Undo
opt('o', 'undofile', true)
-- g.undodir = vim.fn.expand(vim.fn.stdpath("data") .. "./undodir//")
-- opt('o', 'undodir', '')
opt('o', 'undolevels', 500)
opt('o', 'undoreload', 500)

--Search

-- Swapfiles
opt('o', 'swapfile', false)
opt('b', 'swapfile', false)

-- Completion
opt('o', 'completeopt', 'menuone,noinsert,noselect')
opt('o', 'pumheight', 10)
opt('o', 'pumwidth', 16)

-- Yanks
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank {timeout = 500}')

-- Mouse
opt('o', 'mouse', 'a')

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

