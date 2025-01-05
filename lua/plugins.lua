vim.cmd.packadd({ args = { "cfilter" }, bang = true })

return {
    -- Core
    { "folke/lazy.nvim" },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, name in ipairs({
                    "ast-grep",
                    "hadolint",
                    -- "clang_format",
                    -- "gofmt",
                    "goimports",
                    "shfmt",
                    "shellcheck",
                    "yamlfmt",
                    -- "zigfmt",
                }) do
                    local p = mr.get_package(name)
                    if not p:is_installed() then p:install() end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "nvim-treesitter/nvim-treesitter-context",
                opts = { max_lines = 4 },
            },
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                ensure_installed = {
                    "c",
                    "cpp",
                    "diff",
                    "lua",
                    "luadoc",
                    "luap",
                    "comment",
                    "regex",
                    "rust",
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
                    "vimdoc",
                    "dockerfile",
                    "query",
                    "go",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" },
            --{ "b0o/schemastore.nvim" },
            { "folke/neodev.nvim",                config = true },
            {
                "folke/neoconf.nvim",
                cmd = "Neoconf",
                config = false,
                dependencies = { "nvim-lspconfig" },
            },
        },
        opts = {
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
                            -- schemas = require("schemastore").json.schemas(),
                        },
                    },
                },
                rust_analyzer = {
                    settings = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                            runBuildScripts = true,
                        },
                        checkOnSave = {
                            allFeatures = true,
                            command = "clippy",
                            extraArgs = { "--no-deps" },
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                    },
                },
                ast_grep = {},
                pyright = {},
                ruff_lsp = {},
                bashls = {},
                clangd = {},
                dockerls = {},
                docker_compose_language_service = {},
                htmx = {},
                html = {},
                cssls = {},
                svelte = {},
                tailwindcss = {},
                tsserver = {},
                eslint = {},
                typos_lsp = {},
                taplo = {},
                gopls = {},
                julials = {},
                -- lexical = {},
                -- ocamllsp = {},
                zls = {},
                vimls = {},
                yamlls = {
                    settings = {
                        yaml = {
                            format = { enable = true },
                            validate = true,
                            -- schemas = { require("schemastore").yaml.schemas() },
                            schemaStore = {
                                enable = false,
                                url = "",
                            },
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            vim.diagnostic.config({
                update_in_insert = true,
                severity_sort = true,
                inlay_hints = { enabled = true },
                virtual_text = { prefix = "●" },
                underline = false,
            })

            local lspconfig = require("lspconfig")
            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities(),
                {
                    workspace = {
                        -- PERF: didChangeWatchedFiles is too slow.
                        -- TODO: Remove this when https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265 is fixed.
                        didChangeWatchedFiles = { dynamicRegistration = false },
                    },
                }
            )

            require("lspconfig.ui.windows").default_options.border = "rounded"

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(opts.servers),
            })

            for k, v in pairs(opts.servers) do
                lspconfig[k].setup(v)
            end
        end,
    },
    { 'mrcjkb/rustaceanvim' },
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
    },

    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
    },

    -- UI
    {
        "rebelot/kanagawa.nvim",
        enabled = art.colorscheme == "kanagawa",
        config = function() vim.cmd.colorscheme("kanagawa") end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        enabled = art.colorscheme == "oxocarbon",
        config = function() vim.cmd.colorscheme("oxocarbon") end,
    },
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
        config = function(_, opts) require("illuminate").configure(opts) end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
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
                    { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                    { text = { builtin.lnumfunc },      click = 'v:lua.ScLa' },
                    { text = { " " } },
                    { text = { '%s' },                  click = 'v:lua.ScSa' },
                },
            })
        end,
    },
    { "mvllow/modes.nvim",            config = true },
    { "nvim-zh/colorful-winsep.nvim", event = { "WinNew" }, config = true },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            {
                "saecki/crates.nvim",
                -- event = { "BufRead Cargo.toml" },
                opts = { src = { cmp = { enabled = true } } },
            },
            {
                "l3mon4d3/luasnip",
                -- dependencies = { "rafamadriz/friendly-snippets" },
                config = function()
                    require("luasnip").config.setup({
                        enable_autosnippets = true,
                        history = true,
                        delete_check_events = "TextChanged",
                    })
                    -- require("luasnip.loaders.from_vscode").load()
                end,
            },
        },
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()

            cmp.setup({
                completion = { completeopt = "menu,menuone,noinsert" },
                snippet = {
                    expand = function(args) require("luasnip").lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert,
                    }),
                    ["<C-p>"] = cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Insert,
                    }),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<S-CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-CR>"] = function(fallback)
                        cmp.abort()
                        fallback()
                    end,
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },
                    { name = "crates" },
                }),
                experimental = { ghost_text = true },
                sorting = defaults.sorting,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "cmp_docs",
                callback = function() vim.treesitter.start(0, "markdown") end,
            })
        end,
    },

    -- Linting
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                --["*"] = {}
                dotenv = { "dotenv_linter" },
                dockerfile = { "hadolint" },
                -- lua = { "luacheck", "selene" },
                python = { "mypy" },
            }
            vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
                callback = function() require("lint").try_lint() end,
            })
        end,
    },

    -- Testing
    -- {
    --     "nvim-neotest/neotest",
    --     dependencies = {
    --         "nvim-neotest/neotest-python",
    --         "nvim-neotest/neotest-go",
    --         "rouge8/neotest-rust",
    --     },
    --     config = function()
    --         require("neotest").setup({
    --             adapters = {
    --                 require("neotest-rust"),
    --                 require("neotest-go"),
    --                 require("neotest-python")({
    --                     python = "./.venv/bin/python",
    --                     runner = "poetry run pytest",
    --                     pytest_discover_instances = true,
    --                 }),
    --             },
    --         })
    --     end,
    -- },

    -- Debugging
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
                opts = { ensure_installed = { "codelldb", "debugpy" } },
            },
            config = function()
                require("dap-python").setup(
                    require("mason-registry").get_package("debugpy"):get_install_path()
                    .. "/venv/bin/python"
                )
            end,
        },
    },

    -- Tools
    {
        "https://github.com/stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "Oil" },
        opts = {
            view_option = { show_hidden = true },
            keymaps = { ["<C-x>"] = "actions.select_split", ["<C-v>"] = "actions.select_vsplit" },
        },
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
        config = true,
    },
    { "abecodes/tabout.nvim",  event = "Insertenter", config = true },
    { "folke/which-key.nvim",  config = true },
    { "numtostr/comment.nvim", config = true },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                enabled = vim.fn.executable("make") == 1,
            },
        },
        cmd = "Telescope",
        keys = {
            { "<leader>f<space>", "<cmd>Telescope resume<cr>",      desc = "Resume" },
            { "<leader>fg",       "<cmd>Telescope live_grep<cr>",   desc = "Grep" },
            { "<leader>ff",       "<cmd>Telescope find_files<cr>",  desc = "Files" },
            { "<leader>fb",       "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
            { "<leader>fc",       "<cmd>Telescope git_commits<cr>", desc = "Commits" },
        },
        config = function()
            require("telescope").setup({
                pickers = { buffers = { sort_mru = true } },
            })
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = { async = true, lsp_fallback = true, timeout = 3000 },
            formatters_by_ft = {
                rust = { "rustfmt" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                go = { "gofmt", "goimports" },
                zig = { "zigfmt" },
                yaml = { "yamlfmt" },
                toml = { "taplo" },
                lua = { "stylua" },
                sh = { "shfmt", "shellcheck" },
                --python = {
                --    "ruff_format",
                --    "ruff_fix",
                --},
            },
        },
        config = function()
            vim.opt.formatexpr = "v:lua.vim.lsp.formatexpr()"
            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line =
                        vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
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
    -- {
    --     "sourcegraph/sg.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    --     build = "nvim -l build/init.lua",
    -- },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function() vim.g.startuptime_tries = 10 end,
    },
    { "milisims/nvim-luaref",    ft = "help" },
    { "nanotee/luv-vimdocs",     ft = "help" },

    -- Markdown
    { "ellisonleao/glow.nvim",   config = true, cmd = "Glow" }
}
