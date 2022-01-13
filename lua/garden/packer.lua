local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local bootstrap

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	bootstrap = vim.fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Cloning Packer.nvim')
end

vim.cmd('packadd packer.nvim')

return { bootstrap = bootstrap }
