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
nmap('<F4>', ':SymbolsOutline<CR>', opt)

nmap('<M-h>', ':TmuxNavigateLeft<CR>', opt)
nmap('<M-j>', ':TmuxNavigateUp<CR>', opt)
nmap('<M-k>', ':TmuxNavigateDown<CR>', opt)
nmap('<M-l>', ':TmuxNavigateRight<CR>', opt)
map("n", "<Leader>q", ":Bdelete!<CR>", opt)
nmap('<tab>', ':BufferLineCycleNext<CR>', opt)
nmap('<s-tab>', ':BufferLineCyclePrev<CR>', opt)
nmap('<Leader>1', ':BufferLineGoToBuffer 1<CR>', opt)
nmap('<Leader>2', ':BufferLineGoToBuffer 2<CR>', opt)
nmap('<Leader>3', ':BufferLineGoToBuffer 3<CR>', opt)
nmap('<Leader>4', ':BufferLineGoToBuffer 4<CR>', opt)
nmap('<Leader>5', ':BufferLineGoToBuffer 5<CR>', opt)
nmap('<Leader>6', ':BufferLineGoToBuffer 6<CR>', opt)
nmap('<Leader>7', ':BufferLineGoToBuffer 7<CR>', opt)
nmap('<Leader>8', ':BufferLineGoToBuffer 8<CR>', opt)
nmap('<Leader>9', ':BufferLineGoToBuffer 9<CR>', opt)
nmap('<Leader>0', ':BufferLineGoToBuffer 10<CR>', opt)
nmap('<Leader>bd', ':BufferLineSortByDirectory<CR>', opt)
nmap('<Leader>bl', ':BufferLineSortByExtension<CR>', opt)

-- move

nmap('<S-h>', '8h', opt)
nmap('<S-j>', '4j', opt)
nmap('<S-k>', '4k', opt)
nmap('<S-l>', '8l', opt)

--copy to system clipboard
map('v', '<Leader>y', '"+y', opt)

-- telescope
map("n", ";f", ":Telescope find_files<CR>", opt)
map("n", ";g", ":Telescope live_grep<CR>", opt)

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

map("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opt)
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
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
