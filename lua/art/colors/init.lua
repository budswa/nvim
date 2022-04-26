local M = {}

M.scheme = 'cleareye'

function M.set(scheme)
	if scheme then
		require('art.colors.highlights').set(scheme)
	elseif not scheme then
		require('art.colors.highlights').set(M.scheme)
	end
end

function M.get(scheme)
	if scheme then
		return require('art.colors.themes.' .. scheme).colors
	elseif not scheme then
		return require('art.colors.themes.' .. M.scheme).colors
	end
end

return M
