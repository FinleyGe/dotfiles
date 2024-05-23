--cspell:disable
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
    opts = {
      -- your options here
    }
  },
  {
    "nvimtools/none-ls.nvim",
    event = "BufRead",
    config = function()
      local null_ls = require("null-ls")
      local cspell_config = {
        config_file_preferred_name = 'cspell.json',

        find_json = function()
          local home = os.getenv("HOME")
          return home .. '/.cache/cspell/cspell.json'
        end,
      }
      require("null-ls").setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.completion.spell,
          null_ls.builtins.diagnostics.codespell,
          require('cspell').diagnostics.with({ config = cspell_config }),
          require('cspell').code_actions.with({ config = cspell_config }),
        }
      })
    end,
    dependencies = {
      'davidmh/cspell.nvim'
    }
  },
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {}
  }, {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
      virtual_text = false,
    })
    vim.keymap.set(
      "",
      "<Leader>l",
      require("lsp_lines").toggle,
      { desc = "Toggle lsp_lines" }
    )
  end,
}
}
