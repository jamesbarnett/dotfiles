local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use {
	  "max397574/better-escape.nvim",
	  config = function()
		  require("better_escape").setup()
	  end,
  }
  use({
	  "bluz71/vim-nightfly-colors",
	  as = "nightfly",
	  config = function()
		  -- vim.cmd [[colorscheme nightfly]]
	  end
  })
  use({'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd [[colorscheme kanagawa]]
    end
  })
  use({
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  })
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-eunuch')
  use('terrortylor/nvim-comment')
  use('ggandor/leap.nvim')
  require('leap').add_default_mappings()
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.api.nvim_command, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip',
        run = "make install_jsregexp",
      },     -- Required
    }
  })
  use('jbyuki/one-small-step-for-vimkind')
  use('mfussenegger/nvim-dap')
  use({
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use('tomblind/local-lua-debugger-vscode')
  use({ "elixir-tools/elixir-tools.nvim", tag = "stable",
  requires = { "nvim-lua/plenary.nvim" }})
  use({
    'goolord/alpha-nvim',
    config = function()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  })
  use({'Olical/conjure'})
  use({'benknoble/vim-racket'})
  use({'lfe/vim-lfe'})
  use({
    "julienvincent/nvim-paredit",
    config = function()
      require("nvim-paredit").setup({
        use_default_keys = true,
        filetypes = { "clojure", "lisp", },
        cursor_behaviour = "auto", -- remain, follow, auto
        indent = {
          enabled = false,
          indentor = require("nvim-paredit.indentation.native").indentor,
        }
      })
    end,
  })
  use({'krady21/compiler-explorer.nvim'})

  if packer_bootstrap then
    require('packer').sync()
  end
end)

