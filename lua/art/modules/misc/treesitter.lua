local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg_meta = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}

parser_configs.norg_table = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}

parser_configs.luap = {
    install_info = {
        url = 'https://github.com/vhyrro/tree-sitter-luap',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'norg',
        'norg_meta',
        'norg_table',
        'query',
        'comment',
        'regex',
        'bash',
        'c',
        'c_sharp',
        'cmake',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'help',
        'html',
        'java',
        'javascript',
        'javascript',
        'json',
        'latex',
        'lua',
        'luap',
        'make',
        'markdown',
        'python',
        'rust',
        'scheme',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = { 'markdown' },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'gnn',
            scope_incremental = 'gns',
            node_decremental = 'gnp',
        },
    },
    indent = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['il'] = '@loop.outer',
                ['al'] = '@loop.outer',
                ['icd'] = '@conditional.inner',
                ['acd'] = '@conditional.outer',
                ['acm'] = '@comment.outer',
                ['ast'] = '@statement.outer',
                ['isc'] = '@scopename.inner',
                ['iB'] = '@block.inner',
                ['aB'] = '@block.outer',
                ['p'] = '@parameter.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
    textsubjects = {
        enable = true,
        keymaps = {
            [','] = 'textsubjects-smart',
        },
    },
    refactor = {
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = 'gnd',
                list_definitions = 'gnD',
                list_definitions_toc = 'gO',
                goto_next_usage = '<a-*>',
                goto_previous_usage = '<a-#>',
            },
        },
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'grr',
            },
        },
    },
    tree_docs = { enable = false },
    autopairs = { enable = true },
    playground = {
        enable = true,
        updatetime = 25,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    autotag = { enable = true },
    endwise = { enable = true },
    tree_setter = { enable = true },
    yati = { enable = true },
})
