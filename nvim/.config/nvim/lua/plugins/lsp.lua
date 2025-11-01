local config = {
  update_in_insert = true,
  severity_sort = true,
  virtual_text = true,
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

for _, server in pairs(servers) do
  local opts = {
    on_attach = function(client, bufnr)
      vim.notify(client.name .. ' starting...')

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap('n', 'gd', vim.lsp.buf.definition, opts)
      keymap('n', 'gr', vim.lsp.buf.references, opts)
    end
  }

  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

for _, server in pairs(servers) do
  local opts = {
    capabilities = cmp_nvim_lsp.default_capabilities()
  }

  vim.lsp.config(server, opts)
end
