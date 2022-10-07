local config = io.open(vim.fn.expand("~") .. "/.config/kitty/kitty.conf", "w")
if config == nil then return end

local M = {}

local colors = art.colors

function M.reload() vim.api.nvim_command("silent !kill -SIGUSR1 $(pgrep -a kitty)") end

function M.set()
    for _, line in ipairs({
        "font_family " .. art.config.font .. "\n",
        "bold_font" .. art.config.font .. " Bold\n",
        "\n",
        "font_size 12\n",
        "\n",
        "modify_font cell_height 150%\n",
        --"modify_font cell_width 100%\n",
        "modify_font underline_thickness 80%\n",
        "modify_font underline_position 8\n",
        "\n",
        "background " .. colors.b01 .. "\n",
        "foreground " .. colors.b08 .. "\n",
        "\n",
        "dynamic_background_opacity yes\n",
        "background_opacity " .. (art.config.transparent and 0.9 or 1) .. "\n",
    }) do
        config:write(line)
    end
    config:close()
    M.reload()
end

return M
