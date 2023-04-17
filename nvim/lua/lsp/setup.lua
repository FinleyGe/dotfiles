local capabilities = require('cmp_nvim_lsp').default_capabilities()
local opts = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
}

local mason_lsp = {
  'lua_ls',
  'jdtls',
  'pyright',
  'volar',
  'gopls',
  'clangd',
  'texlab',
  'html',
  'texlab',
  'tsserver',
  'cmake',
  'stylelint_lsp',
  'sqlls',
};

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup {
  ensure_installed = mason_lsp,
}

local lsp = {
  'lua_ls',
  'jdtls',
  'pyright',
  'volar',
  'gopls',
  'clangd',
  'texlab',
  'html',
  'texlab',
  'tsserver',
  'cmake',
  'stylelint_lsp',
  'sqlls',
  'typst_lsp',
};

for _, v in ipairs(lsp) do
  require('lspconfig')[v].setup { opts }
end
