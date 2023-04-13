require("transparent").setup({
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups
    "all"
    -- example of akinsho/nvim-bufferline.lua
  },
})

require("Comment").setup {}

require('better-comment').Setup()
require('fidget').setup {}
require('hop').setup {}
