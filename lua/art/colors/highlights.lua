local M = {}

function M.highlight(group, properties)
	local args = {}

	if properties.fg then
		if vim.tbl_contains({ 'none', 'NONE', 'None' }, properties.fg) then
			args['fg'] = ''
		else
			args['fg'] = properties.fg
		end
	end
	if properties.bg then
		if vim.tbl_contains({ 'none', 'NONE', 'None' }, properties.bg) then
			args['bg'] = ''
		else
			args['bg'] = properties.bg
		end
	end
	if properties.attr then
		if type(properties.attr) == 'table' then
			for _, attribute in ipairs(properties.attr) do
				args[attribute] = true
			end
		else
			if not vim.tbl_contains({ 'none', 'NONE', 'None' }, properties.attr) then
				args[properties.attr] = true
			end
		end
	end
	if properties.sp then
		args['sp'] = properties.sp
	end

	vim.api.nvim_set_hl(0, group, args)
end

local hi = M.highlight

local colors = require('art.colors').get(require('art.colors').scheme)

local white = colors.white

hi('CursorLine', { bg = '#2c313a' })
hi('CursorLineNr', { fg = white })

return M
