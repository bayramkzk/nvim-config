local lspconfig = require('lspconfig')

-- Typescript/Javascript language server [typescript-language-server]
lspconfig.tsserver.setup{}

-- Python language server [pyright]
lspconfig.pyright.setup{}

-- Lua language server [lua-language-server]
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    -- TODO dynamically get the path
    cmd = { "/usr/bin/lua-language-server" };
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- JSON language server [vscode-langservers-extracted]
lspconfig.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
