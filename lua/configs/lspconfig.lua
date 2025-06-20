require("nvchad.configs.lspconfig").defaults()
require "configs.java"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "gopls",
  "pyright",
  "intelephense",
  "jsonls",
  "ts_ls",
  "tailwindcss",
  "eslint",
}

for _, srv in ipairs(servers) do
  lspconfig[srv].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
