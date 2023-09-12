require('nvim-tree').setup {
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    adaptive_size = true,
    --     mappings = {
    --       custom_only = false,
    --       list = {
    -- --        { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = require 'nvim-tree.config'.nvim_tree_callback("edit") },
    -- --        { key = "I",                              cb = require 'nvim-tree.config'.nvim_tree_callback("toggle_ignored") },
    -- --        { key = "H",                              cb = require 'nvim-tree.config'.nvim_tree_callback("toggle_dotfiles") },
    --       }
    --     }
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.typst = {
  install_info = {
    url = "~/.local/opt/tree-sitter-typst", -- local path or git repo
    files = { "src/parser.c" },             -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "main",                        -- default branch in case of git repo if different from master
    generate_requires_npm = true,           -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true,  -- if folder contains pre-generated src/parser.c
  },
  filetype = "typst"
}
