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
  use "jose-elias-alvarez/null-ls.nvim"

  -- DAP
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'
  -- was trying to use lua-json5 to be able to use the same debugger files as vscode
  -- use {
  --   'Joakker/lua-json5',
  --   -- run = './install.sh'
  -- }

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets (used by LuaSnip)
  use 'rafamadriz/friendly-snippets'

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'kdheepak/tabline.nvim',
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  -- still need to find a better solution
  use 'sheerun/vim-polyglot'

  -- fuzzy file finder
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-telescope/telescope-dap.nvim'

  -- color
  use { "ellisonleao/gruvbox.nvim" }
  -- use 'tanvirtin/monokai.nvim'
  -- use 'folke/tokyonight.nvim'

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
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'nvim-treesitter/playground'


end)
