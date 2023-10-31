return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "zbirenbaum/copilot-cmp",
      "github/copilot.vim",
      "L3MON4D3/LuaSnip",
    },
    -- event = "VeryLazy",
    lazy = false, -- Lazy load could cause problem
    config = function()
      require("plugin.cmp-setup")
    end
  },
}
