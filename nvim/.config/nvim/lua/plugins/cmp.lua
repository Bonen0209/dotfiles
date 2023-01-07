local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
	return
end

require('luasnip.loaders.from_snipmate').lazy_load()

cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- LuaSnip
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'omni' },
    { name = 'luasnip' }
  }, {
    { name = 'buffer' },
    { name = 'path' }
  })
}

