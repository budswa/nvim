vim.cmd([[ syntax off | filetype off | filetype plugin indent off ]])

vim.g.start_time = vim.fn.reltime()
vim.g.rtp = vim.opt.runtimepath:get()
vim.opt.runtimepath = ''
vim.opt.shadafile = 'NONE'
vim.opt.loadplugins = false

vim.g.do_filetype_lua = 1

vim.g.loaded_python3_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_ruby_provider = 1
vim.g.loaded_perl_provider = 1

vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tutor = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_spellfile = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_man = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

local ok, impatient = pcall(require, 'impatient')
if ok then
    impatient.enable_profile()
end

vim.defer_fn(function()
    vim.opt.shadafile = ''
    vim.opt.runtimepath = vim.g.rtp

    vim.cmd([[
		runtime! plugin/**/*.lua
		runtime! plugin/**/*.vim
	]]  )

    require('art.core.options')
    require('art.utils')
    require('art.modules')
    local compiled_ok, _ = pcall(require, 'compiled')
    if compiled_ok then
        require('compiled')
    end
    require('art.core.keymaps')
    require('art.core.autocmds')
    require('art.core.commands')
    require('art.colors').set()

    vim.cmd([[
		rshada!
		doautocmd BufRead
		syntax on
		filetype on
		filetype plugin indent on
		PackerLoad nvim-treesitter
	]]  )

    vim.defer_fn(function()
        vim.cmd([[
            PackerLoad which-key.nvim
            PackerLoad lightspeed.nvim
            PackerLoad telescope.nvim
			silent! bufdo e
		]]     )
        require('art.core.options')
    end, 1)
end, 0)
