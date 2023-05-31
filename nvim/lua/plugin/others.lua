require("transparent").setup({
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups
    "all"
    -- example of akinsho/nvim-bufferline.lua
  },
})
require("colorizer").setup()
require("Comment").setup {}
require("todo-comments").setup {}
require('fidget').setup {}
require('hop').setup {}
require('chatgpt').setup {}
require('symbols-outline').setup {}
