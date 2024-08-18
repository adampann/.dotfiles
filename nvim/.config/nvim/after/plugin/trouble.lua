require('trouble').setup({})

vim.keymap.set("n", "<leader>tx",  "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)"})

