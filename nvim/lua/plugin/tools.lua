return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    cmd = "Telescope",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    opts = {},
  },

  {
    "moll/vim-bbye",
    cmd = "Bdelete",
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  -- {
  --   "Lilja/zellij.nvim",
  --   event = "VeryLazy",
  -- },
  {
    "numToStr/Navigator.nvim",
    event = "VeryLazy",
    config = function()
      require('Navigator').setup()
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    config = function()
      require('ufo').setup()
    end
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-lua/lsp-status.nvim",
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  },
  {
    'gsuuon/tshjkl.nvim',
    config = true
  }
}
