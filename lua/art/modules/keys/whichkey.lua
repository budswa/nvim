require('which-key').setup({
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = 'Comments' },
    key_labels = {
        ['<space>'] = 'SPC',
        ['<cr>'] = 'RET',
        ['<tab>'] = 'TAB',
    },
    icons = {
        breadcrumb = '+',
        separator = '▏',
        group = '',
    },
    popup_mappings = {
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
    },
    window = {
        position = 'bottom',
        margin = { 0, 0, 0, 0 },
        padding = { 1, 1, 1, 1 },
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 24 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = 'left',
    },
    hidden = { '<silent>', '<cmd>', '<cr>', 'call', 'lua', '^:', '^ ' },
    show_help = true,
    triggers = 'auto',
    triggers_blacklist = {
        i = { 'j', 'k' },
        v = { 'j', 'k' },
    },
})

vim.api.nvim_create_augroup('whichkey', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'which_key',
    group = 'whichkey',
    callback = function()
        local hl = vim.api.nvim_get_hl_by_name('WhichKeyFloat', true).background
        local hl_prev = vim.api.nvim_get_hl_by_name('MsgArea', true).background
        vim.api.nvim_set_hl(0, 'MsgArea', { bg = hl })
        vim.o.laststatus = 0
        vim.api.nvim_create_autocmd('BufLeave', {
            pattern = '*',
            nested = true,
            once = true,
            group = 'whichkey',
            callback = function()
                vim.api.nvim_set_hl(0, 'MsgArea', { bg = hl_prev })
                vim.o.laststatus = 3
            end,
        })
    end,
})
