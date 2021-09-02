require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = colorscheme,
    disabled_filetypes = {},
    section_separators = "",
    component_separators = ""
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch"},
    lualine_c = {{"filename", path = 1}},
    lualine_x = {"filetype", "encoding", "fileformat"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {"nvim-tree"}
}
