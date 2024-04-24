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

-- move
-- nmap('<S-h>', '8h', opt)
-- nmap('<S-j>', '4j', opt)
-- nmap('<S-k>', '4k', opt)
-- nmap('<S-l>', '8l', opt)
-- vmap('<S-h>', '8h', opt)
-- vmap('<S-j>', '4j', opt)
-- vmap('<S-k>', '4k', opt)
-- vmap('<S-l>', '8l', opt)

--copy to system clipboard
map('v', '<Leader>y', '"+y', opt)

nmap('<C-c>', '<ESC>', opt)
vmap('<C-c>', '<ESC>', opt)
imap('<C-c>', '<ESC>', opt)
