vim.o.termguicolors = true

-- Set dark or light colorscheme depending on time
local current = os.date("*t", os.time())
local is_day = current.hour <= 18 and current.hour >= 6
if is_day then
    vim.g.tokyonight_style = "day"
else
    vim.g.tokyonight_style = "storm"
end

vim.cmd[[colorscheme tokyonight]]

