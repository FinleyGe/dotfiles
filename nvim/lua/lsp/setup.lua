require("fidget").setup {}

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
  'cmake',
  'sqlls',
  'svls',
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
  -- 'volar', -- NOTE: mantually config
  'gopls',
  'clangd',
  'texlab',
  'html',
  'texlab',
  -- 'tsserver', --NOTE: we do not need it anymore
  'cmake',
  'sqlls',
  'typst_lsp',
  'bufls',
  'dartls',
  'svls',
  'rust_analyzer',
  'eslint',
};

for _, v in ipairs(lsp) do
  require('lspconfig')[v].setup { opts }
end

require('lspconfig')['volar'].setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

require('lsp.guard-config')
