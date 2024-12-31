local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim

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
  require('style'),
  require('plugin.beautify'),
  require('plugin.git'),
  require('plugin.treesitter'),
  require('plugin.nvim-cmp'),
  require('plugin.ai'),
  require('lsp'),
  require('plugin.tools'),
  require('plugin.telescope'),
  require('plugin.bufferline'),
  require('plugin.lualine'),
  require('plugin.nvim-tree'),
})

-- require('plugin.keybindings')
