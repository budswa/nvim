local cleareye = {
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

function cleareye.terminal_color()
	vim.g.terminal_color_0 = cleareye.bg
	vim.g.terminal_color_1 = cleareye.red
	vim.g.terminal_color_2 = cleareye.green
	vim.g.terminal_color_3 = cleareye.yellow
	vim.g.terminal_color_4 = cleareye.blue
	vim.g.terminal_color_5 = cleareye.violet
	vim.g.terminal_color_6 = cleareye.cyan
	vim.g.terminal_color_7 = cleareye.bg_alt
	vim.g.terminal_color_8 = cleareye.brown
	vim.g.terminal_color_9 = cleareye.red
	vim.g.terminal_color_10 = cleareye.green
	vim.g.terminal_color_11 = cleareye.yellow
	vim.g.terminal_color_12 = cleareye.blue
	vim.g.terminal_color_13 = cleareye.violet
	vim.g.terminal_color_14 = cleareye.cyan
	vim.g.terminal_color_15 = cleareye.fg
end

function cleareye.highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""
	vim.api.nvim_command(
		"highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
	)
end

function cleareye.load_syntax()
	local syntax = {
		Normal = { fg = cleareye.fg, bg = cleareye.bg },
		Terminal = { fg = cleareye.fg, bg = cleareye.base2 },
		SignColumn = { fg = cleareye.fg, bg = cleareye.bg },
		FoldColumn = { fg = cleareye.fg_alt, bg = cleareye.bg },
		VertSplit = { fg = cleareye.black, bg = cleareye.bg },
		Folded = { fg = cleareye.grey, bg = cleareye.bg_highlight },
		EndOfBuffer = { fg = cleareye.bg, bg = cleareye.none },
		IncSearch = { fg = cleareye.bg_alt, bg = cleareye.orange, style = cleareye.none },
		Search = { fg = cleareye.bg, bg = cleareye.green },
		ColorColumn = { fg = cleareye.none, bg = cleareye.bg_highlight },
		Conceal = { fg = cleareye.grey, bg = cleareye.none },
		Cursor = { fg = cleareye.none, bg = cleareye.none, style = "reverse" },
		vCursor = { fg = cleareye.none, bg = cleareye.none, style = "reverse" },
		iCursor = { fg = cleareye.none, bg = cleareye.none, style = "reverse" },
		lCursor = { fg = cleareye.none, bg = cleareye.none, style = "reverse" },
		CursorIM = { fg = cleareye.none, bg = cleareye.none, style = "reverse" },
		CursorColumn = { fg = cleareye.none, bg = cleareye.bg_highlight },
		CursorLine = { fg = cleareye.none, bg = cleareye.bg_highlight },
		LineNr = { fg = cleareye.base4, bg = cleareye.bg },
		CursorLineNr = { fg = cleareye.fg, bg = cleareye.bg_highlight },
		DiffAdd = { fg = cleareye.black, bg = cleareye.green },
		DiffChange = { fg = cleareye.black, bg = cleareye.yellow },
		DiffDelete = { fg = cleareye.black, bg = cleareye.red },
		DiffText = { fg = cleareye.black, bg = cleareye.fg },
		Directory = { fg = cleareye.bg_alt, bg = cleareye.none },
		ErrorMsg = { fg = cleareye.dark_red, bg = cleareye.none, style = "bold" },
		WarningMsg = { fg = cleareye.yellow, bg = cleareye.none, style = "bold" },
		ModeMsg = { fg = cleareye.fg, bg = cleareye.none, style = "bold" },
		MatchParen = { fg = cleareye.red, bg = cleareye.none },
		NonText = { fg = cleareye.black },
		Whitespace = { fg = cleareye.base4 },
		SpecialKey = { fg = cleareye.bg_alt },
		Pmenu = { fg = cleareye.fg, bg = cleareye.bg_popup },
		PmenuSel = { fg = cleareye.base0, bg = cleareye.blue },
		PmenuSelBold = { fg = cleareye.base0, g = cleareye.blue },
		PmenuSbar = { fg = cleareye.none, bg = cleareye.blue },
		PmenuThumb = { fg = cleareye.brown, bg = cleareye.brown },
		WildMenu = { fg = cleareye.fg, bg = cleareye.green },
		Question = { fg = cleareye.yellow },
		NormalFloat = { fg = cleareye.base8, bg = cleareye.bg_highlight },
		TabLineFill = { style = cleareye.none },
		TabLineSel = { bg = cleareye.none },
		StatusLine = { fg = cleareye.bg_popup, bg = cleareye.base2, style = cleareye.none },
		StatusLineNC = { fg = cleareye.bg_popup, bg = cleareye.base2, style = cleareye.none },
		SpellBad = { fg = cleareye.red, bg = cleareye.none, style = "undercurl" },
		SpellCap = { fg = cleareye.blue, bg = cleareye.none, style = "undercurl" },
		SpellLocal = { fg = cleareye.cyan, bg = cleareye.none, style = "undercurl" },
		SpellRare = { fg = cleareye.violet, bg = cleareye.none, style = "undercurl" },
		Visual = { fg = cleareye.black, bg = cleareye.bg_visual },
		VisualNOS = { fg = cleareye.black, bg = cleareye.bg_visual },
		QuickFixLine = { fg = cleareye.violet, style = "bold" },
		Debug = { fg = cleareye.orange },
		debugBreakpoint = { fg = cleareye.bg, bg = cleareye.red },

		Boolean = { fg = cleareye.orange },
		Number = { fg = cleareye.violet },
		Float = { fg = cleareye.violet },
		PreProc = { fg = cleareye.violet },
		PreCondit = { fg = cleareye.violet },
		Include = { fg = cleareye.purple },
		Define = { fg = cleareye.violet },
		Conditional = { fg = cleareye.violet },
		Repeat = { fg = cleareye.violet },
		Keyword = { fg = cleareye.green },
		Typedef = { fg = cleareye.red },
		Exception = { fg = cleareye.red },
		Statement = { fg = cleareye.red },
		Error = { fg = cleareye.red },
		StorageClass = { fg = cleareye.orange },
		Tag = { fg = cleareye.orange },
		Label = { fg = cleareye.orange },
		Structure = { fg = cleareye.orange },
		Operator = { fg = cleareye.magenta },
		Title = { fg = cleareye.orange, style = "bold" },
		Special = { fg = cleareye.yellow },
		SpecialChar = { fg = cleareye.yellow },
		Type = { fg = cleareye.yellow },
		Function = { fg = cleareye.yellow },
		String = { fg = cleareye.brown },
		Character = { fg = cleareye.green },
		Constant = { fg = cleareye.cyan },
		Macro = { fg = cleareye.cyan },
		Identifier = { fg = cleareye.blue },

		Comment = { fg = cleareye.base6, style = "italic" },
		SpecialComment = { fg = cleareye.grey },
		Todo = { fg = cleareye.violet },
		Delimiter = { fg = cleareye.fg },
		Ignore = { fg = cleareye.grey },
		Underlined = { fg = cleareye.none, style = "underline" },
	}
	return syntax
end

function cleareye.load_plugin_syntax()
	local plugin_syntax = {
		TSFunction = { fg = cleareye.yellow },
		TSMethod = { fg = cleareye.yellow },
		TSKeywordFunction = { fg = cleareye.red },
		TSProperty = { fg = cleareye.cyan },
		TSType = { fg = cleareye.teal },
		TSVariable = {fg=cleareye.blue},
		TSPunctBracket = { fg = cleareye.bracket },

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

		vimCommentTitle = { fg = cleareye.grey, style = "bold" },
		vimLet = { fg = cleareye.orange },
		vimVar = { fg = cleareye.cyan },
		vimFunction = { fg = cleareye.magenta },
		vimIsCommand = { fg = cleareye.fg },
		vimCommand = { fg = cleareye.blue },
		vimNotFunc = { fg = cleareye.violet, style = "bold" },
		vimUserFunc = { fg = cleareye.yellow, style = "bold" },
		vimFuncName = { fg = cleareye.yellow, style = "bold" },

    -- Vista
		VistaBracket = { fg = cleareye.grey },
		VistaChildrenNr = { fg = cleareye.orange },
		VistaKind = { fg = cleareye.purpl },
		VistaScope = { fg = cleareye.red },
		VistaScopeKind = { fg = cleareye.blue },
		VistaTag = { fg = cleareye.green, style = "bold" },
		VistaPrefix = { fg = cleareye.grey },
		VistaColon = { fg = cleareye.green },
		VistaIcon = { fg = cleareye.yellow },
		VistaLineNr = { fg = cleareye.fg },

		-- Cursorword
		CursorWord = { bg = cleareye.bg_highlight },

		-- Dashboard
		DashboardShortCut = { fg = cleareye.violet },
		DashboardHeader = { fg = cleareye.orange },
		DashboardCenter = { fg = cleareye.blue },
		DashboardFooter = { fg = cleareye.grey },

		-- LSP
		LspDiagnosticsSignError = { fg = cleareye.red },
		LspDiagnosticsSignWarning = { fg = cleareye.yellow },
		LspDiagnosticsSignInformation = { fg = cleareye.blue },
		LspDiagnosticsSignHint = { fg = cleareye.cyan },

		LspDiagnosticsVirtualTextError = { fg = cleareye.red },
		LspDiagnosticsVirtualTextWarning = { fg = cleareye.yellow },
		LspDiagnosticsVirtualTextInformation = { fg = cleareye.blue },
		LspDiagnosticsVirtualTextHint = { fg = cleareye.cyan },

		LspDiagnosticsUnderlineError = { style = "undercurl", sp = cleareye.red },
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = cleareye.yellow },
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = cleareye.blue },
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = cleareye.cyan },

		-- NvimTree
		NvimTreeFolderName = { fg = cleareye.bracket },
		NvimTreeRootFolder = { fg = cleareye.red },
		NvimTreeSpecialFile = { fg = cleareye.fg, bg = cleareye.none, style = "NONE" },
		-- Telescope
		-- TelescopeSelection = { bg = cleareye.blue },
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
		GitSignsAdd = { fg = cleareye.green },
		GitSignsChange = { fg = cleareye.orange },
		GitSignsDelete = { fg = cleareye.red },

		-- hlslens
    -- HlSearchLensNear = {},
    -- HlSearchLens = {},
    -- HlSearchNear = {},
    HlSearchFloat = { fg = cleareye.bg, bg = cleareye.green},

		-- Hop
    -- HopNextKey = {},
    -- HopNextKey1 = {},
    -- HopNextKey2 = {},
    -- HopUnmatched = {},

		-- Biscuits
		BiscuitColor = { fg = cleareye.base6, style = "italic" }
	}
	return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function()
	cleareye.terminal_color()
	local syntax = cleareye.load_plugin_syntax()
	for group, colors in pairs(syntax) do
		cleareye.highlight(group, colors)
	end
	async_load_plugin:close()
end))

function cleareye.get_cleareye_color()
	return cleareye
end

function cleareye.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end
	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "cleareye"
	local syntax = cleareye.load_syntax()
	for group, colors in pairs(syntax) do
		cleareye.highlight(group, colors)
	end
	async_load_plugin:send()
end

cleareye.colorscheme()

return cleareye
