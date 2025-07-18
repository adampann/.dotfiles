require("config.lazy")
require("config.options")
require("config.keymap")

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
