local colors = {}

function colors._highlight(group, properties, ns)
	local args = {}

	if properties.link then
		vim.cmd("highlight! link " .. group .. " " .. properties.link)
        return
	end
	if properties.fg then
		if vim.tbl_contains({ "none", "NONE", "None" }, properties.fg) then
			args["fg"] = ""
		else
			args["fg"] = properties.fg
		end
	end
	if properties.bg then
		if vim.tbl_contains({ "none", "NONE", "None" }, properties.bg) then
			args["bg"] = ""
		else
			args["bg"] = properties.bg
		end
	end
	if properties.style then
		if type(properties.style) == "table" then
			for _, attribute in ipairs(properties.style) do
				args[attribute] = true
			end
		else
			if not vim.tbl_contains({ "none", "NONE", "None" }, properties.style) then
				args[properties.style] = true
			end
		end
	end
	if properties.sp then
		args["sp"] = properties.sp
	end

	vim.api.nvim_set_hl(ns, group, args)
end

function colors.highlight(groups, ns)
	ns = ns or 0
	for group, properties in pairs(groups) do
		colors._highlight(group, properties, ns)
	end
end

function colors.reload(scheme)
	scheme = scheme or art.config.colorscheme

	if not pcall(require, "art.colors.themes." .. scheme) then
		error("No such theme " .. scheme)
		return false
	end

	for _, m in ipairs({ "art.colors", "art.colors.highlights", "art.colors.themes." .. scheme }) do
		package.loaded[m] = nil
	end

	art.colors = {}
	vim.cmd.highlight("clear")
	colors.set(scheme)
end

function colors.set(highlights, scheme)
	highlights = highlights or "all"
	scheme = scheme or art.config.colorscheme
	if vim.loop.fs_stat(vim.fn.stdpath("config") .. "/lua/art/colors/themes/" .. scheme .. ".lua") then
		for name, color in pairs(require("art.colors.themes." .. scheme)) do
			art.colors[name] = color
		end

		colors.highlight(require("art.colors.highlights")[highlights])
		vim.api.nvim_exec_autocmds("ColorScheme", {})

        callback = function()
		    vim.schedule(function()
		        require("art.colors.external.kitty").set()
		    end)
        end
	else
		vim.cmd.colorscheme(scheme)
	end
end

function colors.get(scheme)
	scheme = scheme or art.config.colorscheme
	return require("art.colors.themes." .. scheme)
end

return colors
