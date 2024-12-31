local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  {
    "hrsh7th/nvim-cmp",
    cond = not vscode and not firenvim,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "zbirenbaum/copilot-cmp",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
      "molleweide/LuaSnip-snippets.nvim",
    },
    config = function()
      require("plugin.cmp-setup")
    end
  },
}
