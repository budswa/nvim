local c = art.colors
local transparent = art.config.transparent

local highlights = {}

highlights.builtin = {
    -- Vim
    Normal = { fg = c.b06, bg = transparent and 'none' or c.b01 },
    NormalNC = { fg = c.b06, bg = transparent and 'none' or c.b01 },
    Bold = { style = 'bold' },
    Debug = { fg = c.b09 },
    Directory = { fg = c.b14 },
    Error = { fg = c.b01, bg = c.b09 },
    ErrorMsg = { fg = c.b09, bg = c.b01 },
    Exception = { fg = c.b09 },
    FoldColumn = { fg = c.b12, bg = c.b01 },
    Folded = { fg = c.b06 },
    IncSearch = { fg = c.b02, bg = c.b10 },
    Italic = { style = 'italic' },
    Macro = { fg = c.b09 },
    MatchParen = { bg = c.b04 },
    ModeMsg = { fg = c.b12 },
    MoreMsg = { fg = c.b12 },
    MsgArea = { bg = transparent and 'none' or c.b01 },
    Question = { fg = c.b14 },
    Search = { fg = c.b02, bg = c.b11 },
    Substitute = { fg = c.b02, bg = c.b11 },
    SpecialKey = { fg = c.b04 },
    TooLong = { fg = c.b09 },
    UnderLined = { fg = c.b12, style = 'underline' },
    Visual = { bg = c.b03 },
    VisualNOS = { bg = c.b09 },
    WarningMsg = { fg = c.b09 },
    WildMenu = { fg = c.b09, bg = c.b11 },
    Title = { fg = c.b14 },
    Conceal = { bg = 'none' },
    Cursor = { fg = c.b01, bg = c.b06 },
    NonText = { fg = c.b04 },
    SignColumn = { fg = c.b04, sp = 'none' },
    ColorColumn = { bg = c.b02, sp = 'none' },
    CursorColumn = { bg = c.b03, sp = 'none' },
    CursorLine = { bg = c.b02, sp = 'none' },
    CursorLineNr = { bg = c.b02, style = 'bold', sp = 'none' },
    CursorLineSign = { bg = c.b02, sp = 'none' },
    CursorLineFold = { bg = c.b02, sp = 'none' },
    QuickFixLine = { bg = c.b03, sp = 'none' },
    StatusLine = { fg = c.b06, bg = c.b01, sp = 'none' },
    StatusLineNC = { fg = c.b05, bg = c.b01, sp = 'none' },
    Comment = { fg = c.b05 },
    LineNr = { fg = c.b05 },
    WinSeparator = { fg = c.b04 },
    NvimInternalError = { fg = c.b14 },

    -- Diff
    DiffAdd = { fg = c.b09 },
    DiffAdded = { fg = c.b10 },
    DiffChange = { fg = c.b05 },
    DiffChangeDelete = { fg = c.b14 },
    DiffModified = { fg = c.b13 },
    DiffDelete = { fg = c.b14 },
    DiffRemoved = { fg = c.b14 },

    -- Spell
    SpellBad = { style = 'undercurl', sp = c.b09 },
    SpellLocal = { style = 'undercurl', sp = c.b13 },
    SpellCap = { style = 'undercurl', sp = c.b14 },
    SpellRare = { style = 'undercurl', sp = c.b15 },

    -- Tabline
    TabLine = { bg = c.b03 },
    TabLineSel = {},
    TabLineFill = {},

    -- Float
    FloatBorder = { fg = c.b09 },
    NormalFloat = { bg = c.b01 },

    -- Pmenu
    Pmenu = { bg = c.b01 },
    PmenuSbar = { bg = c.b04 },
    PmenuSel = { bg = c.b06, fg = c.b01 },
    PmenuThumb = { bg = c.b09 },

    -- Syntax
    Boolean = { fg = c.b10 },
    Character = { fg = c.b09 },
    Conditional = { fg = c.b09 },
    Constant = { fg = c.b09 },
    Define = { fg = c.b15 },
    Delimiter = { fg = c.c },
    Float = { fg = c.b10 },
    Function = { fg = c.b14 },
    Identifier = { fg = c.b09 },
    Include = { fg = c.b14 },
    Keyword = { fg = c.b15 },
    Label = { fg = c.b11 },
    Number = { fg = c.b10 },
    Operator = { fg = c.b06 },
    PreProc = { fg = c.b11 },
    Repeat = { fg = c.b11 },
    Special = { fg = c.b13 },
    SpecialChar = { fg = c.c },
    Statement = { fg = c.b09 },
    StorageClass = { fg = c.b11 },
    String = { fg = c.b12 },
    Structure = { fg = c.b15 },
    Tag = { fg = c.b11 },
    Todo = { fg = c.b11, bg = c.b02 },
    Type = { fg = c.b11 },
    Typedef = { fg = c.b11 },
}

