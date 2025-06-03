-- Neotree
vim.keymap.set('n', "-", "<cmd>Neotree float reveal<CR>", {desc="Open Neotree in float"});
vim.keymap.set('n', "_", "<cmd>Neotree float reveal toggle<CR>", {desc="Open Neotree in float"});

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Key visual selection when indenting
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Saving
vim.keymap.set('n', '<space>x', "<cmd>x<CR>")
vim.keymap.set('n', '<space>w', "<cmd>w<CR>")
vim.keymap.set('n', '<space>q', "<cmd>q<CR>")

