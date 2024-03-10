local config = require('plugins.configs.lspconfig')
local on_attach = config.onattach
local capabilities = config.capabilities

local lspconfig = require('lspconfig')

local servers = {
  'tsserver',
  'tailwindcss',
  'eslint'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
