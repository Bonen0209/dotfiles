local treesitter_status_ok, treesitter = pcall(require, 'nvim-treesitter')
if not treesitter_status_ok then
	return
end

local treesitter_configs_status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not treesitter_configs_status_ok then
	return
end

treesitter_configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'vim', 'lua', 'vimdoc', 'yaml',
    'gitignore',
    'comment',
    'bash',
    'make', 'dockerfile',
    'latex', 'bibtex',
    'c', 'cpp', 'python'
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
    -- `false` will disable the whole extension
		enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {'latex'},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
	  additional_vim_regex_highlighting = false
	},

  indent = { enable = true }
}