highlights.treesitter = {
    TSAnnotation = { fg = c.c, sp = 'none' },
    TSAttribute = { fg = c.b11, sp = 'none' },
    TSCharacter = { fg = c.b09, sp = 'none' },
    TSConstBuiltin = { fg = c.b10, sp = 'none' },
    TSConstMacro = { fg = c.b09, sp = 'none' },
    TSConstructor = { fg = c.b09, sp = 'none' },
    TSError = { fg = c.b09, sp = 'none' },
    TSException = { fg = c.b09, sp = 'none' },
    TSFloat = { fg = c.b10, sp = 'none' },
    TSFuncBuiltin = { fg = c.b14, sp = 'none' },
    TSFuncMacro = { fg = c.b09, sp = 'none' },
    TSKeywordOperator = { fg = c.b15, sp = 'none' },
    TSMethod = { fg = c.b14, sp = 'none' },
    TSNamespace = { fg = c.b09, sp = 'none' },
    TSNone = { fg = c.b06, sp = 'none' },
    TSParameter = { fg = c.b09, sp = 'none' },
    TSParameterReference = { fg = c.b06, sp = 'none' },
    TSPunctDelimiter = { fg = c.c, sp = 'none' },
    TSPunctSpecial = { fg = c.b06, sp = 'none' },
    TSStringRegex = { fg = c.b13, sp = 'none' },
    TSStringEscape = { fg = c.b13, sp = 'none' },
    TSSymbol = { fg = c.b12, sp = 'none' },
    TSTagDelimiter = { fg = c.c, sp = 'none' },
    TSText = { fg = c.b06, sp = 'none' },
    TSStrong = { style = 'bold' },
    TSEmphasis = { fg = c.b10, sp = 'none' },
    TSStrike = { fg = c.b01, sp = 'none', style = 'strikethrough' },
    TSLiteral = { fg = c.b10, sp = 'none' },
    TSURI = { fg = c.b10, sp = 'none', style = 'underline' },
    TSTypeBuiltin = { fg = c.b11, sp = 'none' },
    TSVariable = { fg = c.b11 },
    TSVariableBuiltin = { fg = c.b10, sp = 'none' },
    TSDefinition = { sp = c.b05, style = 'underline' },
    TSDefinitionUsage = { sp = c.b05, style = 'underline' },
    TSCurrentScope = { style = 'bold' },

    TreesitterContext = { bg = c.b04 },
    TreesitterContextLineNumber = { fg = c.b04, bg = c.b04 },
}

highlights.lsp = {
    DiagnosticError = { fg = c.b14 },
    DiagnosticWarn = { fg = c.b12 },
    DiagnosticInfo = { fg = c.b10 },
    DiagnosticHint = { fg = c.b16 },
}

highlights.cmp = {
    CmpItemAbbr = { fg = c.b06 },
    CmpItemAbbrMatch = { fg = c.b13, bold = true },
    CmpBorder = { fg = c.b04 },
    CmpDocBorder = { fg = c.b10 },
    CmpItemKindConstant = { fg = c.b10 },
    CmpItemKindFunction = { fg = c.b14 },
    CmpItemKindIdentifier = { fg = c.b09 },
    CmpItemKindField = { fg = c.b09 },
    CmpItemKindVariable = { fg = c.b15 },
    CmpItemKindSnippet = { fg = c.b14 },
    CmpItemKindText = { fg = c.b12 },
    CmpItemKindStructure = { fg = c.b15 },
    CmpItemKindType = { fg = c.b11 },
    CmpItemKindKeyword = { fg = c.b08 },
    CmpItemKindMethod = { fg = c.b14 },
    CmpItemKindConstructor = { fg = c.b09 },
    CmpItemKindFolder = { fg = c.b08 },
    CmpItemKindModule = { fg = c.b11 },
    CmpItemKindProperty = { fg = c.b09 },
    -- CmpItemKindEnum = {  fg = },
    CmpItemKindUnit = { fg = c.b15 },
    -- CmpItemKindClass = {  fg = },
    CmpItemKindFile = { fg = c.b08 },
    -- CmpItemKindInterface = {  fg = },
    CmpItemKindColor = { fg = c.b14 },
    CmpItemKindReference = { fg = c.b06 },
    -- CmpItemKindEnumMember = {  fg = },
    CmpItemKindStruct = { fg = c.b15 },
    CmpItemKindOperator = { fg = c.b06 },
    CmpItemKindTypeParameter = { fg = c.b09 },
}

highlights.whichkey = {
    WhichKey = { fg = c.b09 },
    WhichKeySeparator = { fg = c.b04 },
    WhichKeyDesc = { fg = c.b14 },
    WhichKeyGroup = { fg = c.b10 },
    WhichKeyValue = { fg = c.b10 },
}

highlights.telescope = {
    TelescopeBorder = { fg = c.b01, bg = c.b01 },
    TelescopePromptBorder = { fg = c.b01, bg = c.b01 },
    TelescopePromptNormal = { fg = c.b06, bg = c.b01 },
    TelescopePromptPrefix = { fg = c.b14, bg = c.b01 },
    TelescopeNormal = { bg = c.b01 },
    TelescopePreviewTitle = { fg = c.b01, bg = c.b10 },
    TelescopePromptTitle = { fg = c.b01, bg = c.b14 },
    TelescopeResultsTitle = { fg = c.b01, bg = c.b01 },
    TelescopeSelection = { bg = c.b01, fg = c.b06 },
}

highlights.illuminate = {
    -- {'IlluminatedWordText = { bg = }
    -- {'IlluminatedWordRead = {}
    -- {'IlluminatedWordWrite = {}
}

highlights.all = vim.tbl_deep_extend(
    'force',
    {},
    highlights.builtin,
    packer_plugins['nvim-treesitter'] and highlights.treesitter or {},
    packer_plugins['nvim-lspconfig'] and highlights.lsp or {},
    packer_plugins['nvim-cmp'] and highlights.cmp or {},
    packer_plugins['which-key.nvim'] and highlights.whichkey or {},
    packer_plugins['telescope.nvim'] and highlights.telescope or {},
    packer_plugins['vim-illuminat'] and highlights.illuminate or {}
)

return highlights
