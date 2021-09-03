local lspconfig = require("lspconfig")
local lspinstall = require("lspinstall")
lspinstall.setup()

local servers = lspinstall.installed_servers()
for _, server in pairs(servers) do
  lspconfig[server].setup{}
end
