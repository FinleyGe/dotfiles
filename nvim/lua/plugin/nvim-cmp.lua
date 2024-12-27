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
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     debug = true,
  --   }
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-Enter>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-l>",
        },
        log_level = "info",                -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false
      })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      ---@alias Provider "openai" | "claude" | "azure"  | "copilot" | "cohere" | [string]
      provider = "openai",
      auto_suggestion_provider = "openai",
      openai = {
        endpoint = "https://oneapi.fastgpt.in/v1",
        model = "gpt-4o-mini",
        timeout = 10000,
        temperature = 0,
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestions = {
          accept = "<C-Enter>",
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-c>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        wrap = true,        -- similar to vim.o.wrap
        width = 30,         -- default % based on available width
        sidebar_header = {
          align = "center", -- left, center, right for title
          rounded = true,
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        debug = false,
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
