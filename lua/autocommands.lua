local au, aug = vim.api.nvim_create_autocmd, function(name)
    return vim.api.nvim_create_augroup("nvim_" .. name, {})
end

au("BufWritePre", { command = "%s/\\s\\+$//e" })

au("TextYankPost", {
    group = aug("highlight_yank"),
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 600 }) end,
})

au("VimResized", {
    group = aug("resize"),
    command = "tabdo wincmd =",
})

au({ "FocusGained", "TermClose", "TermLeave" }, {
    group = aug("checktime"),
    command = "checktime",
})

au("BufWritePre", {
    group = aug("no_undo"),
    pattern = { "/tmp/**", "*.tmp", "*.bak", "COMMIT_EDITMSD" },
    callback = function() vim.opt_local.undofile = false end,
})

au("FileType", {
    pattern = { "help", "qf", "lspinfo", "startuptime", "man", "checkhealth" },
    group = aug("close"),
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { noremap = true, silent = true, buffer = true })
    end,
})

au("FileType", {
    group = aug("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
    end,
})

au("FileType", {
    group = aug("indent"),
    pattern = { "html", "markdown" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

au("BufReadPost", {
    group = aug("last_loc"),
    callback = function(event)
        local buf = event.buf

        if vim.tbl_contains({ "gitcommit" }, vim.bo[buf].filetype) or vim.b[buf].last_loc then
            return
        end
        vim.b[buf].last_loc = true

        local mark = vim.api.nvim_buf_get_mark(buf, "\"")

        if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(buf)
        then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

au("BufWritePre", {
    group = aug("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        vim.fn.mkdir(vim.fn.fnamemodify(vim.loop.fs_realpath(event.match) or event.match, ":p:h"), "p")
    end,
})

au("UIEnter", {
    group = aug("spell_compile"),
    callback = function(event)
        vim.cmd("silent mkspell! ~/.config/" ..
        (vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim") .. "/spell/en.utf-8.add")
    end
})
