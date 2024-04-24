return {
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   lazy = true,
  --   event = "VeryLazy",
  --   config = function()
  --     require('nvim-tree').setup {
  --       sort = {
  --         sorter = "case_sensitive",
  --       },
  --       view = {
  --         width = 48,
  --       },
  --       renderer = {
  --         group_empty = true,
  --       },
  --     }
  --   end
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
}
