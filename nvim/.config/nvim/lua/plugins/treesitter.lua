local nvim_treesitter_status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not nvim_treesitter_status_ok then
	return
end

nvim_treesitter.install {
  'vim', 'lua', 'vimdoc', 'comment',
  'yaml', 'xml',
  'latex', 'bibtex',
  'bash', 'make', 'dockerfile',
  'c', 'cpp',
  'python',
  'gitignore'
}
