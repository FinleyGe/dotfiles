return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics', 'gitsigns_status' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {
          'lazy',
          'quickfix',
          'trouble',
          'nvim-tree',
        },
      }
    end
  }
}
