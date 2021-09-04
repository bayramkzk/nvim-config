vim.cmd [[highlight IndentBlanklineIndent1 guifg=#C678DD blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#61AFEF blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#56B6C2 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#98C379 blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#E5C07B blend=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#E06C75 blend=nocombine]]

vim.opt.listchars = {
  space = "⋅"
}

require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6"
  },
  show_trailing_blankline_indent = false
}
