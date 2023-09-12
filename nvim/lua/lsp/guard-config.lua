local ft = require('guard.filetype')
ft('vue'):fmt({
  fn = function()
    -- vim.lsp.buf.format({ bufnr = bufnr, range = range, async = true })
    vim.cmd([[ EslintFixAll ]])
  end,
})

-- Call setup() LAST!
require('guard').setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = true,
})
