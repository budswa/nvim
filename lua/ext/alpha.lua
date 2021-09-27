local startify = require('alpha.themes.startify')

print(math.randomseed(os.time()))

--[[ local function footer()
	local total_plugins = #vim.tbl_keys(packer_plugins)
	local datetime = os.date("%d-%m-%Y  %H:%M:%S")
	return total_plugins .. " plugins  " .. datetime
end

startify.section.footer.val = footer() ]]

require"alpha".setup(startify.opts)
