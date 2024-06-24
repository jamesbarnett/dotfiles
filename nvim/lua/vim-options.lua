vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Same for `maplocalleader`
vim.opt.swapfile = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.numberwidth = 6
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 12

vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.updatetime = 50

vim.keymap.set("n", "<leader>,", "<C-^>", { desc = "Alternate file" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>p", ":bprev<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>P", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable entering Ex mode" })
vim.keymap.set("n", "<CR>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Move down half a screen and stay centered" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Move up half a screen and stay centered" })
