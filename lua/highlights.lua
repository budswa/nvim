vim.cmd(string.format('hi CursorLineNr guibg=#%06x', vim.api.nvim_get_hl_by_name('CursorLine', true).background))
