for opt, v in pairs({
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    shiftround = true,
    expandtab = true,
    -- smarttab = true,
    smartindent = true,
    cindent = true,

    termguicolors = true,
    laststatus = 3,
    cmdheight = 0,
}) do
    vim.opt[opt] = v
end
