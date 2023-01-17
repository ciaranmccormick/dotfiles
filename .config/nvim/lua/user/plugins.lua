local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugins
	use({ "wbthomason/packer.nvim" })
	-- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/popup.nvim" })
	-- Useful lua functions used by lots of plugins
	use({ "nvim-lua/plenary.nvim" })
	use({ "folke/which-key.nvim" })
	-- Color Scheme --
	use({ "tomasiser/vim-code-dark" })
	use("folke/lsp-colors.nvim")
	-- Start up time --
	use("lewis6991/impatient.nvim")
	-- Status Line --
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
  -- Ident Blankline --
	use("lukas-reineke/indent-blankline.nvim")
	-- cmp plugins --
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- snippets --
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP --
	use({ "williamboman/nvim-lsp-installer", requires = { "neovim/nvim-lspconfig" } }) -- simple to use language server installer
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Telescope --
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-project.nvim" })

	-- Treesitter --
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-autopairs" })

	-- Gitsigns --
	use({ "lewis6991/gitsigns.nvim" })

	-- Comments --
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- Nvim Tree --
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	use({ "Asheq/close-buffers.vim" })
	-- Toggle Term --
	use({ "akinsho/toggleterm.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
