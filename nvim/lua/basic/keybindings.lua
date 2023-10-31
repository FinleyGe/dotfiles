-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local opt = { noremap = true, silent = true }
-- move

nmap('<S-h>', '8h', opt)
nmap('<S-j>', '4j', opt)
nmap('<S-k>', '4k', opt)
nmap('<S-l>', '8l', opt)

--copy to system clipboard
map('v', '<Leader>y', '"+y', opt)
