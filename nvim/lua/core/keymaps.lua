vim.g.mapleader = " "
local keymap = vim.keymap

------Keymap------
vim.keymap.set('i', '<leader><leader>', '<Esc>', { silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'h', '<Left>', { silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'j', '<Down>', { silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'k', '<Up>', { silent = true })
vim.keymap.set({'n', 'v', 'o'}, 'l', '<Right>', { silent = true })
vim.keymap.set("n", "<A-Down>", "<cmd>m .+1<CR>==", { desc = "將該行下移" })
vim.keymap.set("n", "<A-Up>", "<cmd>m .-2<CR>==", { desc = "將該行上移" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "將選取區塊下移" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "將選取區塊上移" })
                             
------Plugins------
keymap.set('n', '<leader>f', ':Neotree toggle<CR>', { silent = true })
keymap.set("n", "<leader><F5>", ":IncRename ")

keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { silent = true })
keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { silent = true })
keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { silent = true })
keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { silent = true })
keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { silent = true })
keymap.set('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { silent = true })
keymap.set('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { silent = true })
keymap.set('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { silent = true })
keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { silent = true })
keymap.set('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>', { silent = true })
