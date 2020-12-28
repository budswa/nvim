local cleareye = {
  base0         = '#1B2229';
  base1         = '#1c1f24';
  base2         = '#202328';
  base3         = '#23272e';
  base4         = '#3f444a';
  base5         = '#5B6268';
  base6         = '#73797e';
  base7         = '#9ca0a4';
  base8         = '#b1b1b1';

  bg            = '#282c34'; 
  bg_alt        = '#21242b'; 
  bg_popup      = '#3E4556'; 
  bg_highlight  = '#2E323C'; 
  bg_visual     = '#b3deef'; 

  fg            = '#bbc2cf';
  fg_alt        = '#5B6268';

  red           = '#ff6c6b';
  orange        = '#ecbe7b';
  yellow        = '#c4bc4f';
  green         = '#98be65';
  teal          = '#1abc9c';
  blue          = '#55b5ed';
  dark_blue     = '#2257A0';
  magenta       = '#c678dd';
  violet        = '#bda1e1';
  cyan          = '#46d9ff';
  dark_cyan     = '#5699af';

  brown         = '#666660';
  white         = '#efefef';
  grey          = '#928374';
  black         = '#000000';

  bracket       = '#80A0C2';
  cursor_bg     = '#4f5b66';
  
  none          = 'NONE';
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
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
                             ' ' .. bg..' '..sp)
end


