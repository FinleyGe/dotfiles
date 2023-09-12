local packer = require("packer")

packer.startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- beautify
  -- use('folke/tokyonight.nvim')        -- Theme
  use('tanvirtin/monokai.nvim')
  use("kyazdani42/nvim-web-devicons")         -- Icons
  use('xiyaowong/nvim-transparent')           -- Transparent
  use { 'j-hui/fidget.nvim', tag = "legacy" } -- show the lsp status
  use('HiPhish/nvim-ts-rainbow2')             -- rainbow
  use("lukas-reineke/indent-blankline.nvim")
  -- dependences and libs
  use("nvim-lua/plenary.nvim") -- lua lib
  use("MunifTanjim/nui.nvim")  -- UI lib
  use("SmiteshP/nvim-navic")
  -- tools
  use('akinsho/bufferline.nvim')         -- bufferline
  use('nvim-lualine/lualine.nvim')       -- statusline
  use('nvim-tree/nvim-tree.lua')         -- file tree
  use('norcalli/nvim-colorizer.lua')     -- display the color
  use("folke/todo-comments.nvim")        -- beautify the Comments
  use('simrat39/symbols-outline.nvim')   -- outline by symbols
  use("nvim-telescope/telescope.nvim")   -- fuzzy finder
  use('numToStr/Comment.nvim')           -- Comment
  use("nvim-treesitter/nvim-treesitter") -- treesitter
  use("windwp/nvim-ts-autotag")          -- treesitter auto tag
  use('windwp/nvim-autopairs')           -- auto pairs
  use('kylechui/nvim-surround')          -- surround
  use('moll/vim-bbye')                   -- delete buffer
  use('wakatime/vim-wakatime')           -- wakatime
  use('tpope/vim-fugitive')              -- Git
  use('preservim/vimux')                 -- vim + tmux
  use('christoomey/vim-tmux-navigator')  -- vim + tmux
  use('github/copilot.vim')
  use("jackMort/ChatGPT.nvim")
  use('phaazon/hop.nvim')       -- motion
  use('mg979/vim-visual-multi') --vim-visual-multi
  use('utilyre/barbecue.nvim')
  use("folke/trouble.nvim")
  -- lsp
  use("neovim/nvim-lspconfig")                 -- lspconfig
  use("nvim-lua/lsp-status.nvim")              -- lsp status
  use { "williamboman/mason.nvim" }            -- mason
  use "williamboman/mason-lspconfig.nvim"      -- mason-lspconfig
  use("tami5/lspsaga.nvim")                    -- lspsaga
  use 'lervag/vimtex'                          -- TeX
  use { 'kaarmu/typst.vim', ft = { 'typst' } } -- typst
  use("nvimdev/guard.nvim")                    -- guard
  -- completion
  use('hrsh7th/nvim-cmp')                      -- cmp
  use('hrsh7th/cmp-buffer')                    -- source for nvim-cmp
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip')
  use("zbirenbaum/copilot-cmp")
  -- snippets
  use('L3MON4D3/LuaSnip')
  use("molleweide/LuaSnip-snippets.nvim")
  use('SirVer/ultisnips')
  use('quangnguyen30192/cmp-nvim-ultisnips')
  use {
    "iurimateus/luasnip-latex-snippets.nvim",
    ft = "tex",
  }
  use("rafamadriz/friendly-snippets")
end)

-- setup plugins
require('plugin.auto-pairs')
require("plugin.bufferline")
require('plugin.lualine')
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
