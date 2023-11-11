local autopairs_status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_status_ok then
  return
end

autopairs.setup {
  check_ts = true,
  ts_config = {
    lua = { 'string' }
  }
}

local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_status_ok then
  return
end

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
