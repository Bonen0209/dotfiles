local colorscheme = 'nightfox'

local colorscheme_status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not colorscheme_status_ok then
  return
end
