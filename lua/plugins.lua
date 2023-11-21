return {
    -- Core
    { "folke/lazy.nvim" },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            "nvim-treesitter/nvim-treesitter-context",
        },
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "diff",
                "lua",
                "luadoc",
                "luap",
                "commend",
                "regex",
                "json",
                "jsonc",
                "toml",
                "yaml",
                "python",
                "svelte",
                "html",
                "css",
                "javascript",
                "jsdoc",
                "typescript",
                "make",
                "markdown",
                "markdown_inline",
                "vim",
                "vimdoc"
            }
        }
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "b0o/schemastore.nvim" },
            { 'folke/neodev.nvim',                config = true },
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = true,
                severity_sort = true,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                },
            },
            inlay_hints = { enabled = true },
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" },
                            workspace = { checkThirdParty = false },
                            hint = { enable = true },
                        },
                    },
                },
                jsonls = {
                    settings = {
                        json = {
                            format = { enable = true },
                            validate = { enable = true },
                            schemas = require("schemastore").json.schemas(),
                        },
                    },
                },
                bashls = {},
                clangd = {},
                dockerls = {},
                html = {},
                cssls = {},
                svelte = {},
                tsserver = {},
                eslint = {}
            }
        },
    },

    -- UI
    { "rebelot/kanagawa.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    {
        "RRethy/vim-illuminate",
        opts = {
            delay = 0,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        config = true,
    },
    {
        "luukvbaal/statuscol.nvim",
        lazy = false,
        config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                relculright = true,
                segments = {
                    {
                        text = { builtin.lnumfunc, " " },
                        condition = { true, builtin.not_empty },
                    },
                    { text = { " " } },
                    { text = { "%s" } },
                    { text = { builtin.foldfunc } },
                },
            })
        end,
    },
    { "mvllow/modes.nvim",            config = true },
    { "nvim-zh/colorful-winsep.nvim", event = { "WinNew" }, config = true },

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            {
                "l3mon4d3/luasnip",
                dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("luasnip").config.setup({
                        enable_autosnippets = true,
                        history = true,
                        updateevents = "TextChanged,TextChangedI,InsertLeave",
                    })
                    require("luasnip.loaders.from_vscode").load()
                end,
            },

        },
        event = "InsertEnter",
        config = true
    },

    -- Linting
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                --["*"] = {}
            }
        }
    },

    -- Testing
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-python"
        },
        opts = {
            adapters = {
                require("neotest-python")({
                    python = "./.venv/bin/python",
                    runner = "poetry run pytest",
                    args = { "--cov" },
                    pytest_discover_instances = true,
                })
            }
        }
    },

    -- Debuging
    {
        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            { "rcarriga/nvim-dap-ui",            config = true },
            { "theHamsta/nvim-dap-virtual-text", config = true },
            "mfussenegger/nvim-dap-python",
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = "williamboman/mason.nvim",
            },
            config = function()
                require("dap-python").setup(
                    require("mason-registry").get_package("debugpy"):get_install_path() ..
                    "/venv/bin/python")
            end,
        },
    },

    -- Tools
    {
        "https://github.com/stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "Oil" },
        opts = { view_option = { show_hidden = true }, keymaps = { ["<C-x>"] = "actions.select_split", ["<C-v>"] = "actions.select_vsplit" } },
    },
    { "folke/neoconf.nvim" },
    { "danymat/neogen",    opts = { snippet_engine = "luasnip" } },
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm", "TermExec" },
        keys = { "<c-g>" },
        opts = {
            hide_numbers = true,
            open_mapping = "<c-g>",
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    { "abecodes/tabout.nvim",  event = "Insertenter", config = true },
    { 'folke/which-key.nvim',  config = true },
    { 'numtostr/comment.nvim', config = true },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "stevearc/conform.nvim",
        lazy = false,
        opts = {
            format_on_save = { lsp_fallback = true, timeout = 3000 },
            formatters_by_ft = {
                yaml = { "yamlfmt" },
                toml = { "taplo" },
                lua = { "stylua" },
                sh = { "shfmt" },
                --python = {
                --    "ruff_format",
                --    "ruff_fix",
                --},
            },
        },
        config = function()
            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_fallback = true, range = range })
            end, { range = true })
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
    },
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        config = true,
    },
    {
        "nacro90/numb.nvim",
        config = true,
    },
    { "rktjmp/paperplanes.nvim", cmd = "PP" },
    {
        "sourcegraph/sg.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        build = "nvim -l build/init.lua",
        event = "VeryLazy"
    },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    { "milisims/nvim-luaref",    ft = "help" },
    { "nanotee/luv-vimdocs",     ft = "help" },
}
