local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = {
  capabilities = capabilities,
  -- on_attach = function(client, bufnr)
  --   client.server_capabilities.documentFormattingProvider = false
  -- end,
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
