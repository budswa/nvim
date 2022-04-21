local M = {}

M.scheme = 'kanagawa'

M.highlight = require('colors.highlights').highlight

function M.get(scheme)
	if scheme then
		return require('colors.themes.' .. scheme).colors
	elseif not scheme then
		return require('colors.themes.' .. M.scheme).colors
	end
end

function M.set(scheme)
	if scheme then
		require('colors.highlights').set(scheme)
	elseif not scheme then
		require('colors.highlights').set(M.scheme)
	end
end

return M
