local mode = require('feline.providers.vi_mode')
local git = require('feline.providers.git')

require('nvim-gps').setup({
    icons = {
        ['container-name'] = ' '
    }
})

local components = {
    active = {},
    inactive = {}
}

local force_inactive = {
    filetypes = {
        '^packer$',
        '^alpha$',
        '^NvimTree$',
        '^Trouble$',
        '^toggleterm$',
        '^dap-repl$',
        '^dapui_scopes$',
        '^dapui_stacks$',
        '^dapui_breakpoints$',
        '^dapui_watches$',
    },
    buftypes = {
        '^terminal$'
    },
    bufnames = {}
}


local c = {
    green = '#28a745',
    blue = '#9ecbff',
    red = '#f97583',
    bg = '#131619',
    bg_alt = '#1b1e22'
}

local mode_colors = {
    NORMAL = c.green,
    OP = c.green,
    INSERT = c.green,
    VISUAL = c.green,
    LINES = c.green,
    BLOCK = c.green,
    REPLACE = c.green,
    ['V-REPLACE'] = c.green,
    ENTER = c.green,
    MORE = c.green,
    SELECT = c.green,
    COMMAND = c.green,
    SHELL = c.green,
    TERM = c.green,
    NONE = c.green,
}

local mode_names = {
    n = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    [''] = 'V-BLOCK',
    V = 'V-LINE',
    c = 'COMMAND',
    R = 'REPLACE',
    r = 'REPLACE',
    t = 'INSERT'
}


table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], {
    provider = function()
        local mode_text = ' ' .. mode_names[vim.fn.mode()] .. ' '
        return mode_text
    end,
    hl = function()
        return {
            fg = c.bg,
            bg = mode.get_mode_color(),
            style = 'bold'
        }
    end,
    right_sep = {
        str = ' ',
        hl = function()
            return {
                bg = c.bg_alt
            }
        end
    },
    icon = ''
})

table.insert(components.active[1], {
    provider = {
        name = 'file_info',
        opts = {
            type = 'relative',
            file_readonly_icon = '[RO] '
        }
    },
    hl = {
        bg = c.bg_alt
    },
})

table.insert(components.active[1], {
    provider = function()
		return require('nvim-gps').get_location()
	end,
    enabled = function()
		return require('nvim-gps').is_available()
    end,
    left_sep = ' '
})

table.insert(components.active[3], {
    provider = 'lsp_client_names',
    right_sep = ' '
})

table.insert(components.active[3], {
    provider = ' ',
    hl = function()
        return {
            bg = c.bg_alt
        }
    end
})

table.insert(components.active[3], {
    provider = 'git_diff_added',
    enabled = function()
        return git.git_diff_added() ~= ''
    end,
    hl = function()
        return {
            fg = c.green,
            bg = c.bg_alt
        }
    end,
    icon = '+',
    right_sep = {
        str = ' ',
        hl = function()
            return {
                bg = c.bg_alt
            }
        end
    }
})

table.insert(components.active[3], {
    provider = 'git_diff_changed',
    enabled = function()
        return git.git_diff_changed() ~= ''
    end,
    hl = function()
        return {
            fg = c.blue,
            bg = c.bg_alt
        }
    end,
    icon = '!',
    right_sep = {
        str = ' ',
        hl = function()
            return {
                bg = c.bg_alt
            }
        end
    }
})

table.insert(components.active[3], {
    provider = 'git_diff_removed',
    enabled = function()
        return git.git_diff_removed() ~= ''
    end,
    hl = function()
        return {
            fg = c.red,
            bg = c.bg_alt
        }
    end,
    icon = '-',
    right_sep = {
        str = ' ',
        hl = function()
            return {
                bg = c.bg_alt
            }
        end
    }
})

table.insert(components.active[3], {
    provider = 'git_branch',
    enabled = function()
        return git.git_info_exists()
    end,
    hl = function()
        return {
            bg = c.bg_alt
        }
    end,
    icon = '',
    right_sep = {
        str = ' ',
        hl = function()
            return {
                bg = c.bg_alt
            }
        end
    }
})

table.insert(components.active[3], {
    provider = 'position',
    hl = function()
        return {
            fg = c.bg,
            bg = mode.get_mode_color()
        }
    end,
    left_sep = {
        str = ' ',
        hl = function()
            return {
                bg = mode.get_mode_color()
            }
        end
    },
})

table.insert(components.active[3], {
    provider = 'line_percentage',
    hl = function()
        return {
            fg = c.bg,
            bg = mode.get_mode_color(),
            style = 'bold'
        }
    end,
    left_sep = {
        str = ' ',
        hl = function()
            return {
                bg = mode.get_mode_color()
            }
        end
    },
    right_sep = {
        str =' ',
        hl = function()
            return {
                bg = mode.get_mode_color()
            }
        end
    }
})

require('feline').setup {
    components = components,
    colors = c,
    force_inactive = force_inactive,
    vi_mode_colors = mode_colors
}

require('floatline').setup({
    interval = 100
})
