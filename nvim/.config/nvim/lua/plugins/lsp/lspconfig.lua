local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

local servers = {
  'vimls', 'sumneko_lua', 'yamlls',
  'bashls',
  'dockerls',
  'clangd', 'pyright'
}

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('plugins.lsp.handlers').on_attach,
    capabilities = require('plugins.lsp.handlers').capabilities
  }

  local lspconfig_local_opts_status_ok, lspconfig_local_opts = pcall(require, 'plugins.lsp.settings.' .. server)
  if lspconfig_local_opts_status_ok then
    opts = vim.tbl_deep_extend('force', lspconfig_local_opts, opts)
  end

  lspconfig[server].setup(opts)
end
