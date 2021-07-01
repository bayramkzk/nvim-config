vim.o.termguicolors = true
local dark_colorscheme = 'base16-twilight'
local light_colorscheme = 'base16-gruvbox-light-soft'

-- set dark or light colorscheme depending on time
local current = os.date("*t", os.time())
local colorscheme = nil
if current.hour < 19 and current.hour > 7 then
    colorscheme = light_colorscheme
else
    colorscheme = dark_colorscheme
end
vim.cmd('colorscheme ' .. colorscheme)

