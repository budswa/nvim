local startify = require('alpha.themes.startify')

local footer = function()
	local plugin_count = #vim.tbl_keys(packer_plugins)
	return plugin_count .. ' plugins'
end

startify.section.footer.val = footer()

require('alpha').setup(startify.opts)
