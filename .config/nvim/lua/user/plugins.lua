-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")
-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugins --
	use({ "wbthomason/packer.nvim" })

	-- Useful lua functions used by lots of plugins
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	-- Color scheme --
	use({ "tomasiser/vim-code-dark" })
	use({ "folke/tokyonight.nvim" })
	use({ "bluz71/vim-moonfly-colors" })

	-- Status Line --
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- WhichKey --
	use({ "folke/which-key.nvim" })

	-- LSP Support --
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "mfussenegger/nvim-jdtls" })

  -- DAP Support --
  use({"mfussenegger/nvim-dap"})
  use({"mfussenegger/nvim-dap-python"})

	-- Autocompletion --
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets --
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Telescope --
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-project.nvim" })

	-- Treesitter --
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-autopairs" })

	-- Nvim Tree --
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Comment --
	use({ "numToStr/Comment.nvim" })

	-- Gitsigns --
	use({ "lewis6991/gitsigns.nvim" })

	-- Toggle Terminal
	use({ "akinsho/toggleterm.nvim" })

end)
