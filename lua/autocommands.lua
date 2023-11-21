local augroup, autocmd = vim.api.nvim_create_augroup, vim.api.nvim_create_autocmd

augroup("user", {})

autocmd("BufWritePre", { command = "%s/\\s\\+$//e" })

autocmd("TextYankPost", {
    group = "user",
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 600 }) end,
})

autocmd("VimResized", {
    group = "user",
    command = "tabdo wincmd =",
})

autocmd("FocusGained", {
    group = "user",
    command = "checktime",
})

autocmd("BufWritePre", {
    pattern = { "/tmp/*", "*.tmp", "*.bak", "COMMIT_EDITMSD" },
    group = "user",
    callback = function() vim.opt_local.undofile = false end,
})

autocmd("FileType", {
    pattern = { "help", "qf", "lspinfo", "startuptime", "man" },
    group = "user",
    callback = function() vim.keymap.set("n", "q", "<cmd>close<cr>", { noremap = true, silent = true, buffer = true }) end,
})
