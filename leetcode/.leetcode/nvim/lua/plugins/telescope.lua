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
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
      sort_mru = true
    }
  }
}
