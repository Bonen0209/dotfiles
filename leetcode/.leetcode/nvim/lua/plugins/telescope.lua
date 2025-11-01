local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
  return
end

telescope.setup {
  defaults = {
    layout_strategy = 'bottom_pane',
    layout_config = {
      prompt_position = 'bottom'
    },
    border = false,
    path_display = { 'smart' }
  },
  pickers = {
    find_files = {
      follow = true,
      hidden = true
    },
    grep_string = {
      word_match = '-w'
    },
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
      sort_mru = true
    }
  }
}

telescope.load_extension('fzf')

local telescope_builtin_status_ok, telescope_builtin = pcall(require, 'telescope.builtin')
if not telescope_builtin_status_ok then
  return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<C-p>', telescope_builtin.find_files, opts)
keymap('n', 'K', telescope_builtin.grep_string, opts)
keymap('n', ';', telescope_builtin.buffers, opts)
