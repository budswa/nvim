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

_G.reload = function()
	for module, _ in pairs(package.loaded) do
		if module:match('garden') then
			package.loaded[module] = nil
			require(module)
		end
	end
end

_G.profile = function(command, times)
	times = times or 100
	local args = {}
	if type(cmd) == 'string' then
		args = { cmd }
		cmd = cmd
	end
	local start = vim.loop.hrtime()
	for _ = 1, times, 1 do
		local ok = pcall(command, unpack(args))
		if not ok then
			error('Command failed: ' .. tostring(ok) .. ' ' .. vim.inspect({ command = command, args = args }))
		end
	end
	print(((vim.loop.hrtime() - start) / 1000000 / times) .. 'ms')
end

return M
