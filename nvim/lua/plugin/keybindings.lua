local map = vim.api.nvim_set_keymap
local nmap = function(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end
local opt = { noremap = true, silent = true }
-- nvim-tree
-- nmap('<Leader>e', ':NvimTreeToggle<CR>', opt)
-- cspell:disable
nmap('<Leader>e', ':Neotree toggle<CR>', opt)
nmap('<Leader>r', ':Neotree current<CR>', opt)
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
nmap(';f', ':Telescope find_files<CR>', opt)
nmap(';g', ':Telescope live_grep<CR>', opt)
nmap(';b', ':Telescope buffers<CR>', opt)
nmap(';c', ':Telescope conflicts<CR>', opt)
nmap(';r', ':Telescope oldfiles<CR>', opt)
nmap(';s', ':Telescope lsp_document_symbols<CR>', opt)
nmap(';S', ':Telescope lsp_workspace_symbols<CR>', opt)
nmap(';w', ':Telescope workspaces<CR>', opt)
nmap(';t', ':TodoTelescope<CR>', opt)
nmap(';m', ':Telescope keymaps<CR>', opt)

map("n", "<Leader>rn", "<cmd>Lspsaga rename<CR>", opt)
map("n", "<Leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
map('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opt)
map('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opt)
map("n", "gh", "<cmd>lua require('pretty_hover').hover()<CR>", opt)
-- map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
map("n", "<Leader>gi", "<cmd>Lspsaga finder<CR>", opt)
-- map("n", "<Leader>f", "<cmd>GuardFmt<CR>", opt)
-- map("i", "<C-,>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
nmap("<Leader>p", "<cmd>Lspsaga term_toggle<CR>", opt)

nmap("<Leader>f", ":Format<CR>", opt)
vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)

nmap("fs", ":Gitsigns stage_hunk<CR>", opt)
nmap("fr", ":Gitsigns reset_hunk<CR>", opt)
nmap("fu", ":Gitsigns undo_stage_hunk<CR>", opt)

nmap("fS", ":Gitsigns stage_buffer<CR>", opt)
nmap("fR", ":Gitsigns reset_buffer<CR>", opt)
nmap("fU", ":Gitsigns reset_buffer_index<CR>", opt)

nmap("fg", ":Git<CR>", opt)
nmap("fC", ":Git commit<CR>", opt)

nmap("fj", ":Gitsigns next_hunk<CR>", opt)
nmap("fk", ":Gitsigns prev_hunk<CR>", opt)
nmap("fp", ":Gitsigns preview_hunk<CR>", opt)

nmap("fcn", ":GitConflictNextConflict<CR>", opt)
nmap("fcp", ":GitConflictPrevConflict<CR>", opt)
nmap("fco", ":GitConflictChooseOurs<CR>", opt)
nmap("fct", ":GitConflictChooseTheirs<CR>", opt)
nmap("fcc", ":GitConflictRefresh<CR>", opt)
