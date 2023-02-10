local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = "utf-8"
local opts = {
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.documentFormattingProvider = false

    -- 绑定快捷键
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    require("keybindings").mapLSP(buf_set_keymap)
    client.offset_encoding = "utf-8"
  end,
}

local lsp = {
  'sumneko_lua',
  'jdtls',
  'pyright',
  'volar',
  'gopls',
  'clangd',
  'texlab',
  'html',
  'texlab',
  'tsserver',
  'cssls',
  'cmake',
};

for _, v in ipairs(lsp) do
  require('lspconfig')[v].setup { opts }
end
-- require 'lspconfig'.sumneko_lua.setup { opts }
-- require 'lspconfig'.jdtls.setup { opts }
-- require('lspconfig')['pyright'].setup { opts }
-- require('lspconfig')['volar'].setup { opts }
-- require('lspconfig')['gopls'].setup { opts }
-- require('lspconfig')['clangd'].setup { opts }
-- require('lspconfig')['texlab'].setup { opts }
-- require('lspconfig')['html'].setup { opts }
