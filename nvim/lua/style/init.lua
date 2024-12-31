local not_vscode = not vim.g.vscode
local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    cond = not_vscode and not firenvim,
    config = function()
      require("catppuccin").setup({
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          markdown = true,
          NormalNvim = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          indent_blankline = {
            enabled = true,
            scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = true,
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
        }
      })

      vim.cmd("colorscheme catppuccin-mocha")
    end
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
        vim.cmd("colorscheme catppuccin-macchiato")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
        vim.cmd("colorscheme catppuccin-latte")
      end,
    },
    lazy = false,
    cond = not_vscode and not firenvim,
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = { -- table/string: additional groups that should be cleared
          "all"
        },
      })
      require('transparent').clear_prefix('NeoTree')
      require('transparent').clear_prefix('Trouble')
    end,
    cond = not_vscode and not firenvim,
  },
}
