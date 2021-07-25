local function check_is_day()
    local current = os.date("*t", os.time())
    local is_day = current.hour <= 18 and current.hour >= 6
    return is_day
end

local function get_tokyo_style()
    if check_is_day() then
        return "storm"
    end
    return "night"
end

vim.g.tokyonight_style = get_tokyo_style()

vim.o.termguicolors = true

vim.g.tokyonight_italic_keywords = false

vim.cmd[[colorscheme tokyonight]]
