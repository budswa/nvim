local M = {}

local install = require('nvim-lsp-installer')
local servers = require('nvim-lsp-installer.servers')
local null = require('null-ls')
local b = null.builtins
local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

local required_servers = {
    'sumneko_lua',
    'vimls',
    'clangd',
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
        header = { 'Diagnostics:', 'DiagnosticHeader' },
        pos = 1,
        prefix = function(diagnostic, i, total)
            local icon, highlight
            if diagnostic.severity == 1 then
                icon = 'E'
                highlight = 'DiagnosticError'
            elseif diagnostic.severity == 2 then
                icon = 'W'
                highlight = 'DiagnosticWarn'
            elseif diagnostic.severity == 3 then
                icon = 'I'
                highlight = 'DiagnosticInfo'
            elseif diagnostic.severity == 4 then
                icon = 'H'
                highlight = 'DiagnosticHint'
            end
            return i .. '/' .. total .. ' ' .. icon .. '  ', highlight
        end,
    },
    underline = true,
    virtual_text = {
        prefix = '⋄ ',
        spacing = 2,
        severity_limit = 'Warning',
    },
    signs = {
        enable = true,
        priority = 10,
    },
    update_in_insert = true,
    severity_sort = true,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with({
    vim.lsp.handlers.hover,
    border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with({
    vim.lsp.handlers.signature_help,
    border = 'rounded',
})

local update_capabilities = function(capabilities)
    capabilities.offsetEncoding = { 'utf-16' }
    capabilities.textDocument.completion.completionItem.preselectSupport = true
    capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { 'documentation', 'detail', 'additionalTextEdits' },
    }
    capabilities.textDocument.codeAction = {
        dynamicRegistration = false,
        codeActionLiteralSupport = {
            codeActionKind = {
                valueSet = {
                    '',
                    'quickfix',
                    'refactor',
                    'refactor.extract',
                    'refactor.inline',
                    'refactor.rewrite',
                    'source',
                    'source.organizeImports',
                },
            },
        },
    }
    return capabilities
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities = update_capabilities(capabilities)

M.on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true, noremap = true }

    map('n', '<c-k>', function()
        vim.lsp.buf.signature_help()
    end, opts)
    map('n', 'g0', function()
        vim.lsp.buf.document_symbol()
    end, opts)
    map('n', 'gi', function()
        vim.lsp.buf.implementation()
    end, opts)
    map('n', 'gD', function()
        vim.lsp.buf.declaration()
    end, opts)
    map('n', 'gd', function()
        vim.lsp.buf.definition()
    end, opts)
    map('n', 'gr', function()
        vim.lsp.buf.references()
    end, opts)

    require('which-key').register({
        ['<leader>'] = {
            l = {
                name = '[LSP]',
                d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition' },
                D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
                i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Show implementation' },
                r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename symbol' },
                R = { '<cmd>lua vim.lsp.buf.references()<cr>', 'Show references' },
                t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Show type definition' },
                f = { '<cmd>lua vim.diagnostic.open_float()<cr>', 'Diagnostics open float' },
                a = { '<cmd>CodeActionMenu<cr>', 'Code action' },
                A = { '<cmd>Telescope lsp_range_code_actions<cr>', 'Range code action' },
                s = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Workspace symbols' },
                S = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document symbols' },
                w = {
                    name = '[Workspace]',
                    l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', 'Workspace list' },
                    a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', 'Workspace add' },
                    r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', 'Workspace remove' },
                },
            },
        },
    })

    require('lsp-format').on_attach(client)
    require('lsp_signature').on_attach({
        bind = true,
        max_height = 12,
        max_width = 120,
        transpancy = 20,
        hint_prefix = '⋉ ',
        handler_opts = { border = 'rounded' },
    }, bufnr)

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_create_augroup('lsp', {})
        vim.api.nvim_create_autocmd('CursorHold', {
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
            buffer = bufnr,
            group = 'lsp',
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            callback = function()
                vim.lsp.buf.clear_references()
            end,
            buffer = bufnr,
            group = 'lsp',
        })
    end
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

install.settings({
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
})

for _, s in pairs(required_servers) do
    local ok, lsp_server = servers.get_server(s)
    if ok then
        if not lsp_server:is_installed() then
            print('Installing ' .. s)
            lsp_server:install()
        end
    end
end

install.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = M.on_attach,
        root_dir = vim.loop.cwd,
        flags = {
            debounce_text_changes = 100,
        },
    }

    if server.name == 'sumneko_lua' then
        opts = require('lua-dev').setup({
            library = { plugins = true, types = true, vimruntime = true },
            lspconfig = {
                runtime = {
                    version = 'LuaJIT',
                    path = runtime_path,
                    vim.fn.expand('~') .. '/.config/nvim/lua/?.lua',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                    maxPreload = 10000,
                    preloadFileSize = 1000,
                },
            },
        })
    end

    if server.name == 'pyright' then
        opts.settings = {
            pyright = {
                flags = {
                    allow_incremental_sync = true,
                },
            },
        }
    end
    server:setup(opts)
end)

local sources = {
    b.code_actions.gitrebase,
    b.code_actions.gitsigns,
    b.code_actions.refactoring,
    --b.diagnostics.selene.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/selene.toml' } }),
    --b.diagnostics.luacheck.with({ extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc'  }}),
    b.formatting.prettierd,
    b.formatting.stylua.with({ extra_args = { '--config-path', vim.fn.stdpath('config') .. '/stylua.toml' } }),
}

null.setup({
    on_attach = M.on_attach,
    capabilities = capabilities,
    debounce = 100,
    debug = true,
    sources = sources,
})

return M
