require 'nvim-treesitter.configs'.setup {
  -- 启用代码高亮功能
  -- highlight = {
  --   enable = true,
  --   additional_vim_regex_highlighting = false
  -- },
  autotag = {
    enable = true,
  },

  rainbow = {
    enable = true,
    query = 'rainbow-parens',
    strategy = require('ts-rainbow').strategy.global,
  }
}

require('nvim-ts-autotag').setup()
-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
