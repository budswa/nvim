vim.opt.termguicolors = true

local modules = {
	'garden.packer',
	'compiled',
	'garden.plugins',
	'garden.options',
	'garden.autocmds',
	'garden.keymaps',
	'garden.modules',
	'garden.globals'
}

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(('Error loading %s...\n\n%s'):format(mod, err))
	end
end
