require("persistence").setup({
	dir = vim.fn.expand(vim.fn.stdpath("config") .. "/.sessions/"), -- directory where session files are saved
})
