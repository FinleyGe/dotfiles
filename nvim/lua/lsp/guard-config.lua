local ft = require('guard.filetype')

ft('vue,typescript,javascript')
    :fmt({
      fn = function()
        vim.cmd([[ EslintFixAll ]])
      end,
    })
    :append('lsp')

ft('go'):fmt('lsp')

ft('c'):fmt('clang-format')

-- Call setup() LAST!
require('guard').setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = true,
})
