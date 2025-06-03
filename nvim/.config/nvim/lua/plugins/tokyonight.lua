return {
  {
    "folke/tokyonight.nvim",
    enable=false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
	    vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "catppuccin/nvim",
    enable=true,
    name = "catppuccin",
    priority = 1000,
    config = function()
	vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
}
