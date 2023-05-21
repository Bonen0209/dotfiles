local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
  return
end

-- local mason_nvim_dap_status_ok, mason_nvim_dap = pcall(require, 'mason-nvim-dap')
-- if not mason_nvim_dap_status_ok then
--   return
-- end

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    -- LSP
    'vimls', 'lua_ls', 'yamlls',
    'bashls',
    'dockerls',
    'clangd', 'pyright'
  }
}
-- mason_nvim_dap.setup {
--   ensure_installed = {
--     -- DAP
--   }
-- }

-- Vimtex
vim.g.vimtex_toc_config = {
  split_pos = ':vert :botright'
}
