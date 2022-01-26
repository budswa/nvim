local autopairs = require('nvim-autopairs')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

autopairs.setup({
	disable_filetype = { 'TelescopePrompt' },
	check_ts = true,
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
