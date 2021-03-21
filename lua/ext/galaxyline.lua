local gl = require("galaxyline")
local colors = require("galaxyline.theme").default
local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = { "NvimTree", "vista", "dbui", "packager", "toggleterm" }

gls.left[1] = {
	RainbowRed = {
		provider = function()
			return "♥ "
		end,
		highlight = { colors.red, colors.bg },
	},
}
gls.left[2] = {
	ViMode = {
		provider = function()
			-- local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',V= 'VISUAL', [''] = 'VISUAL'}
			local alias = {
				["n"] = "NORMAL",
				["no"] = "N·OPERATOR PENDING",
				["v"] = "VISUAL ",
				["V"] = "V·LINE ",
				[""] = "V·BLOCK ",
				["s"] = "SELECT ",
				["S"] = "S·LINE ",
				[""] = "S·BLOCK ",
				["i"] = "insert ",
				["R"] = "replace ",
				["Rv"] = "v·replace ",
				["c"] = "COMMAND ",
				["cv"] = "vim ex ",
				["ce"] = "ex ",
				["r"] = "PROMPT ",
				["rm"] = "more ",
				["r?"] = "confirm ",
				["!"] = "SHELL ",
				["t"] = "TERMINAL ",
			}

			local mode_color = {
				n = colors.red,
				i = colors.green,
				v = colors.blue,
				V = colors.blue,
				[""] = colors.blue,
				c = colors.magenta,
				no = colors.red,
				s = colors.orange,
				S = colors.orange,
				[""] = colors.orange,
				ic = colors.yellow,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.red,
				ce = colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				["r?"] = colors.cyan,
				["!"] = colors.red,
				t = colors.red,
			}
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
			return "" .. alias[vim.fn.mode()]
		end,
		highlight = { colors.bg, colors.bg, "bold" },
		separator = " ",
	},
}
gls.left[3] = {
	FileIcon = {
		provider = "FileIcon",
		condition = condition.buffer_not_empty,
		highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
	},
}

gls.left[4] = {
	FileName = {
		provider = "FileName",
		condition = condition.buffer_not_empty,
		highlight = { colors.yellow, colors.bg, "bold" },
	},
}
gls.left[5] = {
	FileSize = {
		provider = "FileSize",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.bg },
	},
}

gls.left[6] = {
	GitIcon = {
		provider = function()
			return " "
		end,
		condition = condition.check_git_workspace,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.violet, colors.bg, "bold" },
	},
}

gls.left[7] = {
	GitBranch = {
		provider = "GitBranch",
		condition = condition.check_git_workspace,
		highlight = { colors.violet, colors.bg, "bold" },
	},
}

gls.left[8] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = condition.hide_in_width,
		icon = " +",
		highlight = { colors.green, colors.bg },
	},
}
gls.left[9] = {
	DiffModified = {
		provider = "DiffModified",
		condition = condition.hide_in_width,
		icon = " ~",
		highlight = { colors.orange, colors.bg },
	},
}
gls.left[10] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = condition.hide_in_width,
		icon = " -",
		highlight = { colors.red, colors.bg },
	},
}

gls.left[11] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "E",
		highlight = { colors.red, colors.bg },
	},
}
gls.left[12] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "W",
		highlight = { colors.yellow, colors.bg },
	},
}

gls.left[13] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "H",
		highlight = { colors.cyan, colors.bg },
	},
}

gls.left[14] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "I",
		highlight = { colors.blue, colors.bg },
	},
}

gls.right[1] = {
	FileEncode = {
		provider = "FileEncode",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.green, colors.bg, "bold" },
	},
}

gls.right[2] = {
	FileFormat = {
		provider = "FileFormat",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.green, colors.bg, "bold" },
	},
}

gls.right[3] = {
	LineInfo = {
		provider = "LineColumn",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.fg, colors.bg },
	},
}
gls.right[4] = {
	PerCent = {
		provider = "LinePercent",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.fg, colors.bg, "bold" },
	},
}
gls.right[5] = {
	ScrollBar = {
		provider = "ScrollBar",
		highlight = { colors.bg, colors.yellow },
	},
}

-- Shortened statuslines
gls.short_line_left[1] = {
	BufferType = {
		provider = "FileTypeName",
		separatr = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.blue, colors.bg, "bold" },
	},
}

gls.short_line_left[2] = {
	SFileName = {
		provider = "SFileName",
		separatr = " ",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.bg, "bold" },
	},
}

gls.short_line_right[1] = {
	BufferIcon = {
		provider = "BufferIcon",
		highlight = { colors.blue, colors.bg },
	},
}
