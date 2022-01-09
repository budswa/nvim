vim.g.start_time = vim.fn.reltime()

vim.o.syntax = "off"

do
	local ok, impatient = pcall(require, "impatient")
	if ok then
		impatient.enable_profile()
	elseif not ok and not impatient then
		print("Impatient not yet installed")
	end
end

local ok, err = pcall(require, "garden")
if not ok then
	error(("Error loading core...\n\n%s"):format(err))
end
