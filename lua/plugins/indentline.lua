require('indent_blankline').setup({
    debug = true,
    viewport_buffer = 20,
    use_treesitter = true,
    char = '▏',
    show_first_indent_level = true,
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    context_higlight_list = { 'healthSuccess' },
    show_end_of_line = false,
    context_char = '▏',
    context_patterns = {
        '^do',
        '^for',
        '^if',
        '^object',
        '^switch',
        '^table',
        '^while',
        'arguments',
        'block',
        'catch_clause',
        'class',
        'else_clause',
        'function',
        'if_statement',
        'import_statement',
        'method',
        'operation_type',
        'return',
        'try_statement',
    },
    buftype_exclude = {
        'nofile',
        'terminal',
    },
    filetype_exclude = {
        '',
        'NvimTree',
        'TelescopePrompt',
        'Trouble',
        'alpha',
        'floatline',
        'help',
        'log',
        'man',
        'packer',
    },
})

