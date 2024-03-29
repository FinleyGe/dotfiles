local map = vim.api.nvim_set_keymap
local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local opt = { noremap = true, silent = true }
-- nvim-tree
nmap('<Leader>e', ':NvimTreeToggle<CR>', opt)
nmap('<Leader>o', ':Lspsaga outline<CR>', opt)
nmap("<Leader>t", ":TroubleToggle<CR>", opt)

nmap('<M-h>', '<cmd>NavigatorLeft<CR>', opt)
nmap('<M-j>', '<cmd>NavigatorDown<CR>', opt)
nmap('<M-k>', '<cmd>NavigatorUp<CR>', opt)
nmap('<M-l>', '<cmd>NavigatorRight<CR>', opt)


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

-- telescope
map("n", ";f", ":Telescope find_files<CR>", opt)
map("n", ";g", ":Telescope live_grep<CR>", opt)
map("n", ";b", ":Telescope buffers<CR>", opt)
map("n", ";c", ":Telescope commands<CR>", opt)
map("n", ";r", ":Telescope oldfiles<CR>", opt)
map("n", ";s", ":Telescope lsp_document_symbols<CR>", opt)
map("n", ";S", ":Telescope lsp_workspace_symbols<CR>", opt)

-- copilot
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""

-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
map("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opt)
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opt)
map('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opt)
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
map("n", "<Leader>gi", "<cmd>Lspsaga finder<CR>", opt)
map("n", "<Leader>f", "<cmd>GuardFmt<CR>", opt)
-- map("i", "<C-,>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
nmap("<Leader>p", "<cmd>Lspsaga term_toggle<CR>", opt)
