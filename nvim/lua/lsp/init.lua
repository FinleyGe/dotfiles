return {
  {
    "folke/neoconf.nvim",
    config = function()
      require("neoconf").setup()
    end,
  },
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
      require("lspsaga").setup({
        lightbulb = {
          enabled = false,
          sign = false,
          virtual_text = false,
        },
        outline = {
          layout = 'float',
        },
      })
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
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
  },
  {
    'VidocqH/lsp-lens.nvim',
    event = "BufRead",
  }
}
