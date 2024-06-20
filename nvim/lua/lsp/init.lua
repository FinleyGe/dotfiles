--cspell:disable
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
    'kaarmu/typst.vim',
    ft = 'typst',
  },
  {
    'VidocqH/lsp-lens.nvim',
    event = "BufRead",
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {}
  },
  {
    "nvimtools/none-ls.nvim",
    event = "BufRead",
    config = function()
      local null_ls = require("null-ls")
      require("null-ls").setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
        }
      })
    end,
  },
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {},
    keys = {
      { "K",  "<cmd>lua require('pretty_hover').hover()<CR>" },
      { "gh", "<cmd>lua require('pretty_hover').hover()<CR>" }
    }
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
    end,
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  }
}
