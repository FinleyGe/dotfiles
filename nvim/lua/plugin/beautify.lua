local vscode = vim.g.vscode
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    cond = true,
    config = function()
      require("ibl").setup {}
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    cond = not vscode,
    config = function()
      require("scrollbar").setup({
        require("scrollbar.handlers.search").setup({}),
      })
    end,
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      "lewis6991/gitsigns.nvim",
    }
  },
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    opts = {},
  },
}
