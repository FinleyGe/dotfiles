-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local imap = function(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end
local vmap = function(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

local opt = { noremap = true, silent = true }

--copy to system clipboard
map('v', '<Leader>y', '"+y', opt)

nmap('<C-c>', '<ESC>', opt)
vmap('<C-c>', '<ESC>', opt)
imap('<C-c>', '<ESC>', opt)
