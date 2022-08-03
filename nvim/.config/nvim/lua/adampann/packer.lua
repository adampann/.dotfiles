-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- plugins for workflow 
  use 'christoomey/vim-tmux-navigator'
  use 'mbbill/undotree'

  -- Plugins that provide under the hood help
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  -- LSP, DAP, Linter, Formatter Manager
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'


  -- still need to find a better solution
  use 'sheerun/vim-polyglot'

  -- fuzzy file finder
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- color
  use 'tanvirtin/monokai.nvim'

  -- all hail all that is tpope
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'

  -- Git
  use 'airblade/vim-gitgutter'

  -- Nerdtree
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'

  -- Code Commenting
  use { 'kkoomen/vim-doge',
    run = ':call doge#install()',
    config = function()
      vim.g.doge_doc_standard_python = 'google'
    end,
    }

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'


end)
