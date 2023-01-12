if exists('g:vscode')
  " Vscode-neovim
  Plug 'scrooloose/nerdcommenter'

else
  " ordinary
  call plug#begin('~/.vim/plugged')
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  Plug 'kylechui/nvim-surround'
  Plug 'junegunn/fzf.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'crusoexia/vim-monokai'
  Plug 'scrooloose/nerdcommenter'
  Plug 'luochen1990/rainbow'
  Plug 'preservim/nerdtree'
  Plug 'majutsushi/tagbar'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Raimondi/delimitMate'
  Plug 'tpope/vim-surround'
  Plug 'jbgutierrez/vim-better-comments'
  Plug 'mhinz/vim-startify'
  Plug 'wakatime/vim-wakatime'
  Plug 'preservim/vimux'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'folke/trouble.nvim'
  Plug 'alvan/vim-closetag'
  Plug 'github/copilot.vim'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'ryanoasis/vim-devicons' " always load last one
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'gpanders/editorconfig.nvim'
  call plug#end()
endif
