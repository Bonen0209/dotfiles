local leap_status_ok, leap = pcall(require, 'leap')
if not leap_status_ok then
  return
end

leap.add_default_mappings()

-- Disable some default mappings

-- Shorten function name
local del_keymap = vim.keymap.del

-- Silent keymap option
local opts = { noremap = true, silent = true }

-- Visual
del_keymap('x', 'x', opts)
del_keymap('x', 'X', opts)

-- Operator-pending
del_keymap('o', 'x', opts)
del_keymap('o', 'X', opts)
