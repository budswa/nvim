local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Downloading Packer')
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd('packadd packer.nvim')

require('packer').init({
	compile_path = vim.fn.stdpath('config') .. '/lua/compiled.lua',
	display = {
		title = 'Packer',
		prompt_border = 'single',
	},
	git = {
		clone_timeout = 300,
	},
	profile = {
		enable = true,
	},
})
