local M = {}

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
  local config = {
    -- virtual_text = false,
    update_in_insert = true,
    severity_sort = true,
    -- float = {
    --   border = 'rounded',
    --   source = 'if_many'
    -- }
  }

  vim.diagnostic.config(config)

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = 'rounded',
-- })
-- 
-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--   border = 'rounded',
-- })
end

local function lsp_keymaps(bufnr)
  -- Shorten function name
  local bufkeymap = vim.keymap.set

  -- Silent keymap option
  local bufopts = { noremap = true, silent = true }

  -- bufkeymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  bufkeymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- bufkeymap('n', 'K', vim.lsp.buf.hover, bufopts)
  bufkeymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- bufkeymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- bufkeymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- bufkeymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- bufkeymap('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- bufkeymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  bufkeymap('n', 'gy', vim.lsp.buf.type_definition, bufopts)
  -- bufkeymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- bufkeymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  bufkeymap('n', 'gr', vim.lsp.buf.references, bufopts)
  -- bufkeymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- bufkeymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  -- bufkeymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- bufkeymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- bufkeymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- bufkeymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- bufkeymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- bufkeymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  -- bufkeymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- bufkeymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  vim.notify(client.name .. " starting...")

  lsp_keymaps(bufnr)
end

return M
