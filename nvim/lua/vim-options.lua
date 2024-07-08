vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Same for `maplocalleader`

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.title = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2

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
vim.opt.updatetime = 500
vim.opt.timeoutlen = 250
vim.opt.inccommand = "split"
vim.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.path:append({"**"})
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"
vim.opt.wildignore:append({"*/node_modules/*"})

vim.keymap.set("n", "<leader>w", "<CMD>w<CR>", { desc = "Save", noremap = true, silent = true  })
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", { desc = "Quit", noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", ":qa<CR>", { desc = "Quit", noremap = true, silent = true })

vim.keymap.set("n", "<leader>,", "<C-^>", { desc = "Alternate file" })
vim.keymap.set("n", "<leader>P", ":bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable entering Ex mode" })
vim.keymap.set("n", "<CR>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-S-r>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
  { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
  { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
  { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<C-f>", "<C-f>zz",
  { desc = "Move down half a screen and stay centered" })
vim.keymap.set("n", "<C-b>", "<C-b>zz",
  { desc = "Move up half a screen and stay centered" })

