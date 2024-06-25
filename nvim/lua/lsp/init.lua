--cspell:disable
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "yioneko/nvim-vtsls"
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
  -- {
  --   "Fildo7525/pretty_hover",
  --   event = "LspAttach",
  --   opts = {},
  --   keys = {
  --     -- { "K",  "<cmd>lua require('pretty_hover').hover()<CR>" },
  --     { "gh", "<cmd>lua require('pretty_hover').hover()<CR>" }
  --   }
  -- },
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require('hover.providers.diagnostic')
          -- require('hover.providers.gh')
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.dap')
          -- require('hover.providers.fold_preview')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = 'single'
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP'
        },
        mouse_delay = 1000
      }

      -- Setup keymaps
      vim.keymap.set("n", "gh", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
      vim.keymap.set("n", "gH", require("hover").hover_select, { desc = "hover.nvim (select)" })

      -- Mouse support
      vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
      vim.o.mousemoveevent = true
    end,
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
