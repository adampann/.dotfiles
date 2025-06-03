vim.opt.number = true
vim.opt.relativenumber = true

-- intent/tab stuff
-- vim.opt.autoindent = false
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4 -- Ammount of indent w/ << & >>
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.mouse='a'
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.diffopt='vertical'

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- diagnostic
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, })

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
