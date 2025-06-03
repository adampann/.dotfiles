return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "query", "python", "javascript", "typescript", "html", "git_rebase", "gitcommit", "gitignore", "rust", "terraform"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
