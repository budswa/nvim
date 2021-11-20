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

function M.reload()
	for module, _ in pairs(package.loaded) do
		if module:match('garden') then
			package.loaded[module] = nil
			require(module)
		end
	end
end

return M
