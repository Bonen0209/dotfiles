local nvim_autopairs_status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not nvim_autopairs_status_ok then
  return
end

nvim_autopairs.setup()

local nvim_autopairs_completion_cmp_status_ok, nvim_autopairs_completion_cmp = pcall(require, 'nvim-autopairs.completion.cmp')
if not nvim_autopairs_completion_cmp_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

cmp.event:on(
  'confirm_done',
  nvim_autopairs_completion_cmp.on_confirm_done()
)
