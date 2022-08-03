--     _       _                 
--    / \   __| | __ _ _ __ ___  
--   / _ \ / _` |/ _` | '_ ` _ \ 
--  / ___ \ (_| | (_| | | | | | |
-- /_/__ \_\__,_|\__,_|_| |_| |_|
-- |  _ \ __ _ _ __  _ __        
-- | |_) / _` | '_ \| '_ \       
-- |  __/ (_| | | | | | | |      
-- |_|   \__,_|_| |_|_| |_|      
--                               
--
require("adampann")

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]
