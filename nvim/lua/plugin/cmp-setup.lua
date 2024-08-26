-- Set up nvim-cmp.
local cmp = require 'cmp'
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/flutter-snippets" } })

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "…",
      show_labelDetails = true,
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
    ['<tab>'] = cmp.mapping.select_next_item(),
    ['<s-tab>'] = cmp.mapping.select_prev_item(),
    ['<c-,>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      -- { name = 'copilot',   group_index = 1 },
      -- { name = "supermaven" },
    },
    {
      { name = 'buffer' },
      { name = "path" },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
