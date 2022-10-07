require("lua-dev").setup()

return {
    settings = {
        Lua = {
            completion = {
                keywordSnippet = "Replace",
                callSnippet = "Replace",
            },
            hint = { enable = true },
        },
    },
}