function cleareye.load_syntax()
  local syntax = {
    Normal = {fg = cleareye.fg,bg=cleareye.bg};
    Terminal = {fg = cleareye.fg,bg=cleareye.bg};
    SignColumn = {fg=cleareye.fg,bg=cleareye.bg};
    FoldColumn = {fg=cleareye.fg_alt,bg=cleareye.black};
    VertSplit = {fg=cleareye.black,bg=cleareye.bg};
    Folded = {fg=cleareye.grey,bg=cleareye.bg_highlight};
    EndOfBuffer = {fg=cleareye.bg,bg=cleareye.none};
    IncSearch = {fg=cleareye.bg_alt,bg=cleareye.orange,style=cleareye.none};
    Search = {fg=cleareye.bg,bg=cleareye.green};
    ColorColumn = {fg=cleareye.none,bg=cleareye.bg_highlight};
    Conceal = {fg=cleareye.grey,bg=cleareye.none};
    Cursor = {fg=cleareye.none,bg=cleareye.none,style='reverse'};
    vCursor = {fg=cleareye.none,bg=cleareye.none,style='reverse'};
    iCursor = {fg=cleareye.none,bg=cleareye.none,style='reverse'};
    lCursor = {fg=cleareye.none,bg=cleareye.none,style='reverse'};
    CursorIM = {fg=cleareye.none,bg=cleareye.none,style='reverse'};
    CursorColumn = {fg=cleareye.none,bg=cleareye.bg_highlight};
    CursorLine = {fg=cleareye.none,bg=cleareye.bg_highlight};
    LineNr = {fg=cleareye.base4};
    CursorLineNr = {fg=cleareye.blue,bg=cleareye.bg_highlight};
    DiffAdd = {fg=cleareye.black,bg=cleareye.green};
    DiffChange = {fg=cleareye.black,bg=cleareye.yellow};
    DiffDelete = {fg=cleareye.black,bg=cleareye.red};
    DiffText = {fg=cleareye.black,bg=cleareye.fg};
    Directory = {fg=cleareye.bg_alt,bg=cleareye.none};
    ErrorMsg = {fg=cleareye.red,bg=cleareye.none,style='bold'};
    WarningMsg = {fg=cleareye.yellow,bg=cleareye.none,style='bold'};
    ModeMsg = {fg=cleareye.fg,bg=cleareye.none,style='bold'};
    MatchParen = {fg=cleareye.red,bg=cleareye.none};
    NonText = {fg=cleareye.bg_alt};
    Whitespace = {fg=cleareye.base4};
    SpecialKey = {fg=cleareye.bg_alt};
    Pmenu = {fg=cleareye.fg,bg=cleareye.bg_popup};
    PmenuSel = {fg=cleareye.base0,bg=cleareye.blue};
    PmenuSelBold = {fg=cleareye.base0,g=cleareye.blue};
    PmenuSbar = {fg=cleareye.none,bg=cleareye.blue};
    PmenuThumb = {fg=cleareye.brown,bg=cleareye.brown};
    WildMenu = {fg=cleareye.fg,bg=cleareye.green};
    Question = {fg=cleareye.yellow};
    NormalFloat = {fg=cleareye.base8,bg=cleareye.bg_highlight};
    TabLineFill = {style=cleareye.none};
    TabLineSel = {bg=cleareye.blue};
    StatusLine = {fg=cleareye.base8,bg=cleareye.none,style=cleareye.none};
    StatusLineNC = {fg=cleareye.gey,bg=cleareye.none,style=cleareye.none};
    SpellBad = {fg=cleareye.red,bg=cleareye.none,style='undercurl'};
    SpellCap = {fg=cleareye.blue,bg=cleareye.none,style='undercurl'};
    SpellLocal = {fg=cleareye.cyan,bg=cleareye.none,style='undercurl'};
    SpellRare = {fg=cleareye.violet,bg=cleareye.none,style = 'undercurl'};
    Visual = {fg=cleareye.black,bg=cleareye.bg_visual};
    VisualNOS = {fg=cleareye.black,bg=cleareye.bg_visual};
    QuickFixLine = {fg=cleareye.violet,style='bold'};
    Debug = {fg=cleareye.orange};
    debugBreakpoint = {fg=cleareye.bg,bg=cleareye.red};

    Boolean = {fg=cleareye.orange};
    Number = {fg=cleareye.violet};
    Float = {fg=cleareye.violet};
    PreProc = {fg=cleareye.violet};
    PreCondit = {fg=cleareye.violet};
    Include = {fg=cleareye.violet};
    Define = {fg=cleareye.violet};
    Conditional = {fg=cleareye.violet};
    Repeat = {fg=cleareye.violet};
    Keyword = {fg=cleareye.red};
    Typedef = {fg=cleareye.red};
    Exception = {fg=cleareye.red};
    Statement = {fg=cleareye.red};
    Error = {fg=cleareye.red};
    StorageClass = {fg=cleareye.orange};
    Tag = {fg=cleareye.orange};
    Label = {fg=cleareye.orange};
    Structure = {fg=cleareye.orange};
    Operator = {fg=cleareye.magenta};
    Title = {fg=cleareye.orange,style='bold'};
    Special = {fg=cleareye.yellow};
    SpecialChar = {fg=cleareye.yellow};
    Type = {fg=cleareye.yellow};
    Function = {fg=cleareye.magenta,style='bold'};
    String = {fg=cleareye.green};
    Character = {fg=cleareye.green};
    Constant = {fg=cleareye.cyan};
    Macro = {fg=cleareye.cyan};
    Identifier = {fg=cleareye.blue};

    Comment = {fg=cleareye.base6};
    SpecialComment = {fg=cleareye.grey};
    Todo = {fg=cleareye.violet};
    Delimiter = {fg=cleareye.fg};
    Ignore = {fg=cleareye.grey};
    Underlined = {fg=cleareye.none,style='underline'};

    TSFunction = {fg=cleareye.yellow,style='bold'};
    TSMethod = {fg=cleareye.yellow,style='bold'};
    TSKeywordFunction = {fg=cleareye.blue};
    TSProperty = {fg=cleareye.cyan};
    TSType = {fg=cleareye.teal};
    TSPunctBracket = {fg=cleareye.bracket};

    vimCommentTitle = {fg=cleareye.grey,style='bold'};
    vimLet = {fg=cleareye.orange};
    vimVar = {fg=cleareye.cyan};
    vimFunction = {fg=cleareye.magenta,style='bold'};
    vimIsCommand = {fg=cleareye.fg};
    vimCommand = {fg=cleareye.blue};
    vimNotFunc = {fg=cleareye.violet,style='bold'};
    vimUserFunc = {fg=cleareye.yellow,style='bold'};
    vimFuncName= {fg=cleareye.yellow,style='bold'};

    diffAdded = {fg = cleareye.green};
    diffRemoved = {fg =cleareye.red};
    diffChanged = {fg = cleareye.blue};
    diffOldFile = {fg = cleareye.yellow};
    diffNewFile = {fg = cleareye.orange};
    diffFile    = {fg = cleareye.aqua};
    diffLine    = {fg = cleareye.grey};
    diffIndexLine = {fg = cleareye.violet};

    gitcommitSummary = {fg = cleareye.red};
    gitcommitUntracked = {fg = cleareye.grey};
    gitcommitDiscarded = {fg = cleareye.grey};
    gitcommitSelected = { fg=cleareye.grey};
    gitcommitUnmerged = { fg=cleareye.grey};
    gitcommitOnBranch = { fg=cleareye.grey};
    gitcommitArrow  = {fg = cleareye.grey};
    gitcommitFile  = {fg = cleareye.green};

    VistaBracket = {fg=cleareye.grey};
    VistaChildrenNr = {fg=cleareye.orange};
    VistaKind = {fg=cleareye.purpl};
    VistaScope = {fg=cleareye.red};
    VistaScopeKind = {fg=cleareye.blue};
    VistaTag = {fg=cleareye.green,style='bold'};
    VistaPrefix = {fg=cleareye.grey};
    VistaColon = {fg=cleareye.green};
    VistaIcon = {fg=cleareye.yellow};
    VistaLineNr = {fg=cleareye.fg};

    GitGutterAdd = {fg=cleareye.green};
    GitGutterChange = {fg=cleareye.blue};
    GitGutterDelete = {fg=cleareye.red};
    GitGutterChangeDelete = {fg=cleareye.violet};

    SignifySignAdd = {fg=cleareye.green};
    SignifySignChange = {fg=cleareye.blue};
    SignifySignDelete = {fg=cleareye.red};

    dbui_tables = {fg=cleareye.blue};

    DefxIconsParentDirectory = {fg=cleareye.orange};
    Defx_filename_directory = {fg=cleareye.blue};
    Defx_filename_root = {fg=cleareye.red};

    DashboardShortCut = {fg=cleareye.violet};
    DashboardHeader = {fg=cleareye.orange};
    DashboardCenter = {fg=cleareye.blue};
    DashboardFooter = {fg=cleareye.grey};

    LspDiagnosticsSignError = {fg=cleareye.red};
    LspDiagnosticsSignWarning = {fg=cleareye.yellow};
    LspDiagnosticsSignInformation = {fg=cleareye.blue};
    LspDiagnosticsSignHint = {fg=cleareye.cyan};

    LspDiagnosticsVirtualTextError = {fg=cleareye.red};
    LspDiagnosticsVirtualTextWarning= {fg=cleareye.yellow};
    LspDiagnosticsVirtualTextInformation = {fg=cleareye.blue};
    LspDiagnosticsVirtualTextHint = {fg=cleareye.cyan};

    LspDiagnosticsUnderlineError = {style="undercurl",sp=cleareye.red};
    LspDiagnosticsUnderlineWarning = {style="undercurl",sp=cleareye.yellow};
    LspDiagnosticsUnderlineInformation = {style="undercurl",sp=cleareye.blue};
    LspDiagnosticsUnderlineHint = {style="undercurl",sp=cleareye.cyan};

    CursorWord0 = {bg=cleareye.cursor_bg};
    CursorWord1 = {bg=cleareye.cursor_bg};

    NvimTreeFolderName = {fg=cleareye.blue};
    NvimTreeRootFolder = {fg=cleareye.red};
    NvimTreeSpecialFile = {fg=cleareye.fg,bg=cleareye.none,stryle='NONE'};

    TelescopeBorder = {fg=cleareye.teal};
    TelescopePromptBorder = {fg=cleareye.blue}
  }
  return syntax
end

function cleareye.get_cleareye_color()
  return cleareye
end

function cleareye.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  -- vim.g.colors_name = 'cleareye'
  vim.o.background = 'dark'
  vim.o.termguicolors = true

  cleareye.terminal_color()
  local syntax = cleareye.load_syntax()

  for group,colors in pairs(syntax) do
    cleareye.highlight(group,colors)
  end
end

cleareye.colorscheme()

return cleareye
