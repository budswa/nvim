local M = {}

function M.highlight(group, properties)
    local args = {}

    if properties.link then
        vim.cmd('highlight! link ' .. group .. ' ' .. properties.link)
        return
    end
    if properties.fg then
        if vim.tbl_contains({ 'none', 'NONE', 'None' }, properties.fg) then
            args['fg'] = ''
        else
            args['fg'] = properties.fg
        end
    end
    if properties.bg then
        if vim.tbl_contains({ 'none', 'NONE', 'None' }, properties.bg) then
            args['bg'] = ''
        else
            args['bg'] = properties.bg
        end
    end
    if properties.style then
        if type(properties.style) == 'table' then
            for _, attribute in ipairs(properties.style) do
                args[attribute] = true
            end
        else
            if not vim.tbl_contains({ 'none', 'NONE', 'None' }, properties.style) then
                args[properties.style] = true
            end
        end
    end
    if properties.sp then
        args['sp'] = properties.sp
    end

    vim.api.nvim_set_hl(0, group, args)
end

local hi = M.highlight

function M.set(scheme)
    M.colors = require('art.colors').get(scheme)

    local bg = M.colors['bg0']
    local bg_dark = M.colors['bg_dark']
    local bg_light = M.colors['bg_light']

    local fg = M.colors['fg']
    local fg_dark = M.colors['fg_dark']
    local fg_light = M.colors['fg_light']

    local red = M.colors['red']
    local orange = M.colors['orange']
    local yellow = M.colors['yellow']
    local green = M.colors['green']
    local blue = M.colors['blue']
    local dark_blue = M.colors['dark_blue']
    local pink = M.colors['pink']
    local purple = M.colors['purple']

    local grey0 = M.colors['grey0']
    local grey1 = M.colors['grey1']
    local white = M.colors['white']
    local black = M.colors['black']

    -- Vim
    hi('Normal', { bg = bg })
    hi('StatusLine', { bg = bg })
    hi('CursorLine', { bg = bg_light })
    hi('CursorLineNr', { fg = fg })
    hi('LineNr', { fg = fg_dark })
    hi('SignColumn', { bg = bg })
    hi('WinSeparator', { fg = fg_dark, bg = bg })
    hi('VertSplit', { fg = fg_dark, bg = bg })

    -- Syntax
    hi('Comment', { fg = fg_dark })
    hi('Constant', { fg = green })
    --hi('String', { fg = })
    --Character                         = { link = "String" },
    -- Number                            = { fg = colors.nu },
    -- Boolean                           = { fg = colors.co, style = "bold" },
    -- Float                             = { link = "Number" },

    -- Identifier                        = { fg = colors.id },
    hi('Function', { fg = purple })
    -- Method                            = { link = 'Function' },
    hi('Statement', { fg = blue, style = 'bold' })
    hi('Conditional', { fg = blue })
    -- Repeat                         = {},
    hi('Label', { link = 'Statement' })
    -- Operator                          = { fg = colors.op },
    -- Keyword                           = { fg = colors.kw, style = config.keywordStyle },
    -- Exception                         = { fg = colors.sp2 },

    -- Pmenu

    -- Float
    hi('NormalFloat', { bg = bg })

    -- LSP
    --hi('DiagnosticWarn', {})
    --hi('DiagnosticError', {})
    --hi('DiagnosticInfo', {})
    --hi('DiagnosticHint', {})

    -- Treesitter

    -- Plugins -------------------------------
    -- cmp

    -- Gitsigns
    hi('GitSignsAdd', { fg = green, bg = bg })
    hi('GitSignsDelete', { fg = red, bg = bg })
    hi('GitSignsChange', { fg = blue, bg = bg })

    -- Indentblankline
    hi('IndentBlanklineChar', { fg = fg_dark })

    -- Neotree

    -- Telescope

    -- Whichkey
    -- WhichKey                       = {},
    -- WhichKeyGroup                  = {},
    -- WhichKeyDesc                   = {},
    -- WhichKeySeperator              = {},
    -- WhichKeySeparator              = {},
    -- WhichKeyFloat                  = {},
    -- WhichKeyValue                  = {},
end

return M
