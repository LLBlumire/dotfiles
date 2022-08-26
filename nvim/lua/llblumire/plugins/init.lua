require("llblumire.plugins.packer__bootstrap")

local config = require("llblumire.plugins.config")
local packer = require("packer")

local function load_plugins(use)
	use({
		{ "wbthomason/packer.nvim" },
        { "kyazdani42/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "EdenEast/nightfox.nvim", config = config.nightfox },
		{ "williamboman/mason-lspconfig.nvim" },
        { "ms-jpq/coq.artifacts" },
        { "ms-jpq/coq.thirdparty" },
        { "ms-jpq/coq_nvim", run = "python3 -m coq deps" },
		{ "neovim/nvim-lspconfig" },
		{ "mfussenegger/nvim-dap" },
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "williamboman/mason.nvim", config = config.mason },
        { "simrat39/rust-tools.nvim", config = config.rust_tools },
		{ "nvim-treesitter/nvim-treesitter", run = config.treesitter.run, config = config.treesitter.cfg },
		{ "nvim-lualine/lualine.nvim", config = config.lualine },
		{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = config.lsp_lines },
		{ "j-hui/fidget.nvim", config = config.fidget },
		{ "akinsho/bufferline.nvim", tag = "v2.*", config = config.bufferline },
		{ "kyazdani42/nvim-tree.lua", tag = "nightly", config = config.nvim_tree },
        { "nvim-telescope/telescope.nvim", tag = "0.1.0", config = config.telescope },
        { "stevearc/dressing.nvim", config = config.dressing },
        { "kosayoda/nvim-lightbulb", config = config.nvim_lightbulb },
        { "Pocco81/true-zen.nvim", config = config.true_zen },
	})
end

return packer.startup(load_plugins)
