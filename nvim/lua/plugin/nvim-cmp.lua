local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   cond = not vscode and not firenvim,
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = true,
  --         auto_refresh = true,
  --         keymap = {
  --           jump_next = "<C-j>",
  --           jump_prev = "<C-k>",
  --           select = "<C-CR>",
  --           close = "<Esc>",
  --           open = "<C-l>",
  --         },
  --         layout = {
  --           position = "right",
  --           ratio = 0.4,
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --         keymap = {
  --           accept = "<C-CR>",
  --           next = "<C-j>",
  --           prev = "<C-k>",
  --         }
  --       },
  --     })
  --   end,
  -- },
  --
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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      debug = true,
    }
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-Enter>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        -- ignore_filetypes = { cpp = true },
        -- color = {
        --   suggestion_color = "#ffffff",
        --   cterm = 244,
        -- },
        log_level = "info",                -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false
      })
    end,
  },

}
