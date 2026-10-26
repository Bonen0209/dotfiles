local config = {
  update_in_insert = true,
  severity_sort = true,
  virtual_text = true
}

vim.diagnostic.config(config)

local servers = {
  'vimls', 'lua_ls',
  'yamlls', 'lemminx',
  'texlab',
  'bashls', 'docker_language_server',
  'clangd',
  'basedpyright', 'ruff'
}

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    vim.notify(client.name .. ' attached...')
  end
})

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

vim.lsp.config('*', {
  capabilities = cmp_nvim_lsp.default_capabilities()
})
