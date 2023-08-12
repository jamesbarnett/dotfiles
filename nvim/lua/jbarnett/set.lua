vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- We are going to roll without for awhile...
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
-- highlight Cursor guifg=white guibg=black
-- highlight iCursor guifg=white guibg=steelblue

local cursoropts = "n-v-c-sm:block-Cursor-blinkon100-blink0ff100,"
cursoropts = cursoropts .. "i-ci-ve:ver25-iCursor-blinkwait175-blinkon200-blinkoff175,r-cr-o:hor20"
vim.opt.guicursor = cursoropts

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = ","

