local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { "utf-8", "utf-16" }
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
local opts = {
  capabilities = capabilities,
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


local lsp = {
  'lua_ls',
  'jdtls',
  'pyright',
  'volar', -- NOTE: mantually config
  'gopls',
  'clangd',
  'texlab',
  'html',
  'texlab',
  'cmake',
  'sqlls',
  'typst_lsp',
  'bufls',
  'svls',
  'rust_analyzer',
  'eslint',
  'asm_lsp',
  'tailwindcss',
};

require("mason-lspconfig").setup {
  ensure_installed = lsp,
}

for _, v in ipairs(lsp) do
  require('lspconfig')[v].setup { opts }
end

require('lspconfig')['volar'].setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

-- require('lspsaga').setup()
-- require('lsp.guard-config')

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()']])

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end
