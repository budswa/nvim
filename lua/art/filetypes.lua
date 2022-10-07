vim.filetype.add({
    extension = {
        ["lock"] = "yaml",
    },
    filename = {
        [".gitignore"] = "conf",
        ["launch.json"] = "jsonc",
        ["Brewfile"] = "ruby",
    },
    pattern = {
        ["COMMIT_EDITMSG"] = "gitcommit",
    },
})
