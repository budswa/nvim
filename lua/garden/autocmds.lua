local function create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end


local definitions = {
	packer = {
		{ 'BufWritePost', 'plugins.lua', 'PackerCompile' },
	},
	whitespace = {
		{ 'BufWritePre', '*', [[silent! lua remove_trailing_whitespace()]] },
	},
	window = {
		{ 'VimResized', '*', 'tabdo wincmd =' },
		{ 'FocusGained', '*', 'checktime' },
	},
	yank = {
		{ 'TextYankPost', [[* silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=500})]] },
	},
	cursorline = {
		{ 'WinEnter', '*', 'set cursorline' },
		{ 'WinLeave', '*', 'set nocursorline' }
	},
}
create_augroups(definitions)
