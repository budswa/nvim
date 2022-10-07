local cmp = require("cmp")
local types = require("cmp.types")
--local str = require('cmp.utils.str')
local autopairs = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local neogen = require("neogen")

cmp.event:on("confirm_done", autopairs.on_confirm_done())

require("cmp_nvim_lsp").setup()

cmp.setup({
    enabled = function()
        if vim.bo.ft == "TelescopePrompt" then return false end
        return true
    end,
    preselect = types.cmp.PreselectMode.Item,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    completion = {
        scrollbar = "┃",
        completeopt = "menu,menuone,preview",
        keyword_length = 2,
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require("art.plugins.completion.kind").cmp_format({
            with_text = false,
            menu = {
                luasnip = "[Snip]",
                nvim_lsp = "[LS]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                buffer = "[Buf]",
            },
        }),
    },
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = {
        -- return: completes completion if option selected otherwise normal return behaviour
        -- control + space: trigger completion menu
        -- control + e: close completion menu
        -- control + j: if cmp visible then select next completion choice otherwise jump to next
        --              available Luasnip or Neogen jump nodes
        -- control + k: if cmp visible then select previous completion choice otherwise jump to prev
        --              available Luasnip or Neogen jump nodes
        -- control + f: scroll docs down or revolve positively through Luasnip choice nodes
        -- control + d: scroll docs up or revolve negatively through Luasnip choice nodes
        -- tab: command mode only; select next completion choice
        -- shift + tab: command mode only; select prev completion choice
        ["<cr>"] = cmp.mapping({
            i = cmp.mapping.confirm({
                select = false,
                behavior = cmp.ConfirmBehavior.Insert,
            }),
            c = cmp.mapping.confirm({
                select = false,
                behavior = cmp.ConfirmBehavior.Select,
            }),
        }),
        ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<c-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
        ["<c-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif neogen.jumpable() then
                neogen.jump_next()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<c-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.choice_active() then
                luasnip.change_choice(-1)
            elseif neogen.jumpable(-1) then
                neogen.jump_prev()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<c-f>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
                cmp.scroll_docs(4)
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<c-d>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
                cmp.scroll_docs(-4)
            elseif luasnip.choice_active() then
                luasnip.change_choice(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({
                    behavior = cmp.SelectBehavior.Insert,
                })
            end
        end, { "c" }),
        ["<s-tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert,
                })
            end
        end, { "c" }),
    },
    sources = {
        { name = "luasnip", priority = 4 },
        { name = "path", priority = 3 },
        { name = "nvim_lsp", priority = 3 },
        { name = "nvim_lua", priority = 2 },
        { name = "buffer", priority = 1 },
        { name = "nvim_lsp_signature_help", priority = 10 },
    },
    experimental = { ghost_text = true },
    sorting = {
        comparator = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

cmp.setup.cmdline(":", {
    enabled = true,
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
    }),
    --view = {
    --    entries = { name = 'wildmenu', separator = ' | ' },
    --},
})

cmp.setup.cmdline({ "/", "?" }, {
    enabled = true,
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer", keyword_length = 1 },
    },
    --view = {
    --    entries = { name = 'wildmenu', separator = ' | ' },
    --},
})
