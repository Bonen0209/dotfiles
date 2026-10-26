local nvim_treesitter_status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not nvim_treesitter_status_ok then
  return
end

nvim_treesitter.install {
  'vim', 'lua', 'vimdoc', 'comment',
  'yaml', 'xml', 'toml',
  'latex', 'bibtex',
  'bash', 'make', 'dockerfile',
  'c', 'cpp',
  'python',
  'gitignore'
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'vim', 'lua',
    'yaml', 'xml', 'toml',
    'tex', 'bib',
    'sh', 'make', 'dockerfile',
    'c', 'cpp',
    'python',
    'gitignore'
  },
  callback = function() vim.treesitter.start() end
})
