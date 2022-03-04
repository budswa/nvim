local M = {}

function M.termcode(key)
	return vim.api.nvim_replace_termcodes(key, true, true, true)
end

return M
