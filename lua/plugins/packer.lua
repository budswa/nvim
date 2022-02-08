local present, packer = pcall(require, 'packer')

local M = {}

M.packer = packer
M.bootstrap = false

if not present then
	local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

	vim.fn.delete(packer_path, 'rf')
	print('Cloning packer...')
	vim.fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		'--depth',
		'1',
		packer_path,
	})

	vim.cmd([[packadd packer.nvim]])

	local now_present, now_packer = pcall(require, 'packer')

	if now_present then
		print('Packer cloned successfully.')
		M.bootstrap = true
		M.packer = now_packer
	else
		error("Couldn't clone packer!\nPacker path: " .. packer_path .. '\n' .. now_packer)
	end
end

M.packer = packer

return M
