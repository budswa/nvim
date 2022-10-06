local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = art.colors








local TablineBufnr = {
    provider = function(self)
        return tostring(self.bufnr) .. ". "
    end,
    hl = "Comment",
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local TablineFileName = {
    provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
    hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = true }
    end,
}

-- this looks exactly like the FileFlags component that we saw in
-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
-- also, we are adding a nice icon for terminal buffers.
local TablineFileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = "[+]",
        --hl = { fg = "green" },
    },
    {
        condition = function(self)
            return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
                or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
            if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
                return "  "
            else
                return ""
            end
        end,
        --hl = { fg = "orange" },
    },
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    --[[hl = function(self)
        if self.is_active then
            return "TabLineSel"
        -- why not?
        -- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
        --     return { fg = "gray" }
        else
            return "TabLine"
        end
    end,]]
    on_click = {
        callback = function(_, minwid, _, button)
            if (button == "m") then -- close on mouse middle click
                vim.api.nvim_buf_delete(minwid, {force = false})
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
    },
    TablineBufnr,
    FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
    TablineFileName,
    TablineFileFlags,
}

-- a nice "x" button to close the buffer
local TablineCloseButton = {
    condition = function(self)
        return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
    end,
    { provider = " " },
    {
        provider = "",
        hl = { fg = "gray" },
        on_click = {
            callback = function(_, minwid)
                vim.api.nvim_buf_delete(minwid, { force = false })
            end,
            minwid = function(self)
                return self.bufnr
            end,
            name = "heirline_tabline_close_buffer_callback",
        },
    },
}

-- The final touch!
local TablineBufferBlock = utils.surround({ "", "" }, function(self)
    if self.is_active then
        return utils.get_highlight("TabLineSel").bg
    else
        return utils.get_highlight("TabLine").bg
    end
end, { TablineFileNameBlock, TablineCloseButton })

