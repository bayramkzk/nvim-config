local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Typescript/Javascript language server [typescript-language-server]
lspconfig.tsserver.setup {}

-- Python language server [pyright]
lspconfig.pyright.setup {}

-- Lua language server [lua-language-server]
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  cmd = {"/usr/bin/lua-language-server"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path
      },
      diagnostics = {
        globals = {"vim"}
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false
      }
    }
  }
}

-- HTML language server [vscode-langservers-extracted]
require "lspconfig".html.setup {
  capabilities = capabilities
}

-- CSS language server [vscode-langservers-extracted]
require "lspconfig".cssls.setup {
  capabilities = capabilities
}

-- JSON language server [vscode-langservers-extracted]
lspconfig.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}

-- TailwindCSS language server [tailwindcss-language-server]
lspconfig.tailwindcss.setup {}
