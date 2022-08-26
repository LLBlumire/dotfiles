return function()
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "rust_analyzer", "sumneko_lua" },
	})
	local lspconfig = require("lspconfig")
    local coq = require("coq").lsp_ensure_capabilities({}).capabilities
	lspconfig.sumneko_lua.setup({
        capabilities = coq,
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	})
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
		},
	})
end
