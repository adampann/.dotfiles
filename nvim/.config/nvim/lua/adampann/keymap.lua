-- functions to make remapping easier
function map(mode, shortcut, command, opts)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command, opts)
  map('n', shortcut, command)
end

function imap(shortcut, command, opts)
  map('i', shortcut, command)
end

-- Basic Vim keymaps
nmap( '<Leader>q', ':q<CR>', { })
nmap( '<Leader>x', ':x<CR>', { })
nmap( '<Leader>w', ':w<CR>', { })
nmap( '<Leader>,', ':nohlsearch<CR>', { })
nmap( '[q', ':cprevious<CR>', { }) -- Taken from tpope/vim-unimpaired
nmap( ']q', ':cnext<CR>', { }) -- Taken from tpope/vim-unimpaired

-- Undo
nmap( "<leader>u", ":UndotreeShow<CR>", {})

-- telescope
nmap( "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>" )
nmap( "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>" )
nmap( "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>" )
nmap( "<leader>fl", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy=\"ascending\", layout_config={prompt_position=\"top\"}})<cr>" )
nmap( "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>" )
nmap( "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>" )
nmap( "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>" )

-- Fugitive
nmap( "<leader>gs", ":G<CR>", {})
nmap( "<leader>gj", ":diffget //3<CR>", {})
nmap( "<leader>gf", ":diffget //2<CR>", {})
nmap( "<leader>gb", ":Git blame<CR>", {})


-- NERDtree commands
nmap( "<leader>nn", ":NERDTreeToggle<CR>", {})
nmap( "<Leader>nf", ":NERDTreeFind<CR>", {})

-- null-ls
nmap( "<leader>fm", ":lua vim.lsp.format()", {})
