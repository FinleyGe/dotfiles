vim.filetype.add({
  extension = {
    mdx = "markdown.mdx"
  }
})

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
  'volar',
  'gopls',
  'clangd',
  'texlab',
  'html',
  'texlab',
  'cmake',
  'sqlls',
  'svls',
  'rust_analyzer',
  'eslint',
  'asm_lsp',
  'tailwindcss',
  'ltex',
  "ts_ls",
  "dockerls",
  "docker_compose_language_service",
  "prismals",
  "marksman",
  "vtsls",
  "jsonls"
};

require("mason-lspconfig").setup {
  ensure_installed = lsp,
}

local lspconfig = require('lspconfig')

local home = os.getenv("HOME")

require("mason-lspconfig").setup_handlers({
  function(server_name)
    local server_config = {}
    -- if require("neoconf").get(server_name .. ".disable") then
    --   return
    -- end
    if server_name == "ts_ls" then
      server_config.init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = home .. "/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
            languages = { "javascript", "typescript", "vue" },
          }
        },
      }
      server_config.filetypes = { 'vue' }
    end
    -- if server_name == "volar" then
    --   server_config.init_options = {
    --     typescript = {
    --       tsdk = home .. '/.local/share/pnpm/global/5/node_modules/typescript/lib',
    --     }
    --   }
    --   server_config.filetypes = { 'vue', 'typescript', 'javascript' }
    -- end
    if server_name == "clangd" then
      server_config.filetypes = { 'c', 'cpp' }
    end
    lspconfig[server_name].setup(server_config)
  end,
}
)

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()']])

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end

local map = vim.api.nvim_set_keymap
local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local opt = { noremap = true, silent = true }

map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
map("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
map("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
nmap("gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)

nmap("<Leader>f", ":lua vim.lsp.buf.format()<cr>", opt)
