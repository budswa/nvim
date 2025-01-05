_G.art = _G.art or {
    colorscheme = "oxocarbon",
}

vim.loader.enable()

local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(path) then
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/folke/lazy.nvim.git",
        path,
    })
end

vim.opt.rtp:prepend(path)

require("health")
require("options")
require("filetypes")
require("autocommands")
require("keymaps")
require("lazy").setup(require("plugins"), {
    --defaults = { lazy = true },
})
