local nvim_tree_status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_status_ok then
  return
end

nvim_tree.setup {
  disable_netrw = true,
  renderer = {
    group_empty = true,
    highlight_git = 'name',
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false
      },
      glyphs = {
        symlink = ''
      }
    }
  }
}
