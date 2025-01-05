local M = {}

function M.map(mode, lhs, rhs, options)
    vim.keymap.set(
        mode,
        lhs,
        rhs,
        vim.tbl_deep_extend("force", { silent = true, noremap = true }, options or {})
    )
end

local map = M.map

vim.g.mapleader = " "

map("n", "<up>", "gk")
map("n", "<down>", "gj")
map("n", "k", "gk")
map("n", "j", "gj")

-- center current search result
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "J", "mzJ`z")

-- quick
map("x", "<", "<gv")
map("x", ">", ">gv")

map("v", "<c-p>", '"_dP')

-- reverse join
map("n", "gJ", "i<cr><esc>J")

-- clear search
map("n", "<esc>", "<cmd>noh<cr>")

map("t", "<esc>", "<c-\\><c-n>")

-- Smarter 0 behaviour
map(
    { "n", "x", "o" },
    "0",
    function() return vim.api.nvim_win_get_cursor(0)[2] == 0 and "^" or "0" end,
    { expr = true }
)

return M
