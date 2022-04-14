local luasnip = require('luasnip')
local types = require('luasnip.util.types')

luasnip.config.setup({
    enable_autosnippets = true,
    history = true,
    updateevents = 'TextChanged, TextChangedI',
    region_check_events = 'CursorMoved',
    delete_check_events = 'TextChanged, InsertLeave',
    ext_opts = {
        [types.choiceNode] = {
            active = { virt_text = { { '●', 'GitSingsAdd' } } },
            passive = { virt_text = { { '●', 'GitSingsChange' } } },
        },
        [types.insertNode] = {
            active = { virt_text = { { '●', 'GitSingsAdd' } } },
            passive = { virt_text = { { '●', 'GitSingsChange' } } },
        },
    },
})

require('luasnip.loaders.from_vscode').load()
