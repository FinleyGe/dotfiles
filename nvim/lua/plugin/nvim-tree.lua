require('nvim-tree').setup{
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = false,
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = require'nvim-tree.config'.nvim_tree_callback("edit") },
        { key = "I",                           cb = require'nvim-tree.config'.nvim_tree_callback("toggle_ignored") },
        { key = "H",                           cb = require'nvim-tree.config'.nvim_tree_callback("toggle_dotfiles") },
      }
    }
  }
}

