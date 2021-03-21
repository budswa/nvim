vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ text = "●", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ text = "●", texthl = "LspDiagnosticsSignWarning", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ text = "●", texthl = "LspDiagnosticsSignInformation", linehl = "", numhl = "" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ text = "●", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" }
)

require("lspkind").init()
require'lspinstall'.setup()
require'lsp_signature'.on_attach()

require("lspconfig").vimls.setup({
	cmd = { "vim-language-server", "--stdio" },
	filetypes = { "vim" },
	init_options = {
		diagnostic = {
			enable = true,
		},
		indexes = {
			count = 3,
			gap = 100,
			projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
			runtimepath = true,
		},
		iskeyword = "@,48-57,_,192-255,-#",
		runtimepath = "",
		suggest = {
			fromRuntimepath = true,
			fromVimruntime = true,
		},
		vimruntime = "",
	},
})

local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim", "use", "awesome", "client" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

require("lspconfig").intelephense.setup({
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
})

require("lspconfig").html.setup({
	cmd = { "html-languageserver", "--stdio" },
	filetypes = { "html", "php" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
})

require("lspconfig").cssls.setup({
	cmd = { "css-languageserver", "--stdio" },
	filetypes = { "css", "scss", "less" },
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
})

require("lspconfig").bashls.setup({
	cmd = { "bash-language-server", "start" },
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
	},
	filetypes = { "sh" },
})
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/bin/omnisharp"
require("lspconfig").omnisharp.setup({
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
})

require("lspconfig").gdscript.setup({
	filetypes = { "gd", "gdscript3" },
})

require("lspconfig").jsonls.setup({
	filetypes = { "json" },
})

require("lspconfig").pyls.setup({
	filetypes = { "python" },
})

require("lspconfig").gopls.setup({
	filetypes = { "go" },
})

require("lspconfig").clangd.setup({
	filetypes = { "c", "cpp", "objc", "objcpp" },
})

require("lspconfig").efm.setup({
    cmd = { "efm-langserver" }
})
