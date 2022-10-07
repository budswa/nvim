local function is_git_repo() return vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";") ~= "" end

local plugins = {
    ---- Core - Package manager and common libraries
    { "wbthomason/packer.nvim" },
    { "nvim-lua/plenary.nvim", module = "plenary" },

    ---- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        ft = {
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
        run = ":TSUpdate",
        config = function() require("art.plugins.treesitter") end,
    },
    { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" },
    { "nvim-treesitter/playground", after = "nvim-treesitter" },
    {
        "rrethy/nvim-treesitter-endwise",
        setup = function()
            vim.api.nvim_create_autocmd("InsertEnter", {
                group = vim.api.nvim_create_augroup("tresitter-endwise", {}),
                callback = function()
                    -- only a few languages are supported at the moment
                    if vim.tbl_contains({ "lua", "vim", "bash", "ruby" }, vim.bo.ft) then
                        require("packer").loader("nvim-treesitter-endwise")
                    end
                end,
            })
        end,
    },
    { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
    { "m-demare/hlargs.nvim", after = "nvim-treesitter" },
    { "narutoxy/dim.lua", after = "nvim-treesitter" },

    -- UI
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VimEnter",
        config = function()
            require("indent_blankline").setup({
                char = "▏",
                context_char = "▏",
                show_current_context = true,
                show_current_context_start = true,
                use_treesitter = true,
                show_trailing_blankline_indent = false,
                viewport_buffer = 8,
            })
        end,
    },
    {
        "mvllow/modes.nvim",
        setup = function()
            vim.schedule(function() require("packer").loader("modes.nvim") end)
        end,
        config = function() require("modes").setup({}) end,
    },
    {
        "xiyaowong/nvim-colorizer.lua",
        cmd = { "ColorizerAttachToBuffer" },
        config = function() require("colorizer").setup() end,
    },

    ---- LSP
    {
        "neovim/nvim-lspconfig",
        ft = {
            "c",
            "cpp",
            "go",
            "lua",
            "python",
            "rust",
            "sh",
        },
        config = function() require("art.plugins.lsp") end,
    },
    {
        "ii14/lsp-command",
        after = "nvim-lspconfig",
    },
    { "folke/lua-dev.nvim", ft = { "lua" }, module = "lua-dev" },
    {
        "ray-x/lsp_signature.nvim",
        event = "LspAttach",
        config = function()
            require("lsp_signature").setup({
                bind = true,
                doc_lines = 0,
                floating_window = true,
                fix_pos = true,
                hint_enable = true,
                hint_prefix = " ",
                hint_scheme = "String",
                hi_parameter = "TSEmphasis",
                handler_opts = { border = require("art.utils").border() },
                padding = "▏",
            })
        end,
    },
    {
        "theHamsta/nvim-semantic-tokens",
        event = "LspAttach",
        config = function()
            require("nvim-semantic-tokens").setup({
                preset = "default",
                highlighters = { require("nvim-semantic-tokens.table-highlighter") },
            })
        end,
    },
    {
        "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp" },
        config = function()
            require("clangd_extensions").setup({
                server = {
                    on_attach = require("art.plugins.lsp").on_attach,
                    capabilities = require("art.plugins.lsp").capabilities,
                    cmd = {
                        "clangd",
                        "-j=8",
                        "--background-index",
                        "--clang-tidy",
                        "--fallback-style=llvm",
                        "--all-scopes-completion",
                        "--completion-style=detailed",
                        "--header-insertion=iwyu",
                        "--header-insertion-decorators",
                        "--pch-storage=memory",
                    },
                },
            })
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
        config = function()
            require("rust-tools").setup({
                server = {
                    on_attach = require("art.plugins.lsp").on_attach,
                    capabilities = require("art.plugins.lsp").capabilities,
                },
            })
        end,
    },

    ---- Completion
    {
        "hrsh7th/nvim-cmp",
        module = "cmp",
        event = { "InsertEnter", "CmdLineEnter" },
        config = function() require("art.plugins.completion") end,
    },
    { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", module = "cmp_nvim_lsp" },
    { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    { "hrsh7th/cmp-path", after = "nvim-cmp" },
    { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
    { "lukas-reineke/cmp-under-comparator", after = "nvim-cmp", module = "cmp-under-comparator" },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter", "CmdLineEnter" },
        module = "nvim-autopairs.completion.cmp",
        after = "nvim-cmp",
        config = function() require("nvim-autopairs").setup({}) end,
    },
    {
        "l3mon4d3/luasnip",
        after = "nvim-cmp",
        module = "luasnip",
        event = "InsertEnter",
        config = function()
            require("luasnip").config.setup({
                enable_autosnippets = true,
                history = true,
                updateevents = "TextChanged,TextChangedI,InsertLeave",
            })
            require("luasnip.loaders.from_vscode").load()
        end,
    },
    { "rafamadriz/friendly-snippets", after = "luasnip", event = "InsertEnter" },
    {
        "danymat/neogen",
        module = "neogen",
        ft = {
            "sh",
            "c",
            "cpp",
            "go",
            "lua",
            "python",
            "rust",
        },
        config = function() require("neogen").setup({}) end,
    },

    ---- Git
    {
        "lewis6991/gitsigns.nvim",
        cond = is_git_repo,
        setup = function()
            vim.api.nvim_create_autocmd({ "BufAdd", "VimEnter" }, {
                callback = function()
                    local function onexit(code, _)
                        if code == 0 then vim.schedule(function() require("packer").loader("gitsigns.nvim") end) end
                    end

                    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                    if lines ~= { "" } then
                        vim.loop.spawn("git", {
                            args = {
                                "ls-files",
                                "--error-unmatch",
                                vim.fn.expand("%"),
                            },
                        }, onexit)
                    end
                end,
            })
        end,
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { hl = "GitSignsAdd", text = "▏" },
                    change = { hl = "GitSignsChange", text = "▏" },
                    delete = { hl = "GitSignsDelete", text = "▁" },
                    topdelete = { hl = "GitSignsDelete", text = "▔" },
                    changedelete = { hl = "GitSignsChange", text = "▏" },
                },
                signcolumn = true,
                numhl = false,
                --attach_to_untracked = true,
            })
        end,
    },

    ---- Tools
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        module = "telescope",
    },
    {
        "akinsho/toggleterm.nvim",
        module = { "toggleterm" },
        cmd = { "ToggleTerm" },
        keys = { "<c-t>" },
        config = function()
            require("toggleterm").setup({
                hide_numbers = true,
                start_in_insert = true,
                insert_mappings = true,
                open_mapping = [[<c-t>]],
                shade_terminals = true,
                shading_factor = "3",
                persist_size = true,
                close_on_exit = false,
                direction = "horizontal",
                float_opts = {
                    border = require("art.utils").border(),
                    winblend = 0,
                    highlights = {
                        border = "FloatBorder",
                        background = "NormalFloat",
                    },
                },
            })
        end,
    },
    {
        "ggandor/lightspeed.nvim",
        keys = { "S", "s", "f", "F", "t", "T" },
    },
    {
        "kylechui/nvim-surround",
        module = "nvim-surround",
        config = function() require("nvim-surround").setup({}) end,
    },
    {
        "numtostr/comment.nvim",
        module = "comment",
        keys = { { "v", "gc" }, { "v", "gb" }, { "n", "gcc" }, { "n", "gcb" } },
        config = function()
            require("comment").setup({
                padding = false,
                sticky = true,
                toggler = {
                    line = "gcc",
                    block = "gbc",
                },
            })
        end,
    },
    {
        "mhartington/formatter.nvim",
        cmd = "FormatWrite",
        setup = function()
            vim.api.nvim_create_autocmd("BufWritePost", {
                callback = function() vim.cmd.FormatWrite() end,
                group = vim.api.nvim_create_augroup("format", {}),
            })
        end,
        config = function()
            require("formatter").setup({
                filetype = {
                    lua = { require("formatter.filetypes.lua").stylua },
                    c = { require("formatter.filetypes.cpp").clangformat },
                    cpp = { require("formatter.filetypes.cpp").clangformat },
                    python = { require("formatter.filetypes.python").black },
                    rust = { require("formatter.filetypes.rust").rustfmt },
                },
            })
        end,
    },
    { "mbbill/undotree", cmd = "UndotreeToggle" },

    ---- Miscellaneous
    {
        "rktjmp/paperplanes.nvim",
        cmd = { "PP" },
        config = function()
            require("paperplanes").setup({
                register = "+",
                provider = "paste.rs",
            })
        end,
    },
    {
        "gpanders/editorconfig.nvim",
        cond = function()
            if vim.loop.fs_stat(vim.fn.stdpath("config") .. "/.editorconfig") then return true end
        end,
    },
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
}

