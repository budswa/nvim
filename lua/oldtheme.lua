local c = {
	base0 = "#1B2229",
	base1 = "#1c1f24",
	base2 = "#202328",
	base3 = "#23272e",
	base4 = "#3f444a",
	base5 = "#5B6268",
	base6 = "#73797e",
	base7 = "#9ca0a4",
	base8 = "#b1b1b1",

	bg = "#282c34",
	bg_alt = "#504945",
	bg_popup = "#3E4556",
	bg_highlight = "#2E323C",
	bg_visual = "#b3deef",

	fg = "#bbc2cf",
	fg_alt = "#5B6268",

	red = "#e95678",
	dark_red = "#ff6c6b",
	magenta = "#d16d9e",
	orange = "#D98E48",
	yellow = "#f0c674",
	green = "#98c579",
	cyan = "#44bcc9",
	blue = "#61afef",
	violet = "#a9a1e1",
	purple = "#b877db",
	teal = "#1abc9c",
	grey = "#928374",
	brown = "#ebb498",
	black = "#000000",

	bracket = "#80A0C2",
	currsor_bg = "#4f5b66",
	none = "NONE",
}


function c.terminal_color()
	vim.g.terminal_color_0 = c.bg
	vim.g.terminal_color_1 = c.red
	vim.g.terminal_color_2 = c.green
	vim.g.terminal_color_3 = c.yellow
	vim.g.terminal_color_4 = c.blue
	vim.g.terminal_color_5 = c.violet
	vim.g.terminal_color_6 = c.cyan
	vim.g.terminal_color_7 = c.bg_alt
	vim.g.terminal_color_8 = c.brown
	vim.g.terminal_color_9 = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.yellow
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = c.violet
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.fg
end

function c.highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	vim.api.nvim_command(
		"highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
	)
end

