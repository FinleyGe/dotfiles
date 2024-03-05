local ensure_list = {
  'c',
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
  'markdown_inline'
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        -- ensure_installed = { "c", "lua", "query", "javascript", "html" },
        ensure_installed = ensure_list,
        sync_install = true, -- Sync install
        highlight = { enable = true },
        indent = { enable = true },
        -- context_commentstring = {
        --   enable = true,
        -- },
      })
      vim.g.skip_ts_context_commentstring_module = true
      -- require("ts-context-commentstring").setup()
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }
}
