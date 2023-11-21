vim.filetype.add({
    extension = {
        ["lock"] = "yaml",
    },
    filename = {
        [".gitignore"] = "conf",
        ["launch.json"] = "jsonc",
    },
    pattern = {
        [".env"] = "sh",
        ["COMMIT_EDITMSG"] = "gitcommit",
    },
})
