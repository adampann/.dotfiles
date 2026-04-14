 return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Target the 0.12-compatible branch
    build = ":TSUpdate", -- Ensure parsers update with the plugin
    lazy = false, -- Treesitter initialization is sensitive to lazy-loading [4]
    opts = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "query", "python", "javascript", "typescript", "html", "git_rebase", "gitcommit", "gitignore", "rust", "terraform"},
      -- Feature activation
      highlight = { enable = true },
      indent = { enable = true },
      -- New main branch parameters
      sync_install = false, 
      auto_install = true, -- Install missing parsers on file open [11, 12, 16]
    },
    config = function(_, opts)
      -- Explicit call to setup is required to process 'ensure_installed' 
      require("nvim-treesitter").setup(opts)
    end,
  },
}