-- and here we go
local BufferLine = utils.make_buflist(
    TablineBufferBlock,
    { provider = "", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
    { provider = "", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
    -- by the way, open a lot of buffers and try clicking them ;)
)









---- Components
local components = {
	space = { provider = " " },
	align = { provider = "%=" },

	-- vim mode
	mode = {
		static = {
			modes = {
				["n"] = { "N", colors.b12 },
				["no"] = { "N" },
				["nov"] = { "N" },
				["noV"] = { "N" },
				["no"] = { "N" },
				["niI"] = { "N" },
				["niR"] = { "N" },
				["niV"] = { "N" },
				["nt"] = { "N" },
				["ntT"] = { "N" },
				["v"] = { "V" },
				["V"] = { "V" },
				["vs"] = { "V" },
				["Vs"] = { "V" },
				[""] = { "V" },
				["s"] = { "V" },
				["s"] = { "S" },
				["S"] = { "S" },
				[""] = { "S" },
				["i"] = { "I" },
				["ic"] = { "I" },
				["ix"] = { "I" },
				["R"] = { "R" },
				["Rc"] = { "R" },
				["Rx"] = { "R" },
				["Rv"] = { "R" },
				["Rvc"] = { "R" },
				["Rvx"] = { "R" },
				["c"] = { "C" },
				["cv"] = { "E" },
				["r"] = { " " },
				["rm"] = { "M" },
				["r?"] = { "?" },
				["!"] = { "!" },
				["t"] = { "T" },
			},
		},
		init = function(self)
			self.mode = vim.api.nvim_get_mode().mode
		end,
		provider = function(self)
			return self.modes[self.mode][1]
		end,
		hl = function(self)
			return { fg = self.modes[self.mode][2] or colors.b09, bg = colors.b01, bold = true }
		end,
	},

	-- buffer - filename, modified status
	buffer = {
		{
			provider = function()
				return vim.fn.fnamemodify(vim.fn.expand('%'), ":~:.")
			end,
			hl = { fg = colors.b16 },
		},
		{
			provider = function()
				return vim.bo.modified and " [+]" or ""
			end,
			hl = { fg = colors.b12 },
		},
        {
		    provider = function()
			    if not vim.bo.modifiable and vim.bo.readonly then
			        return " [X] "
                end
                return ""
		    end,
			hl = { fg = colors.b12 },
	    },
	},

	-- cwd
	cwd = {
		provider = function()
			return vim.fn.getcwd()
		end,
		hl = function()
			return { fg = colors.b09, bold = true }
		end,
	},

	-- time - time and uptime
	time = {
		init = function(self)
			self.starttime = os.time()
		end,
		provider = function(self)
			local uptime = os.date("*t", os.difftime(os.time(), self.starttime))
			return string.format("%d:%d:%d", uptime.hour, uptime.min, uptime.sec)
		end,
	},

	-- ruler
    ruler = { provider = "%7(%l/%3L%):%2c  %P", hl = { fg = colors.b11, bg = colors.b01 } },

	-- lsp
	diagnostics = {
		condition = conditions.has_diagnostics,
		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		end,
		{
			provider = function(self)
				if self.errors > 0 then
					return "E: " .. self.errors
				end
			end,
			hl = "DiagnosticError",
		},
		{
			provider = function(self)
				if self.warnings > 0 then
					return "W: " .. self.warnings
				end
			end,
			hl = "DiagnosticWarn",
		},
		{
			provider = function(self)
				if self.info > 0 then
					return "I: " .. self.info
				end
			end,
			hl = "DiagnosticInfo",
		},
		{
			provider = function(self)
				if self.hints > 0 then
					return "H: " .. self.hints
				end
			end,
			hl = "DiagnosticHint",
		},
	},
	-- git
	git = {
		condition = conditions.is_git_repo,
		init = function(self)
			self.has_changes = false
			self.status = vim.b.gitsigns_status_dict
			if not self.status.added == 0 or not self.status.changed == 0 or not self.status.removed == 0 then
				self.has_changes = true
			end
		end,
		-- Branch
		{
			provider = function(self)
				return self.status.head .. ""
			end,
			hl = { bold = true },
		},
		{
			provider = function(self)
				local count = self.status.added
				if count and count > 0 then
					return "+" .. count .. " "
				end
			end,
			hl = { fg = colors.b11},
		},
		{
			provider = function(self)
				local count = self.status.changed
				if count and count > 0 then
					return "~" .. count .. " "
				end
			end,
			hl = { fg = colors.b09},
		},
		{
			provider = function(self)
				local count = self.status.removed
				if count and count > 0 then
					return "-" .. count .. " "
				end
			end,
			hl = { fg = colors.b14},
		},
	},
}

---- Statuslines
local statusline = {
	fallthrough = false,

	-- Default
	{
		hl = function()
			return { fg = colors.b06, bg = colors.b01 }
		end,
		components.space,
		components.mode,
		--components.space,
		--components.buffer,
		components.align,
		--components.lsp,
		--components.space,
		--components.git,
		--components.space,
		components.space,
	},

	-- Terminal
	{
		condition = function()
			return vim.bo.filetype == "toggleterm"
		end,
		hl = function()
			return { fg = colors.b06, bg = colors.b01 }
		end,
		components.space,
		components.mode,
		components.space,
		components.buffer,
	},
}

---- Winbar
local winbar = {
	{
		condition = function()
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "quickfix", "terminal" },
				filetype = { "toggleterm", "qf", "packer" },
			})
		end,
		init = function()
			vim.opt_local.winbar = nil
		end,
	},
    components.space,
	components.buffer,
    components.align,
    BufferLine,
    components.align,
	components.ruler,
    components.space
}

---- tabline
local tabline = {
	{
		components.space,
		components.cwd,
		components.space,
		components.git,
		components.align,
		--components.time
	},
}

heirline.setup(statusline, winbar, tabline)
