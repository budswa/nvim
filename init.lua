vim.loader.enable()

local path = vim.fn.stdpath("data") .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(path) then
    vim.fn.system {
        'git',
        'clone',
        'https://github.com/folke/lazy.nvim.git',
        path,
    }
end

vim.opt.rtp:prepend(path)


require("options")
require("filetypes")
require("autocommands")
require("keymaps")
require("lazy").setup(require("plugins"), {
    --defaults = { lazy = true },
    install = { colorscheme = { "kanagawa" } },
    performance = {
        cache = { ttl = 432000 },
        rtp = {
            disabled_plugins = {
                "python_provider",
                "node_provider",
                "ruby_provider",
                "perl_provider",
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "tar",
                "tarPlugin",
                "rrhelper",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "logiPat",
                "netrwSettings",
                "netrwFileHandlers",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
                "indent_on",
                "netrwPlugin",
                "tohtml",
                "man",
            },
        },
    },
})
