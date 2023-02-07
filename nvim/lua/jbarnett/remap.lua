vim.g.mapleader = ","
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

-- moves line down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- moves line up
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- go to end of file
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- go to beginning of file
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- a
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")


