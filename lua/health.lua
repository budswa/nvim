local dependencies = require("dependencies")

local health = vim.health

health.start("config")
if vim.fn.has("nvim-0.10") then
    health.ok("Using Neovim >= 0.10.0")
else
    health.error("Neovim >= 0.10.0 required")
end

for _, dep in ipairs(dependencies) do
    if not vim.fn.executable(type(dep) == "table" and dep[1] or dep) then
        health.warn(("%s is not installed"):format(type(dep) == "table" and dep[2] or dep))
    end
end
