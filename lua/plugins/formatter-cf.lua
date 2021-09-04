local formatter_tables = {
  prettier = {
    exe = "prettier",
    args = {"-w", vim.api.nvim_buf_get_name(0)},
    stdin = false
  },
  rustfmt = {
    exe = "rustfmt",
    args = {"--emit=stdout"},
    stdin = true
  },
  luafmt = {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  },
  clang_format = {
    exe = "clang-format",
    args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
    stdin = true,
    cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
  }
}

local function get_formatter(key)
  return function()
    return formatter_tables[key]
  end
end

require("formatter").setup {
  logging = true,
  filetype = {
    javascript = {get_formatter("prettier")},
    javascriptreact = {get_formatter("prettier")},
    typescript = {get_formatter("prettier")},
    typescriptreact = {get_formatter("prettier")},
    html = {get_formatter("prettier")},
    css = {get_formatter("prettier")},
    json = {get_formatter("prettier")},
    yaml = {get_formatter("prettier")},
    markdown = {get_formatter("prettier")},
    c = {get_formatter("clang_format")},
    cpp = {get_formatter("clang_format")},
    rust = {get_formatter("rustfmt")},
    lua = {get_formatter("luafmt")}
  }
}
