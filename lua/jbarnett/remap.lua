-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ","
--
-- moves line down
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--
-- -- moves line up
-- vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
--
-- vim.keymap.set("n", "J", "mzJ`z")

-- go to end of file
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Move down half a screen and stay centered" })

-- go to beginning of file
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Move up half a screen and stay centered" })

-- No idea what these were supposed to do, but they don't work
-- vim.keymap.set("n", "n", "nzzzv")
--
-- vim.keymap.set("n", "N", "Nzzzv")

-- Vim with me stuff
-- vim.keymap.set("n", "<leader>vwm", function()
--   require("vim-with-me").StartVimWithMe()
-- end)
--
-- vim.keymap.set("n", "<leader>svwm", function()
--   require("vim-with-me").StopVimWithMe()
-- end)

local map = function(type, key, value)
  vim.fn.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true });
end

vim.keymap.set("x", "<leader>p", "\"_dP")
-- vim.keymap.set('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
-- vim.keymap.set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
-- map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
-- map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
--
local custom_attach = function(client)
	print("LSP started.");
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)

	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end
