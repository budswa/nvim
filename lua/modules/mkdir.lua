local M = {}

local fn = vim.fn

function M.mkdir()
	local dir = fn.expand('%:p:h')

	if fn.isdirectory(dir) == 0 then
		fn.mkdir(dir, 'p')
	end
end

function M.setup()
	vim.api.nvim_create_augroup('mkdir', {})
	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = '*',
		group = 'mkdir',
		callback = function()
			M.mkdir()
		end,
	})
end

return M
