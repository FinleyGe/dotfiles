local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    cond = not vscode and not firenvim,
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
