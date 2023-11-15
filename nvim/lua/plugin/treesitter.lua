return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "query", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        context_commentstring = {
          enable = true,
        },
      })
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }
}
