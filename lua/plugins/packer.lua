local present, _ = pcall(require, 'packer')

if present then
	vim.cmd([[packadd packer.nvim]])
elseif not present then
	local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

	print('Cloning packer...')
	vim.fn.delete(packer_path, 'rf')
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		'--depth',
		'1',
		packer_path,
	})

	vim.cmd([[packadd packer.nvim]])
	local now_present, packer = pcall(require, 'packer')

	if now_present then
		print('Packer cloned successfully.')
	else
		error("Couldn't clone packer!\nPacker path: " .. packer_path .. '\n' .. packer)
	end
end
