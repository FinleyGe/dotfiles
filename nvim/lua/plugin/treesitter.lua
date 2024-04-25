local ensure_list = {
  'c',
  'cpp',
  'lua',
  'query',
  'javascript',
  'html',
  'go',
  'rust',
  'yaml',
  'typescript',
  'json',
  'css',
  'bash',
  'toml',
  'python',
  'dockerfile',
  'vim',
  'regex',
  'comment',
  'tsx',
  'vue',
  'markdown',
  'markdown_inline',
  'prisma',
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = ensure_list,
        sync_install = false, -- Sync install
        highlight = { enable = true },
        indent = { enable = true },
      })
      vim.g.skip_ts_context_commentstring_module = true
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }
}
