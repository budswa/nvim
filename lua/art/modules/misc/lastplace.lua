local M = {}

local line = vim.fn.line

function M.lastplace()
	if vim.tbl_contains(vim.api.nvim_list_bufs(), vim.api.nvim_get_current_buf()) then
		if not vim.tbl_contains({ 'qf', 'help', 'gitcommit', 'packer', 'toggleterm', 'neo-tree' }, vim.bo.ft) then
			if line([['"]]) > 1 and line([['"]]) <= line('$') then
				vim.cmd('normal! g`"')
			end
		end
	end
end

return M
