return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_next = "<C-j>",
            jump_prev = "<C-k>",
            select = "<C-CR>",
            close = "<Esc>",
            open = "<C-l>",
          },
          layout = {
            position = "right",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-CR>",
            next = "<C-j>",
            prev = "<C-k>",
          }
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
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
    event = "InsertEnter",
    config = function()
      require("plugin.cmp-setup")
    end
  },
}