local function setup(bootstrap)
    bootstrap = bootstrap or false
    vim.cmd("packadd packer.nvim")
    local packer = require("packer")

    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "plugins.lua",
        callback = function()
            for p, _ in pairs(package.loaded) do
                if p:find("^art.plugins") then package.loaded[p] = nil end
            end
            packer.compile()
            require("compiled")
        end,
        group = vim.api.nvim_create_augroup("PackerCompile", {}),
    })

    packer.init({
        compile_path = vim.fn.stdpath("config") .. "/lua/compiled.lua",
        opt_default = true,
        plugin_package = "art",
        max_jobs = 16,
        border_style = art.config.border,
        display = {
            done_sym = "+",
            error_sym = "!",
            moved_sym = ">",
            working_sym = " ",
            open_fn = function()
                return require("packer.util").float({
                    border = require("art.utils").border(),
                })
            end,
        },
        profile = { enable = true },
        log = { level = "warn" },
    })

    packer.use(plugins)

    if bootstrap then packer.install() end
end

local dir = vim.fn.stdpath("data") .. "/site/pack/art/opt/packer.nvim"
if vim.loop.fs_stat(dir) then
    setup(false)
else
    vim.notify("Installing Packer.nvim...")
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", dir })
    if vim.v.shell_error ~= 0 then
        vim.notify("Packer.nvim successfully installed!")
        vim.schedule(function() setup(true) end)
    else
        vim.notify("Packer.nvim installation failed!")
        vim.loop.fs_rmdir(dir)
    end
end
