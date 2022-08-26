local M = {}

M.run = function()
	require("nvim-treesitter.install").update({ with_sync = true })
end
M.cfg = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "rust" },
		sync_install = false,
	})
end

return M
