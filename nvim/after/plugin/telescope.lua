local builtin = require('telescope.builtin')

vim.keymap.set('i', '<leader>w', '<C-o>:w<CR>',
               { desc = [[Gonna need to disbable this to type ',w' (no space)]] })
vim.keymap.set('n', '<leader>w', ':w<CR>',
               { desc = 'Save File', noremap = true })

-- I want a way to quickly start working on my config. This is the event handler
-- for that.
local edit_vim_config = function()
  vim.cmd ":cd ~/.config/nvim"

  builtin.find_files()

end

local grep_handler = function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") },
                      { desc = "Greppin' yer project!" })
end

vim.keymap.set('n', '<leader>t',
               builtin.find_files,
               { desc = "Find files starting in current directory" })

vim.keymap.set('n', '<C-p>', builtin.git_files,
               { desc = "File files in your git repo" })

vim.keymap.set('n', '<leader>ec', edit_vim_config,
               { desc = "Yer config needs editin'!" })

vim.keymap.set('n', '<leader>fs', grep_handler)

vim.keymap.set('n', 'Q', '<Nop>')

vim.keymap.set('n', '<C-l>', '<C-W>l', 
               { desc = 'Move the cursor a window right' })
vim.keymap.set('n', '<C-h>', '<C-W>h', 
               { desc = 'Move the cursor a window left' })
vim.keymap.set('n', '<C-j>', '<C-W>j', 
               { desc = 'Move the cursor a window down' })
vim.keymap.set('n', '<C-k>', '<C-W>k',
               { desc = 'Move the cursor a window up' })
vim.keymap.set('n', '<leader><leader>', '<C-^>',
               { desc = 'Alternate file' })
vim.keymap.set('i', '<S-Right>', '<ESC><C-v>l',
               { desc = 'Experimental insert/visual stuff' })
vim.keymap.set('i', '<S-Left>', '<ESC><C-v>h',
               { desc = 'Experimental insert/visual stuff' })
vim.keymap.set('i', '<S-Down>', '<ESC><C-v>j',
               { desc = 'Experimental insert/visual stuff' })
vim.keymap.set('i', '<S-Up>', '<ESC><C-v>k',
               { desc = 'Experimental insert/visual stuff' })
vim.keymap.set('n', '<leader><leader>', '<C-^>', { desc = 'Previous/toggle files' })
