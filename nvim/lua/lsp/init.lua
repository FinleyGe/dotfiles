return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("lsp.setup")
    end
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup()
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },
  {
    "nvimdev/guard.nvim",
    cmd = "GuardFmt",
    init = function()
      require("lsp.guard-config")
    end,
    dependencies = {
      "nvimdev/guard-collection",
    },
  }
}
