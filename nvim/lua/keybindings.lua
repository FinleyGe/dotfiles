-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local opt = { noremap = true, silent = true }
-- nvim-tree
nmap('<F3>', ':NvimTreeToggle<CR>', opt)
nmap('<M-h>', ':TmuxNavigateLeft<CR>', opt)
nmap('<M-j>', ':TmuxNavigateUp<CR>', opt)
nmap('<M-k>', ':TmuxNavigateDown<CR>', opt)
nmap('<M-l>', ':TmuxNavigateRight<CR>', opt)
map("n", "<Leader>q", ":Bdelete!<CR>", opt)
nmap('<tab>', ':BufferLineCycleNext<CR>', opt)
nmap('<s-tab>', ':BufferLineCyclePrev<CR>', opt)
--copy to system clipboard

map('v', '<Leader>y', '"+y', opt)

-- telescope
map("n", ";f", ":Telescope find_files<CR>", opt)
map("n", ";g", ":Telescope live_grep<CR>", opt)

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


local pluginKeys = {}

map("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opt)
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
map("n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

-- 开始
map("n", "<Leader>dd", ":call vimspector#Launch()<CR>", opt)
-- 结束
map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
-- 继续
map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
-- 设置断点
map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
--  stepOver, stepOut, stepInto
map("n", "<Leader>dj", "<Plug>VimspectorStepOver", opt)
map("n", "<Leader>dk", "<Plug>VimspectorStepOut", opt)
map("n", "<Leader>dl", "<Plug>VimspectorStepInto", opt)

-- hop
map("n", "<Leader>h", "<cmd>HopWordCurrentLine<CR>", opt)
map("n", "<Leader>l", "<cmd>HopLine<CR>", opt)
return pluginKeys
