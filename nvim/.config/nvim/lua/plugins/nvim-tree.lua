local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_status_ok then
  return
end

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
  renderer = {
    group_empty = true,
    highlight_git = 'name',
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
        bookmarks = false
      }
    }
  }
}

local nvim_tree_api_status_ok, nvim_tree_api = pcall(require, 'nvim-tree.api')
if not nvim_tree_api_status_ok then
  return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<Space>e', nvim_tree_api.tree.toggle, opts)
