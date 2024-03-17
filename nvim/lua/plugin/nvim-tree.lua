return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
    }
  end
}
