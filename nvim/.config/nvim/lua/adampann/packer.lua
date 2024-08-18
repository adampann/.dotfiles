
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
  use { "nvim-neotest/nvim-nio" }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'
  -- DAP js debugging
  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} } -- testing
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }
  use 'David-Kunz/jester' -- used to start jest tests -- testing

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "ray-x/lsp_signature.nvim" -- Testing

  -- LSP - Rust
  use 'mrcjkb/rustaceanvim' -- testing

  use 'folke/neodev.nvim' -- TODO not sure if this is actually setup

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
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }
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
  -- use 'airblade/vim-gitgutter'
  use 'lewis6991/gitsigns.nvim'

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
  use 'prisma/vim-prisma' -- Adding prisma file detection

  -- Markdown
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- tmux resurect
  use 'tpope/vim-obsession'

  -- Fidget
  use { 'j-hui/fidget.nvim' }

  -- Diagnostics
  use { 'folke/trouble.nvim' }
end)
