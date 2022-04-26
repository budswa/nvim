local heirline = require('heirline')
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')

local colors = require('art.colors').get()

--local mode_colors = {
--    n =
--    i =
--    v =
--    V =
--    ["^V"] =
--    c =
--    s =
--    S =
--    ["^S"] =
--    R =
--    r =
--    ["!"] =
--    t =
--}

--local mode_names = {
--    n = 'N',
--    no = 'N?',
--    nov = 'N?',
--    noV = 'N?',
--    ['no'] = 'N?',
--    niI = 'Ni',
--    niR = 'Nr',
--    niV = 'Nv',
--    nt = 'Nt',
--    v = 'V',
--    vs = 'Vs',
--    V = 'V_',
--    Vs = 'Vs',
--    [''] = '',
--    ['s'] = '',
--    s = 'S',
--    S = 'S_',
--    [''] = '',
--    i = 'I',
--    ic = 'Ic',
--    ix = 'Ix',
--    R = 'R',
--    Rc = 'Rc',
--    Rx = 'Rx',
--    Rv = 'Rv',
--    Rvc = 'Rv',
--    Rvx = 'Rv',
--    c = 'C',
--    cv = 'Ex',
--    r = '...',
--    rm = 'M',
--    ['r?'] = '?',
--    ['!'] = '!',
--    t = 'T',
--}

local function winwidth()
    return vim.api.nvim_call_function('winwidth', { 0 })
end

local function wordcount()
    local wc = vim.api.nvim_eval('wordcount()')
    if wc['visual_words'] then
        return wc['visual_words']
    else
        return wc['words']
    end
end

-- Components table
local c = {
    align = { provider = '%=' },
    space = { provider = ' ' },
}

c.file = {}

c.cwd = {
    {
        provider = function()
            local cwd = vim.fn.getcwd(0)
            cwd = vim.fn.fnamemodify(cwd, ':~')
            if not conditions.width_percent_below(#cwd, 0.25) then
                cwd = vim.fn.pathshorten(cwd)
            end
            local trail = cwd:sub(-1) == '/' and '' or '/'
            return ' ' .. cwd .. trail
        end,
        hl = { bg = colors.vibrant_green, fg = colors.black },
    },
}

c.coords = {}

c.git = {}

c.lsp_progress = {}

c.progress = {}

c.diagnstics = {}

c.snippets = {}

c.dyn_help = {}

c.words = {
    {
        init = function(self)
            self.mode = vim.fn.mode(1)
        end,
        provider = function()
            return wordcount()
        end,
        hl = function(self)
            local mode = self.mode:sub(1, 1)
            return { fg = mode_colors[mode], bg = colors.lightbg }
        end,
        condition = conditions.is_active(),
    },
}

local default_statusline = {
    condition = conditions.is_active,

    c.mode,
    c.align,
    c.cwd,
    c.file,
    c.align,
    c.words,
}

heirline.setup({
    {
        init = utils.pick_child_on_condition,

        default_statusline,
        --help_file_statusline,
        --filetree_statusline,
    },
})
