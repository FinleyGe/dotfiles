local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('plugin.beautify'),
  require('plugin.treesitter'),
  require('plugin.snippets'),
  require('plugin.nvim-cmp'),
  require('lsp'),
  require('plugin.tools'),
  require('plugin.bufferline'),
  require('plugin.lualine'),
  require('plugin.nvim-tree'),
})
