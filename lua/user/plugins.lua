local fn = vim.fn

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

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Plugin Deps
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("antoinemadec/FixCursorHold.nvim")

	-- Themes
	use("shaunsingh/nord.nvim")
	use("folke/lsp-colors.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("David-Kunz/cmp-npm")
	use("zbirenbaum/copilot-cmp")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("b0o/SchemaStore.nvim")
	use("ray-x/lsp_signature.nvim")
	-- use("github/copilot.vim") -- ENABLE ON FIRST TIME ONLY!
	use("zbirenbaum/copilot.lua")
	use("folke/trouble.nvim")
	use("onsails/lspkind.nvim")
	use("glepnir/lspsaga.nvim")
	use("Maan2003/lsp_lines.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-dap.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Comments
	use("numToStr/Comment.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Nvim-Tree
	use("kyazdani42/nvim-tree.lua")

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Whitespace
	use("ntpeters/vim-better-whitespace")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Impatient
	use("lewis6991/impatient.nvim")

	-- Indent Line
	use("lukas-reineke/indent-blankline.nvim")

	-- Alpha
	use("goolord/alpha-nvim")

	-- WhichKey
	use("folke/which-key.nvim")

	-- Illuminate
	use("RRethy/vim-illuminate")

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")

	-- Wakatime
	use("wakatime/vim-wakatime")

	-- Discord
	use("andweeb/presence.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")

	-- Spectre
	use("windwp/nvim-spectre")

	-- Notify
	use("rcarriga/nvim-notify")

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- UI
	use("stevearc/dressing.nvim")

	-- Undo Tree
	use("mbbill/undotree")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
