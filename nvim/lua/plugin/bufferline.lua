local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
return {
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    event = "VeryLazy",
    cond = not vscode and not firenvim,
    config = function()
      require('bufferline').setup {

        options = {
          numbers = "ordinal",
          number_style = "superscript",
          indicator = {
            style = 'underline'
          },
          mappings = true,
          buffer_close_icon = "x",
          modified_icon = "",
          close_icon = "x",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thick",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "center"
            }, {
            filetype = "aerial",
            text = "Outline",
            highlight = "Directory",
            text_align = "center"
          }
          },
        }
      }
    end,
    keys = {
      { '<tab>',      '<cmd>BufferLineCycleNext<CR>' },
      { '<s-tab>',    '<cmd>BufferLineCyclePrev<CR>' },
      { '<Leader>1',  '<cmd>BufferLineGoToBuffer 1<CR>' },
      { '<Leader>2',  '<cmd>BufferLineGoToBuffer 2<CR>' },
      { '<Leader>3',  '<cmd>BufferLineGoToBuffer 3<CR>' },
      { '<Leader>4',  '<cmd>BufferLineGoToBuffer 4<CR>' },
      { '<Leader>5',  '<cmd>BufferLineGoToBuffer 5<CR>' },
      { '<Leader>6',  '<cmd>BufferLineGoToBuffer 6<CR>' },
      { '<Leader>7',  '<cmd>BufferLineGoToBuffer 7<CR>' },
      { '<Leader>8',  '<cmd>BufferLineGoToBuffer 8<CR>' },
      { '<Leader>9',  '<cmd>BufferLineGoToBuffer 9<CR>' },
      { '<Leader>0',  '<cmd>BufferLineGoToBuffer 10<CR>' },
      { '<Leader>bd', '<cmd>BufferLineSortByDirectory<CR>' },
      { '<Leader>bl', '<cmd>BufferLineSortByExtension<CR>' },
    }
  }
}
