return {
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
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
    opts = {},
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "SmiteshP/nvim-navic"
    },
    opts = {},
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
  },
  {
    "folke/zen-mode.nvim",
  }
}