function c.load_syntax()
	local syntax = {
		Normal = { fg = c.fg, bg = c.bg },
		Terminal = { fg = c.fg, bg = c.base2 },
		SignColumn = { fg = c.fg, bg = c.bg },
		FoldColumn = { fg = c.fg_alt, bg = c.bg },
		VertSplit = { fg = c.black, bg = c.bg },
		Folded = { fg = c.grey, bg = c.bg_highlight },
		EndOfBuffer = { fg = c.bg, bg = c.none },
		IncSearch = { fg = c.bg_alt, bg = c.orange, style = c.none },
		Search = { fg = c.bg, bg = c.green },
		ColorColumn = { fg = c.none, bg = c.bg_highlight },
		Conceal = { fg = c.grey, bg = c.none },
		Cursor = { fg = c.none, bg = c.none, style = "reverse" },
		vCursor = { fg = c.none, bg = c.none, style = "reverse" },
		iCursor = { fg = c.none, bg = c.none, style = "reverse" },
		lCursor = { fg = c.none, bg = c.none, style = "reverse" },
		CursorIM = { fg = c.none, bg = c.none, style = "reverse" },
		CursorColumn = { fg = c.none, bg = c.bg_highlight },
		CursorLine = { fg = c.none, bg = c.bg_highlight },
		LineNr = { fg = c.base4, bg = c.bg },
		CursorLineNr = { fg = c.fg, bg = c.bg_highlight },
		DiffAdd = { fg = c.black, bg = c.green },
		DiffChange = { fg = c.black, bg = c.yellow },
		DiffDelete = { fg = c.black, bg = c.red },
		DiffText = { fg = c.black, bg = c.fg },
		Directory = { fg = c.bg_alt, bg = c.none },
		ErrorMsg = { fg = c.dark_red, bg = c.none, style = "bold" },
		WarningMsg = { fg = c.yellow, bg = c.none, style = "bold" },
		ModeMsg = { fg = c.fg, bg = c.none, style = "bold" },
		MatchParen = { fg = c.red, bg = c.none },
		NonText = { fg = c.black },
		Whitespace = { fg = c.base4 },
		SpecialKey = { fg = c.bg_alt },
		Pmenu = { fg = c.fg, bg = c.bg_popup },
		PmenuSel = { fg = c.base0, bg = c.blue },
		PmenuSelBold = { fg = c.base0, g = c.blue },
		PmenuSbar = { fg = c.none, bg = c.blue },
		PmenuThumb = { fg = c.brown, bg = c.brown },
		WildMenu = { fg = c.fg, bg = c.green },
		Question = { fg = c.yellow },
		NormalFloat = { fg = c.base8, bg = c.bg_highlight },
		TabLineFill = { style = c.none },
		TabLineSel = { bg = c.none },
		StatusLine = { fg = c.bg_popup, bg = c.base2, style = c.none },
		StatusLineNC = { fg = c.bg_popup, bg = c.base2, style = c.none },
		SpellBad = { fg = c.red, bg = c.none, style = "undercurl" },
		SpellCap = { fg = c.blue, bg = c.none, style = "undercurl" },
		SpellLocal = { fg = c.cyan, bg = c.none, style = "undercurl" },
		SpellRare = { fg = c.violet, bg = c.none, style = "undercurl" },
		Visual = { fg = c.black, bg = c.bg_visual },
		VisualNOS = { fg = c.black, bg = c.bg_visual },
		QuickFixLine = { fg = c.violet, style = "bold" },
		Debug = { fg = c.orange },
		debugBreakpoint = { fg = c.bg, bg = c.red },

		Boolean = { fg = c.orange },
		Number = { fg = c.violet },
		Float = { fg = c.violet },
		PreProc = { fg = c.violet },
		PreCondit = { fg = c.violet },
		Include = { fg = c.purple },
		Define = { fg = c.violet },
		Conditional = { fg = c.violet },
		Repeat = { fg = c.violet },
		Keyword = { fg = c.green },
		Typedef = { fg = c.red },
		Exception = { fg = c.red },
		Statement = { fg = c.red },
		Error = { fg = c.red },
		StorageClass = { fg = c.orange },
		Tag = { fg = c.orange },
		Label = { fg = c.orange },
		Structure = { fg = c.orange },
		Operator = { fg = c.magenta },
		Title = { fg = c.orange, style = "bold" },
		Special = { fg = c.yellow },
		SpecialChar = { fg = c.yellow },
		Type = { fg = c.yellow },
		Function = { fg = c.yellow },
		String = { fg = c.brown },
		Character = { fg = c.green },
		Constant = { fg = c.cyan },
		Macro = { fg = c.cyan },
		Identifier = { fg = c.blue },

		Comment = { fg = c.base6, style = "italic" },
		SpecialComment = { fg = c.grey },
		Todo = { fg = c.violet },
		Delimiter = { fg = c.fg },
		Ignore = { fg = c.grey },
		Underlined = { fg = c.none, style = "underline" },
	}
	return syntax
end

