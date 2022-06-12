-- set leader key
vim.g.mapleader = ' '

-- lua require('plugins')
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'scrooloose/nerdtree'

  -- tpope gives the good stuff
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'

  use 'mbbill/undotree'

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'}, {'nvim-treesitter/nvim-treesitter'} }
  }

end) 

-- functions to make remapping easier
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- keymappings. Should be moved to own file
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { })
vim.api.nvim_set_keymap('n', '<Leader>x', ':x<CR>', { })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { })
vim.api.nvim_set_keymap('n', '<Leader>,', ':nohlsearch<CR>', { })

-- general settings
vim.opt.incsearch=true           -- search as characters are entered
vim.opt.hlsearch=true            -- highlight matches
vim.opt.scrolloff=5            -- keep 3 lines when scrolling
vim.opt.nu=true        
vim.opt.rnu=true        


-- telescope
-- vim.api.nvim_set_keymap('nnoremap', '<leader>ff', '<cmd>lua require('telescope.builtin').find_files()<cr>', {})
nmap( "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" )
nmap( "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" )
nmap( "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" )
nmap( "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" )

require('telescope').setup({
  defaults = {
    layout_config = {
       width = 0.9
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})
require('telescope').load_extension('fzf')  -- must be faster telescope setup

