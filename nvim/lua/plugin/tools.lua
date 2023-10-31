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
    opts = {},
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
  }
}
