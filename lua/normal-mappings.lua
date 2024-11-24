local utils = require("plugins.utils")
local is_available = utils.is_available

local inorekey = utils.inorekey
local norekey = utils.norekey
local xnorekey = utils.xnorekey


-------------------------------------------------------------------------------
--  Insert Mode
-------------------------------------------------------------------------------
--  jk      ->  切换到普通模式
inorekey("jk", "<Esc>", "Switch to normal mode")
--  Ctrl+s  ->  保存
inorekey("<C-s>", function() vim.cmd("w") end, "Save the file")
--  Ctrl+S  ->  格式化并保存
inorekey("<C-S>", function()
    vim.lsp.buf.format()
    vim.cmd("w")
end, "Format and save the file")

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--  Normal Mode
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



------------------------------------------------------------------nvim, neovim-
--  fm      ->  格式化
norekey("fm", function() vim.lsp.buf.format() end, "Fomat the document")
--  Ctrl+s  ->  格式化并保存
norekey("<C-s>", ":w<CR>", "Format and save the file")
--  Ctrl+l  ->  跳转到最近编辑的缓冲区
norekey("<C-l>", ":b#<CR>", "Switch to the buffer just edited")
--  nh      ->  取消搜索之后的高亮[no highlight]
norekey("nh", ":noh<CR>", "No highlight")
--  rp      ->  当前文件中替换所有[replace]
vim.keymap.set("n", "rp", ":%s/", { desc = "Replace in file" })
--  bd      ->  删除缓冲区
vim.keymap.set("n", "bd", "bd ", { desc = "Delete buffer (...)" })
--  bD      ->  删除当前缓冲区
norekey("bD", ":bd<CR>", "Delete current buffer")




-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--  Visual Mode
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



--  jk      ->  切换到普通模式
xnorekey("jk", "<Esc>", "Switch to normal mode")
