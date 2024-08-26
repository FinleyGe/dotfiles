local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  {
    "nvim-telescope/telescope.nvim",
    cond = not vscode and not firenvim,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "debugloop/telescope-undo.nvim" },
      { "piersolenski/telescope-import.nvim" },
      { "Snikimonkd/telescope-git-conflicts.nvim" },
    },
    cmd = "Telescope",
    config = function()
      -- require('telescope').setup({
      --   extensions = {
      --     undo = {},
      --   },
      -- })
      -- require('telescope').load_extension('undo')
      -- require("telescope").load_extension("import")
      -- require("telescope").load_extension("workspaces")
      -- require("telescope").load_extension("conflicts")
    end,
    keys = {
      { ';f', ':Telescope find_files<CR>' },
      { ';g', ':Telescope live_grep<CR>' },
      { ';b', ':Telescope buffers<CR>' },
      { ';c', ':Telescope conflicts<CR>' },
      { ';r', ':Telescope oldfiles<CR>' },
      { ';s', ':Telescope lsp_document_symbols<CR>' },
      { ';S', ':Telescope lsp_workspace_symbols<CR>' },
      { ';w', ':Telescope workspaces<CR>' },
      { ';m', ':Telescope keymaps<CR>' },
      { ';d', ':Telescope diagnostics<CR>'}
    },
  },
}
