local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	-- 'elixir-ls',
	'rust_analyzer',
  'pyright',
})

local cmp = require('cmp')

local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

-- Is this redundant
lsp.on_attach(function(client,  bufnr)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
end)

lsp.setup()

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local lexical_config = {
	filetypes = { "elixir", "eelixir", },
	cmd = { "/home/jbarnett/code/lexical/_build/dev/rel/lexical/start_lexical.sh" },
	settings = {},
}

require("elixir").setup({
	nextls = {enable = false},
	credo = {enable = true},
	elixirls = {enable = true},
})

if not configs.lexical then
	configs.lexical = {
		default_config = {
			filetypes = lexical_config.filetypes,
			cmd = lexical_config.cmd,
			root_dir = function(fname)
				return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
			end,
			-- optional settings
			settings = lexical_config.settings,
		},
	}
end

lspconfig.lexical.setup({})
