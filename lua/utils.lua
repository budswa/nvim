local M = {}

function M.nvim_create_augroups(definitions)
	for group, definition in pairs(definitions) do
		vim.api.nvim_command('augroup ' .. group)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

function M.termcode(key)
    return vim.api.nvim_replace_termcodes(key, true, true, true)
end

return M
