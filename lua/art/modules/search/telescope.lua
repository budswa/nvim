local telescope = require('telescope')
local themes = require('telescope.themes')
local actions = require('telescope.actions')

telescope.setup({
    defaults = themes.get_ivy({
        selection_caret = '> ',
        prompt_prefix = '/',
        results_title = false,
        color_devicons = true,
        preview = { hide_on_startup = true },
        layout_config = { height = 0.4 },
        mappings = {
            i = {
                ['<c-J>'] = actions.move_selection_next,
                ['<c-K>'] = actions.move_selection_previous,
                ['<tab>'] = actions.toggle_selection,
                ['<s-tab>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<c-down>'] = actions.cycle_history_next,
                ['<c-up>'] = actions.cycle_history_prev,
                ['<c-q>'] = r('telescope').extensions.hop.hop,
                ['<c-h>'] = 'which_key',
            },
        },
    }),
    extensions = {
        file_browser = {
            theme = 'ivy',
        },
    },
})

for _, v in ipairs({ 'hop', 'frecency', 'file_browser', 'luasnip', 'workspaces' }) do
    telescope.load_extension(v)
end

vim.api.nvim_create_augroup('telescope', {})
vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopeFindPre',
    group = 'telescope',
    callback = function()
        vim.o.laststatus = 0
        vim.o.ruler = false
        vim.api.nvim_create_autocmd('BufWinLeave', {
            pattern = '*',
            once = true,
            group = 'telescope',
            callback = function()
                vim.o.laststatus = 3
                vim.o.ruler = true
            end,
        })
    end,
})
