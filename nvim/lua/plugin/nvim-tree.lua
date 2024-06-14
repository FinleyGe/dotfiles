return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
        window = {
          auto_expand_width = true,
        }
      }
    end,
    keys = {
      { "<Leader>e", "<cmd>Neotree toggle<CR>" },
    }
  }
}
