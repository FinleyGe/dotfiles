local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        -- FIX: fix
        -- TODO: something
        -- HACK: something
        -- WARN: something
        -- PERF: something
        -- NOTE: something
        -- TEST: something
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
    keys = {
      { ';t', '<cmd>TodoTelescope<CR>' },
    },
    event = "BufRead",
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    opts = {},
  },
  {
    "moll/vim-bbye",
    keys = {
      { "<Leader>q", "<cmd>Bdelete!<CR>" },
    },
    cond = not vscode and not firenvim,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    cond = not vscode and not firenvim,
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    cond = not vscode and not firenvim,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cond = not vscode and not firenvim,
  },
  {
    "numToStr/Navigator.nvim",
    event = "VeryLazy",
    config = function()
      require('Navigator').setup()
    end,
    keys = {
      { '<M-h>', '<cmd>NavigatorLeft<CR>' },
      { '<M-j>', '<cmd>NavigatorDown<CR>' },
      { '<M-k>', '<cmd>NavigatorUp<CR>' },
      { '<M-l>', '<cmd>NavigatorRight<CR>' },
    },
    cond = not vscode and not firenvim,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    cond = not vscode and not firenvim,
    config = function()
      vim.o.foldcolumn = "1"
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldlevel = 99

      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {
            'treesitter',
            'indent',
          }
        end,
        fold_virt_text_handler = handler,
      })
    end
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>t",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  {
    "nvim-lua/lsp-status.nvim",
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  },
  {
    'gsuuon/tshjkl.nvim',
    keys = "<leader>N",
    opts = {
      select_current_node = true,
      keymaps = {
        toggle = '<leader>N',
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {}
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      -- "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "cpp",
      -- configuration goes here
      cn = {
        enabled = true,
      },
      logging = true,
      injector = {
        ["cpp"] = {
          before = { "#include <bits/stdc++.h>", "using namespace std;" },
          after = "int main() {}",
        },
      }
    },
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        ft_ignore = {
          "dashboard",
          "neo-tree",
          "aerial",
          "quickfix",
        },
        segments = {
          {
            sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 1, auto = false, wrap = true },
            click = "v:lua.ScSa"
          },
          {
            sign = { name = { ".*" }, maxwidth = 1, auto = false, wrap = true },
            click = "v:lua.ScSa"
          },
          {
            sign = { name = { "Diagnostic" }, colwidth = 1, auto = false },
            click = "v:lua.ScSa"
          },
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          {
            text = {
              function(arg)
                return " " .. arg.lnum .. " " .. arg.relnum .. " "
              end
            },
          },
        }
      })
    end,
  },

  {
    "lalitmee/browse.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        mode = { "n", "x" },
        "<leader>s",
        function() require("browse").open_bookmarks() end,
      },
      {
        mode = { "n", "x" },
        "<leader>b",
        function() require("browse").browse() end,
      } },

    opts = {
      bookmarks = {
        ["github_code_search"] = "https://github.com/search?q=%s&type=code",
        ["github_repo_search"] = "https://github.com/search?q=%s&type=repositories",
      },
    },
  },
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require("workspaces").setup({
        path = vim.fn.stdpath("data") .. "/workspaces",
        cd_type = "global",
        sort = true,
        mru_sort = true,
        auto_open = false,
        notify_info = true,

        hooks = {
          add = {},
          remove = {},
          rename = {},
          open_pre = {},
          open = {},
        },
      })
    end
  },
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
    cond = not vscode and not firenvim,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    config = function()
      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      vim.api.nvim_set_keymap('n', '<Leader>c', '<Cmd>noh<CR>', kopts)
    end
  },
  {
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
  }
}
