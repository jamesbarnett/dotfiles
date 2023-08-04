local dap = require"dap"
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

vim.api.nvim_set_keymap('n', '<F8>', [[:lua require"dap".toggle_breakpoint()<CR>]],
	{ noremap = true, desc = "Debugger: Toggle breakpoint" })
vim.api.nvim_set_keymap('n', '<F9>', [[:lua require"dap".continue()<CR>]],
	{ noremap = true, desc = "Debugger: Continue" })
vim.api.nvim_set_keymap('n', '<F10>', [[:lua require"dap".step_over()<CR>]],
	{ noremap = true, desc = "Debugger: Step over" })
vim.api.nvim_set_keymap('n', '<S-F10>', [[:lua require"dap".step_into()<CR>]],
	{ noremap = true, desc = "Debugger: Step Into" })
vim.api.nvim_set_keymap('n', '<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]],
	{ noremap = true, desc = "Debugger: Some hover info" })
vim.api.nvim_set_keymap('n', '<F5>',
	[[:lua require"osv".launch({port = 8086, desc = "Debugger: Launch"})<CR>]], { noremap = true })
