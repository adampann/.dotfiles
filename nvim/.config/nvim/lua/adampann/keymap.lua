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


-- dap
nmap( "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {})
nmap( "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
nmap( "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {})
nmap( "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", {})
nmap( "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", {})
nmap( "<F5>", "<Cmd>lua require'dap'.continue()<CR>", {})
nmap( "<F1>", "<Cmd>lua require'dap'.step_over()<CR>", {})
nmap( "<F2>", "<Cmd>lua require'dap'.step_into()<CR>", {})
nmap( "<F3>", "<Cmd>lua require'dap'.step_out()<CR>", {})
-- dap - python
nmap( "<leader>dm", ":lua require('dap-python').test_method()<CR>", {})
nmap( "<leader>dc", ":lua require('dap-python').test_class()<CR>", {})
nmap( "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>", {})
