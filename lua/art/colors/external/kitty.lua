local config = io.open(vim.fn.expand('~') .. '/.config/kitty/kitty.conf', 'w')
if config == nil then return end

local kitty = {}

local colors = art.colors

function kitty.reload() vim.api.nvim_exec('silent !kill -SIGUSR1 $(pgrep -a kitty)', {}) end

function kitty.set()
    for _, line in ipairs({
        'font_family ' .. art.config.font .. '\n',
        'bold_font' .. art.config.font .. ' Bold\n',
        '\n',
        'font_size 12\n',
        '\n',
        'modify_font cell_height 160%\n',
        'modify_font cell_width 110%\n',
        'modify_font underline_thickness 80%\n',
        'modify_font underline_position 8\n',
        '\n',
        'background ' .. colors.b01 .. '\n',
        'foreground ' .. colors.b08 .. '\n',
        '\n',
        'dynamic_background_opacity yes\n',
        'background_opacity ' .. (art.config.transparent and 0.72 or 1) .. '\n',
    }) do
        config:write(line)
    end
    config:close()
    kitty.reload()
end

return kitty
