local tree_sitter_manager_status_ok, tree_sitter_manager = pcall(require, 'tree-sitter-manager')
if not tree_sitter_manager_status_ok then
	return
end

tree_sitter_manager.setup {
  ensure_installed = {
    'vim', 'lua', 'vimdoc', 'comment',
    'yaml', 'xml',
    'latex', 'bibtex',
    'bash', 'make', 'dockerfile',
    'c', 'cpp',
    'python',
    'gitignore'
  }
}
