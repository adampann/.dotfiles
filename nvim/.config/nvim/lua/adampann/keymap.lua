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

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Undo
nmap( "<leader>u", ":UndotreeToggle<CR>", {})

-- telescope
nmap( "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>" )
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
nmap( "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {})
nmap( "<Leader>dB", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
nmap( "<leader>dlp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {})
nmap( "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", {})
nmap( "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", {})
nmap( "<leader>dc", "<Cmd>lua require'dap'.continue()<CR>", {})
nmap( "<leader>dso", "<Cmd>lua require'dap'.step_over()<CR>", {})
nmap( "<leader>dsi", "<Cmd>lua require'dap'.step_into()<CR>", {})
nmap( "<leader>dsO", "<Cmd>lua require'dap'.step_out()<CR>", {})

-- dap telescope
nmap( "<leader>fdb", "<Cmd>Telescope dap list_breakpoints<CR>", {})

-- jester
vim.keymap.set("n", "<leader>rt", "<cmd>lua require'jester'.run()<CR>", { desc = "Run nearest test(s) under the cursor" })
vim.keymap.set("n", "<leader>rf", "<cmd>lua require'jester'.run_file()<CR>", { desc = "Run current file" })
vim.keymap.set("n", "<leader>rl", "<cmd>lua require'jester'.run_last()<CR>", { desc = "Run last test(s)" })


vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", { desc = "Toggle dap UI" })


-- dap - python
-- nmap( "<leader>dm", ":lua require('dap-python').test_method()<CR>", {})
-- nmap( "<leader>dc", ":lua require('dap-python').test_class()<CR>", {})
-- nmap( "<leader>ds", "<ESC>:lua require('dap-python').debug_selection()<CR>", {})
