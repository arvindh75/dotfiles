-- sourcing config files.
require("settings")
require("plugins")
require("maps")
require("theme")
require("user_settings")

--vim.cmd [[
--   autocmd VimEnter * NvimTreeOpen
--    autocmd VimEnter * wincmd l
-- autocmd VimEnter * wincmd l
--]]

vim.cmd
[[
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh | :2 | startinsert
    autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c | :5 | startinsert
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp | :48 | startinsert
    autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex | :8 | startinsert
]]