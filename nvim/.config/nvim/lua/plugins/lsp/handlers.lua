local M = {}

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

M.setup = function()
  local config = {
    update_in_insert = true,
    severity_sort = true,
    virtual_text = true,
  }

  vim.diagnostic.config(config)
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_keymaps(bufnr)
  -- Shorten function name
  local bufkeymap = vim.keymap.set

  -- Silent keymap option
  local bufopts = { noremap = true, silent = true }

  bufkeymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  bufkeymap('n', 'gr', vim.lsp.buf.references, bufopts)
end

M.on_attach = function(client, bufnr)
  vim.notify(client.name .. ' starting...')

  lsp_keymaps(bufnr)
end

return M
