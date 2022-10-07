require("art.colors").set("treesitter")

require("nvim-treesitter.parsers").get_parser_configs().luap = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-luap",
        files = { "src/parser.c" },
        branch = "main",
    },
}

local colors = art.colors

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        -- universal/unique parsers
        "query",
        "comment",
        "json5",
        "jsonc",
        "luap",
        "markdown_inline",
        "regex",
        -- language specific parsers
        "c",
        "cmake",
        "cpp",
        "css",
        "go",
        "help",
        "html",
        "http",
        "json",
        "julia",
        "latex",
        "lua",
        "make",
        "markdown",
        "norg",
        "python",
        "rust",
        "scheme",
        "toml",
        "vim",
        "yaml",
        "zig",
        "nix",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = { "markdown" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "gnn",
            scope_incremental = "gns",
            node_decremental = "gnp",
        },
    },
    indent = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["il"] = "@loop.outer",
                ["al"] = "@loop.outer",
                ["icd"] = "@conditional.inner",
                ["acd"] = "@conditional.outer",
                ["acm"] = "@comment.outer",
                ["ast"] = "@statement.outer",
                ["isc"] = "@scopename.inner",
                ["iB"] = "@block.inner",
                ["aB"] = "@block.outer",
                ["p"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
    refactor = {
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
    playground = {
        enable = true,
        updatetime = 100,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = { colors.b09, colors.b10, colors.b11, colors.b12, colors.b13, colors.b14, colors.b15, colors.b16 },
    },
    endwise = { enable = true },
    context_commentstring = {
        enable = true,
    },
})
