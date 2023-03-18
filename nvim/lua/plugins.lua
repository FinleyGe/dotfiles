local packer = require("packer")

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- beautify
  use 'tanvirtin/monokai.nvim'
  use 'folke/tokyonight.nvim'
  use("kyazdani42/nvim-web-devicons")
  use 'xiyaowong/nvim-transparent'
  use "Djancyp/better-comments.nvim"
  -- tools
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use('numToStr/Comment.nvim')
  use("nvim-treesitter/nvim-treesitter")
  use("windwp/nvim-ts-autotag")
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use('nvim-tree/nvim-tree.lua')
  use('windwp/nvim-autopairs')
  use('kylechui/nvim-surround')
  use('nvim-lualine/lualine.nvim')
  use('moll/vim-bbye')
  use('wakatime/vim-wakatime')
  -- lsp
  use("neovim/nvim-lspconfig")
  use("nvim-lua/lsp-status.nvim")
  use { "williamboman/mason.nvim" }
  use "williamboman/mason-lspconfig.nvim"
  use("tami5/lspsaga.nvim")
  use 'mfussenegger/nvim-jdtls'
  -- completion
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use('preservim/vimux')
  use('christoomey/vim-tmux-navigator')

  use('j-hui/fidget.nvim')

  use 'lervag/vimtex'

  use {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
    -- using treesitter.
    requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require 'luasnip-latex-snippets'.setup()
      -- or setup({ use_treesitter = true })
    end,
    ft = "tex",
  }

  use {
    'github/copilot.vim',
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }
  use "rafamadriz/friendly-snippets"
end)

-- setup plugins
require('plugin.auto-pairs')
require("plugin.bufferline")
require('plugin.lualine')
require('plugin.mason')
require("plugin.nvim-tree")
require('plugin.vimtex')
require('plugin.others')
require('plugin.treesitter')
require("plugin.nvim-cmp")
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
