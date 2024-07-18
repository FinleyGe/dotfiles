local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
local ensure_list = {
  'c',
  'cpp',
  'lua',
  'query',
  'javascript',
  'html',
  'go',
  'rust',
  'yaml',
  'typescript',
  'json',
  'css',
  'bash',
  'toml',
  'python',
  'dockerfile',
  'vim',
  'regex',
  'comment',
  'tsx',
  'vue',
  'markdown',
  'markdown_inline',
  'prisma',
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufRead" },
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = ensure_list,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
      vim.g.skip_ts_context_commentstring_module = true
      vim.treesitter.language.register(
        "mdx", "mardown"
      )
    end,
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    -- cond = not vscode,
  },
  {
    'stevearc/aerial.nvim',
    opts = {
      layout = {
        min_width = 40,
        resize_to_content = true,
      }
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      { "<Leader>o", ":AerialToggle<CR>" },
    },
    cond = not vscode and not firenvim
  }
}
