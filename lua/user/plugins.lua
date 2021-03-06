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
	profile = {
		enable = true,
		threshold = 0,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Plugin Deps
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("antoinemadec/FixCursorHold.nvim")
	use("kevinhwang91/promise-async")

	-- Themes
	-- Theme
	use({
		"rmehri01/onenord.nvim",
		config = function()
			require("onenord").setup()
		end,
	})
	use({
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup()
		end,
	})

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("David-Kunz/cmp-npm")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("b0o/SchemaStore.nvim")
	use("ray-x/lsp_signature.nvim")
	use("folke/trouble.nvim")
	use("onsails/lspkind.nvim")
	use("glepnir/lspsaga.nvim")
	use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
	use("SmiteshP/nvim-navic")
	use("kevinhwang91/nvim-ufo")

	-- Rust Dev
	use({
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({})
		end,
	})
	use({
		"saecki/crates.nvim",
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
				},
			})
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-dap.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("SmiteshP/nvim-gps")

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Comments
	use("numToStr/Comment.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Nvim-Tree
	use({
		"kyazdani42/nvim-tree.lua",
		opt = true,
		cmd = { "NvimTreeToggle", "NvimTreeClose" },
		config = function()
			require("user.nvimtree")
		end,
	})

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Whitespace
	use("ntpeters/vim-better-whitespace")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Speed
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use("dstein64/vim-startuptime")

	-- Indent Line
	use("lukas-reineke/indent-blankline.nvim")

	-- Alpha
	use({
		"goolord/alpha-nvim",
		config = function()
			require("user.alpha")
		end,
	})

	-- Keymaps
	use("folke/which-key.nvim")
	use("mrjones2014/legendary.nvim")

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
	use("ghillb/cybu.nvim")

	-- Undo Tree
	use("mbbill/undotree")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
