local install = require('nvim-lsp-installer')
local install_servers = require('nvim-lsp-installer.servers')

local on_attach = require('art.modules.lsp.on_attach').on_attach
local capabilities = require('art.modules.lsp.capabilities').capabilities

local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

local servers = {
    sumneko_lua = require('art.modules.lsp.servers.sumneko_lua').options,
    pyright = require('art.modules.lsp.servers.pyright').options,
    clangd = {},
    dockerls = {},
}

require('lsp-format').setup({})

local signs = { Error = 'E', Warn = 'W', Info = 'I', Hint = 'H' }
for sign, icon in pairs(signs) do
    vim.fn.sign_define(
        'DiagnosticSign' .. sign,
        { text = icon, texthl = 'Diagnostic' .. sign, linehl = false, numhl = 'Diagnostic' .. sign }
    )
end

vim.diagnostic.config({
    float = {
        focusable = false,
        border = border,
        scope = 'cursor',
        header = { 'Diagnostic', 'DiagnosticHeader' },
    },
    underline = false,
    signs = {
        enable = true,
        priority = 10,
    },
    update_in_insert = true,
    severity_sort = true,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with({ vim.lsp.handlers.signature_help, border = 'rounded' })

install.settings({
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})

for _, server in pairs(servers) do
    local ok, lsp_server = install_servers.get_server(server)
    if ok then
        if not lsp_server:is_installed() then
            print('Installing ' .. lsp_server)
            lsp_server:install()
        end
    end
end

install.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 100,
        },
    }

    if server.name == 'sumneko_lua' then
        opts = vim.tbl_deep_extend('force', opts, servers.sumneko_lua)
    end

    if server.name == 'pyright' then
        opts = vim.tbl_deep_extend('force', opts, servers.pyright)
    end
    server:setup(opts)
end)
