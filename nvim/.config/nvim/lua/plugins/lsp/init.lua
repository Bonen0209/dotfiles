local lspconfig_status_ok, _ = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
	return
end

local cmp_nvim_lsp_status_ok, _ = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

require('plugins.lsp.lspconfig')
require('plugins.lsp.handlers').setup()
