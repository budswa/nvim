vim.cmd.packadd({ args = { "cfilter" }, bang = true })

return {
    -- Core
    { "folke/lazy.nvim" },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                "ast-grep",
                "lua-language-server",
                "pyright",
                "ruff-lsp",
                "json-lsp",
                "bash-language-server",
                "clangd",
                "hadolint",
                "dockerfile-language-server",
                "docker-compose-language-service",
                "html-lsp",
                "css-lsp",
                "svelte-language-server",
                "tailwindcss-language-server",
                "typescript-language-server",
                -- "eslint-lsp",
                "yaml-language-server",
            }
        },
        config = function(_, opts)
            require("mason").setup(opts)

            local mr = require("mason-registry")

            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "diff",
                "lua",
                "luadoc",
                "luap",
                "comment",
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
                "vimdoc",
                "dockerfile"
            },
        },
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" },
            { "b0o/schemastore.nvim" },
            { "folke/neodev.nvim",                config = true },
            { "folke/neoconf.nvim",               cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
        },
        config = function()
            vim.diagnostic.config({
                update_in_insert = true,
                severity_sort = true,
                inlay_hints = { enabled = true },
                virtual_text = { prefix = "●" },
                underline = false
            })

            for k, v in pairs({
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
                bashls = {},
                clangd = {},
                dockerls = {},
                docker_compose_language_service = {},
                html = {},
                cssls = {},
                svelte = {},
                tailwindcss = {},
                tsserver = {},
                eslint = {},
                yamlls = {
                    settings = {
                        yaml = {
                            format = { enable = true },
                            validate = true,
                            -- schemas = { require("schemastore").yaml.schemas() },
                            schemaStore = {
                                -- Must disable built-in schemaStore support to use
                                -- schemas from SchemaStore.nvim plugin
                                enable = false,
                                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                url = "",
                            },
                        }
                    }
                }
            }) do require("lspconfig")[k].setup(v) end
        end,
    },
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
        opts = {
            inlay_hints = {
                inline = true,
            },
        },
    },

    -- UI
    {
        "rebelot/kanagawa.nvim",
        enabled = _G.art.colorscheme == "kanagawa",
        config = function() vim.cmd.colorscheme("kanagawa") end
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        enabled = _G.art.colorscheme == "oxocarbon",
        config = function() vim.cmd.colorscheme("oxocarbon") end
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
        config = true,
    },

    -- Linting
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                --["*"] = {}
                dotenv = { "dotenv_linter" },
                dockerfile = { "hadolint" },
                lua = { "luacheck", "selene" },
                python = { "mypy" }
            }
            vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end
    },

    -- Testing
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-python",
        },
        config = function()
            require("neotest").setup(
                {
                    adapters = {
                        require("neotest-python")({
                            python = "./.venv/bin/python",
                            runner = "poetry run pytest",
                            pytest_discover_instances = true,
                        })
                    }
                }
            )
        end
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
        dependencies = { "nvim-lua/plenary.nvim" },
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
    --     event = "VeryLazy",
    -- },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function() vim.g.startuptime_tries = 10 end,
    },
    { "milisims/nvim-luaref",    ft = "help" },
    { "nanotee/luv-vimdocs",     ft = "help" },
}
