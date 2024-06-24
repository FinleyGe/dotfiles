local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    cond = not firenvim,
    config = function()
      require("ibl").setup {}
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    cond = not vscode and not firenvim,
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
    cond = true,
    opts = {},
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = { 120 },
      disabled_filetypes = { "help", "text", "markdown", "dashboard", "aerial" }
    }
  },
}