function c.load_plugin_syntax()
	local plugin_syntax = {
		-- TSFunction = { fg = c.yellow },
		-- TSMethod = { fg = c.yellow },
		-- TSKeywordFunction = { fg = c.red },
		-- TSProperty = { fg = c.cyan },
		-- TSType = { fg = c.teal },
		-- TSVariable = {fg=c.blue},
		-- TSPunctBracket = { fg = c.bracket },

		-- TSError = {fg = red}, -- For syntax/parser errors.
		--   TSPunctDelimiter = {fg = fg1}, -- For delimiters ie: `.`
		--   TSPunctBracket = {fg = red}, -- For brackets and parens.
		--   TSPunctSpecial = {fg = fg1}, -- For special punctutation that does not fall in the catagories before.
		--   TSConstant = {fg = yellow}, -- For constants
		--   TSConstBuiltin = {fg = yellow}, -- For constant that are built in the language: `nil` in Lua.
		--   TSConstMacro = {fg = yellow}, -- For constants that are defined by macros: `NULL` in C.
		--   TSString = {fg = green}, -- For strings.
		--   TSStringRegex = {fg = green}, -- For regexes.
		--   TSStringEscape = {fg = cyan}, -- For escape characters within a string.
		--   TSCharacter = {fg = green}, -- For characters.
		--   TSNumber = {fg = yellow}, -- For integers.
		--   TSBoolean = {fg = yellow}, -- For booleans.
		--   TSFloat = {fg = yellow}, -- For floats.
		--   TSFunction = {fg = blue}, -- For function (calls and definitions).
		--   TSFuncBuiltin = {fg = blue}, -- For builtin functions: `table.insert` in Lua.
		--   TSFuncMacro = {fg = cyan}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		--   TSParameter = {fg = yellow, gui = italic_strings}, -- For parameters of a function.
		--   TSParameterReference = {fg = yellow}, -- For references to parameters of a function.
		--   TSMethod =   {fg = blue}, -- For method calls and definitions.
		--   TSField  = {fg = red}, -- For fields.
		--   TSProperty = {fg = red}, -- Same as `TSField`.
		--   TSConstructor = {fg = cyan}, -- For constructor calls and definitions: `{}` in Lua, and Java constructors.
		--   TSConditional = {fg = purple, gui = italic_strings}, -- For keywords related to conditionnals.
		--   TSRepeat = {fg = purple, gui = italic_strings}, -- For keywords related to loops.
		--   TSLabel = {fg = purple, gui = italic_strings}, -- For labels: `label:` in C and `:label:` in Lua.
		--   TSOperator = {fg = cyan}, -- For any operator: `+`, but also `->` and `*` in C.
		--   TSKeyword = {fg = purple, gui = bold_italic_strings}, -- For keywords that don't fall in previous categories.
		--   TSKeywordFunction = {fg = green}, -- For keywords used to define a fuction.
		--   TSException          {fg = green}, -- For exception related keywords.
		--   TSType               {fg = yellow}, -- For types.
		--   TSTypeBuiltin        {fg = red}, -- For builtin types (you guessed it, right ?).
		--   TSNamespace          {fg = purple}, -- For identifiers referring to modules and namespaces.
		--   TSInclude            {fg = purple, gui = italic_strings}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		--   TSAnnotation         {fg = red}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
		--   TSText               {fg = fg1}, -- For strings considered text in a markup language.
		--   TSStrong             {fg = yellow, gui = bold_strings}, -- For text to be represented with strong.
		--   TSEmphasis           {fg = yellow, gui = italic_strings}, -- For text to be represented with emphasis.
		--   TSUnderline          {fg = yellow, gui = underline_strings}, -- For text to be represented with an underline.
		--   TSTitle              {fg = yellow}, -- Text that is part of a title.
		--   TSLiteral            {fg = yellow}, -- Literal text.
		--   TSURI                {fg = blue}, -- Any URI like a link or email.
		--   TSVariable           {fg = fg1}, -- Any variable name that does not have another highlight.
		--   TSVariableBuiltin    {fg = yellow, gui = italic_strings}, -- Variable names that are defined by the languages, like `this` or `self`.
		--   TSComment            {fg = comment_gray},    -- For comment blocks.
		--   TSNone               {fg = yellow},    -- TODO: docs
		--   TSSymbol             {fg = red},    -- For identifiers referring to symbols or atoms.
		--   TSTag                {fg = red, gui = "NONE"},    -- Tags like html tag names.
		--   TSTagDelimiter       {fg = fg1},    -- Tag delimiter like `<` `>` `/`
		--   TSStrike             {fg = fg1},    -- For strikethrough text.

		vimCommentTitle = { fg = c.grey, style = "bold" },
		vimLet = { fg = c.orange },
		vimVar = { fg = c.cyan },
		vimFunction = { fg = c.magenta },
		vimIsCommand = { fg = c.fg },
		vimCommand = { fg = c.blue },
		vimNotFunc = { fg = c.violet, style = "bold" },
		vimUserFunc = { fg = c.yellow, style = "bold" },
		vimFuncName = { fg = c.yellow, style = "bold" },

    -- Vista
		VistaBracket = { fg = c.grey },
		VistaChildrenNr = { fg = c.orange },
		VistaKind = { fg = c.purpl },
		VistaScope = { fg = c.red },
		VistaScopeKind = { fg = c.blue },
		VistaTag = { fg = c.green, style = "bold" },
		VistaPrefix = { fg = c.grey },
		VistaColon = { fg = c.green },
		VistaIcon = { fg = c.yellow },
		VistaLineNr = { fg = c.fg },

		-- Cursorword
		CursorWord = { bg = c.bg_highlight },

		-- Dashboard
		DashboardShortCut = { fg = c.violet },
		DashboardHeader = { fg = c.orange },
		DashboardCenter = { fg = c.blue },
		DashboardFooter = { fg = c.grey },

		-- LSP
		LspDiagnosticsSignError = { fg = c.red },
		LspDiagnosticsSignWarning = { fg = c.yellow },
		LspDiagnosticsSignInformation = { fg = c.blue },
		LspDiagnosticsSignHint = { fg = c.cyan },

		LspDiagnosticsVirtualTextError = { fg = c.red },
		LspDiagnosticsVirtualTextWarning = { fg = c.yellow },
		LspDiagnosticsVirtualTextInformation = { fg = c.blue },
		LspDiagnosticsVirtualTextHint = { fg = c.cyan },

		LspDiagnosticsUnderlineError = { style = "undercurl", sp = c.red },
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = c.yellow },
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = c.blue },
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = c.cyan },

		-- NvimTree
		NvimTreeFolderName = { fg = c.bracket },
		NvimTreeRootFolder = { fg = c.red },
		NvimTreeSpecialFile = { fg = c.fg, bg = c.none, style = "NONE" },

		-- Telescope
		-- TelescopeSelection = { bg = c.blue },
		-- TelescopeSelectionCaret = {},
		-- TelescopeMultiSelection = {},
		-- TelescopeNormal = {},

		-- TelescopeBorder = {},
		-- TelescopePromptBorder = {},
		-- TelescopeResultsBorder = {},
		-- TelescopePreviewBorder = {},

		-- TelescopeMatching = {},
		-- TelescopePromptPrefix = {},

	  -- WhichKey
    -- WhichKey = {},
    -- WhichKeyGroup = {},
    -- WhichKeyDesc = {},
    -- WhichKeySeperator = {},
    -- WhichKeySeparator = {},
    -- WhichKeyFloat = {},
    -- WhichKeyValue = {},

		-- Gitsigns
		GitSignsAdd = { fg = c.green },
		GitSignsChange = { fg = c.orange },
		GitSignsDelete = { fg = c.red },

		-- hlslens
    -- HlSearchLensNear = {},
    -- HlSearchLens = {},
    -- HlSearchNear = {},
    HlSearchFloat = { fg = c.bg, bg = c.green},

		-- Hop
    -- HopNextKey = {},
    -- HopNextKey1 = {},
    -- HopNextKey2 = {},
    -- HopUnmatched = {},

		-- Biscuits
		BiscuitColor = { fg = c.base6, style = "italic" }
	}
	return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
	c.terminal_color()
	local syntax = c.load_plugin_syntax()
	for group, colors in pairs(syntax) do
		c.highlight(group, colors)
	end
	async_load_plugin:close()
end))

function c.get_cleareye_color()
	return c
end

function c.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end
	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "cleareye"
	local syntax = c.load_syntax()
	for group, colors in pairs(syntax) do
		c.highlight(group, colors)
	end
	async_load_plugin:send()
end

c.colorscheme()

return c
