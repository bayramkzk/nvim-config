local luasnip = require("luasnip")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif luasnip.expand_or_jumpable() then
    return t "<Plug>luasnip-expand-or-jump"
  elseif check_backspace() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif luasnip.jumpable(-1) then
    return t "<Plug>luasnip-jump-prev"
  else
    return t "<S-Tab>"
  end
end
